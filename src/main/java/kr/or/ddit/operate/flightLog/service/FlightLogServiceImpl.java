package kr.or.ddit.operate.flightLog.service;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.operate.flightLog.dao.FlightLogDAO;
import kr.or.ddit.operate.vo.flightLogVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class FlightLogServiceImpl implements FlightLogService {

	@Inject
	private FlightLogDAO fLogDao;

	@Inject
	private AtchFileService atchService;
	
	@Value("#{appInfo.flAtchPath}")
	private Resource atchPath;

	@Override
	public List<flightLogVO> retrieveList(PaginationInfo paging) {
		long totalRecord = fLogDao.selectTotalRecord();
		paging.setTotalRecord(totalRecord);
		return fLogDao.selectList(paging);
	}

	@Override
	public flightLogVO retrieveOne(String flId) throws PKNotFoundException {
		flightLogVO fLog = fLogDao.selectOne(flId);
		if (fLog == null)
			throw new PKNotFoundException(MessageFormat.format("해당하는 일지없음 : {}", flId));
		return fLog;
	}

	
	private void processAtchFileGroup(flightLogVO fLog) {
		MultipartFile[] flFiles = fLog.getFlFiles();
		if (flFiles == null) return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for (MultipartFile flFile : flFiles) {
			if (flFile.isEmpty()) continue;
			detailList.add(new AtchFileDetailVO(flFile));
		}
		if (detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);
			// 1. 첨부파일의 메타 데이터 저장
			// 2. 첨부파일의 2진 데이터 저장
			try {
				if (StringUtils.isNotBlank(fLog.getAtchFileId())) {
					// 운항일지 수정인경우 첨부파일 데이터 전부 삭제하고 다시 생성
					atchService.removeAtchFileGroup(fLog.getAtchFileId(), atchPath);
				}
				// 운항일지 작성
				fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
				atchService.createAtchFileGroup(fileGroup, atchPath);
				fLog.setAtchFileId(fileGroup.getAtchFileId());
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	

	@Override
	public boolean createLog(flightLogVO log) {
		processAtchFileGroup(log);
		return fLogDao.insertLog(log) > 0;
	}

	@Override
	public boolean modifyLog(flightLogVO log) {
		processAtchFileGroup(log);
		return fLogDao.updateLog(log) > 0;
	}

	@Override
	public boolean removeLog(String flId) {
		flightLogVO fLog = fLogDao.selectOne(flId);
		boolean success = true;
		if (fLog.getAtchFileId() != null) {
			try {
				success = atchService.removeAtchFileGroup(fLog.getAtchFileId(), atchPath);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		if (success) {
			return fLogDao.deleteLog(flId) > 0;
		}
		return false;
	}	
}
