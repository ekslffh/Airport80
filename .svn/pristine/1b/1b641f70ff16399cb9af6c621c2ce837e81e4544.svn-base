package kr.or.ddit.operate.custNoticeBrd.service;

import java.io.IOException;
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
import kr.or.ddit.operate.custNoticeBrd.dao.CustNoticeBrdDAO;
import kr.or.ddit.operate.vo.CustNoticeBrdVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class CustNoticeBrdServiceImpl implements CustNoticeBrdService{
	
	@Inject
	private CustNoticeBrdDAO dao;
	
	@Inject
	private AtchFileService atchService;
	
	@Value("#{appInfo.cnbAtchPath}")
	private Resource atchPath;

	
	@Override
	public List<CustNoticeBrdVO> retrieveCnbList(PaginationInfo paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectCnbList(paging);
	}

	@Override
	public CustNoticeBrdVO retrieveCnb(int cnbNo) {
		return dao.selectCnb(cnbNo);
	}
	
	private void processAtchFileGroup(CustNoticeBrdVO cnb) {
		MultipartFile[] cnbFiles = cnb.getCnbFiles();
		if (cnbFiles == null) return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for (MultipartFile cnbFile : cnbFiles) {
			if (cnbFile.isEmpty()) continue;
			detailList.add(new AtchFileDetailVO(cnbFile));
		}
		if (detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);
			// 1. 첨부파일의 메타 데이터 저장
			// 2. 첨부파일의 2진 데이터 저장
			try {
				if (StringUtils.isNotBlank(cnb.getAtchFileId())) {
					atchService.removeAtchFileGroup(cnb.getAtchFileId(), atchPath);
				}
				fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
				atchService.createAtchFileGroup(fileGroup, atchPath);
				cnb.setAtchFileId(fileGroup.getAtchFileId());
				fileGroup.setAtchFileId(cnb.getAtchFileId());
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	@Override
	public boolean createCnb(CustNoticeBrdVO cnb) {
		processAtchFileGroup(cnb);
		return dao.insertCnb(cnb) > 0;
	}


	@Override
	public boolean modifyCnb(CustNoticeBrdVO cnb) {
		processAtchFileGroup(cnb);
		return dao.updateCnb(cnb) > 0;
	}

	@Override
	public boolean removeCnb(int cnbNo) {
		CustNoticeBrdVO cnb = dao.selectCnb(cnbNo);
		boolean success = true;
		if(cnb.getAtchFileId() != null) {
			try {
				success = atchService.removeAtchFileGroup(cnb.getAtchFileId(), atchPath);
			}catch(IOException e) {
				throw new RuntimeException(e);
			}
		}
		if(success) {
			return dao.deleteCnb(cnbNo) > 0;
		}
		return false;
	}

	@Override
	public void increaseViews(int cnbVws) {
		dao.increaseViews(cnbVws);
	}





}
