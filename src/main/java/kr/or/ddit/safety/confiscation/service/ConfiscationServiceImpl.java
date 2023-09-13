package kr.or.ddit.safety.confiscation.service;

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

import kr.or.ddit.atch.dao.AtchFileDAO;
import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.operate.vo.flightLogVO;
import kr.or.ddit.safety.confiscation.dao.ConfiscationDAO;
import kr.or.ddit.safety.vo.ConfiscationVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class ConfiscationServiceImpl implements ConfiscationService {
	
	@Inject
	private ConfiscationDAO dao;
	
	@Inject
	private AtchFileService atchService;
	
	@Value("#{appInfo.disAtchPath}")
	private Resource atchPath;
	
	
	private void processAtchFileGroup(ConfiscationVO confis) {
		MultipartFile[] flFiles = confis.getFlFiles();
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
				if (StringUtils.isNotBlank(confis.getCsImg())) {
					atchService.removeAtchFileGroup(confis.getCsId(), atchPath);
				}
				fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
				atchService.createAtchFileGroup(fileGroup, atchPath);
				confis.setCsImg(fileGroup.getAtchFileId());
				fileGroup.setAtchFileId(confis.getAtchFileId());
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	

	//등록
	@Override
	public ServiceResult createConfiscation(ConfiscationVO confis) {
		return dao.insertConfiscation(confis) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	//전체조회
	@Override
	public List<ConfiscationVO> retrieveConfisList(PaginationInfo paging) {
		
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectConfiscationList(paging);
	}

	
	//상세조회
	@Override
	public ConfiscationVO retrieveConfiscation(String csId) {
		
		ConfiscationVO confis = dao.selectConfiscation(csId);
		if(confis==null) {
			throw new PKNotFoundException(MessageFormat.format("{0} 압수품 없음", csId));
		}
		return confis;
	}

	//수정
	@Override
	public ServiceResult modifyConfiscation(ConfiscationVO confis) {
		return dao.updateConfiscation(confis) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	//삭제
	@Override
	public ServiceResult removeConfiscation(String csId) {
		return dao.deleteConfiscation(csId) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	} 
	
	//상태변경
	public ServiceResult modifyconfisMthd(ConfiscationVO confis) {
		return dao.updateConfisMthd(confis) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	//압수품 폐기등록
	@Override
	public ServiceResult modifyconfisDisposal(ConfiscationVO confis) {
		processAtchFileGroup(confis);
		return dao.updateDisposal(confis) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}


	// 압수품(폐기) 전체조회
	@Override
	public List<ConfiscationVO> retrieveDisposal(PaginationInfo paging) {
		long totalRecord = dao.selectDisposalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectDisposalList(paging);
	}


	// 압수품(폐기) 상세조회
	@Override
	public ConfiscationVO retriveDisposalOne(String csId) {
		ConfiscationVO confis = dao.selectDisposalOne(csId);
		if(confis==null) {
			throw new PKNotFoundException(MessageFormat.format("{0} 압수품페기 없음", csId));
		}
		return confis;
	}


	// 압수품(폐기) 수정
	@Override
	public ServiceResult modifyDisposalImg(ConfiscationVO confis) {
		processAtchFileGroup(confis);
		return dao.updateDisposalImg(confis) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}


	// 압수품리스트 총개수 
	@Override
	public long countTotal(PaginationInfo paging) {
		return dao.selectTotalRecord(paging);
	}


	// 압수품폐기 리스트 총개수 
	@Override
	public long disCountTotal(PaginationInfo paging) {
		return dao.selectDisposalRecord(paging);
	}
	


}
