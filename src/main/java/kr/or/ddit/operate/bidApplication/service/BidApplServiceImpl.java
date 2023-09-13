package kr.or.ddit.operate.bidApplication.service;

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
import kr.or.ddit.operate.bidApplication.dao.BidApplDAO;
import kr.or.ddit.operate.vo.bidApplicationVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class BidApplServiceImpl implements BidApplService {
	
	@Inject
	private BidApplDAO dao;
	
	@Inject
	private AtchFileService atchService;
	
	@Value("#{appInfo.baAtchPath}")
	private Resource atchPath;
	
	@Override
	public List<bidApplicationVO> retrieveBaList(PaginationInfo paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectBaList(paging);
	}
	
	@Override
	public bidApplicationVO retrieveBa(String baId) {
		return dao.selectBa(baId);
		
		
	}
	
	private void processAtchFileGroup(bidApplicationVO ba) {
		MultipartFile[] baFiles = ba.getBaFiles();
		if(baFiles == null) return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for(MultipartFile baFile : baFiles) {
			if (baFile.isEmpty()) continue;
			detailList.add(new AtchFileDetailVO(baFile));
		}
		if(detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);
			
			try {
				if (StringUtils.isNotBlank(ba.getAtchFileId())) {
					atchService.removeAtchFileGroup(ba.getAtchFileId(), atchPath);
				}
				fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
				atchService.createAtchFileGroup(fileGroup, atchPath);
				ba.setAtchFileId(fileGroup.getAtchFileId());
				fileGroup.setAtchFileId(ba.getAtchFileId());
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}

	@Override
	public boolean createBa(bidApplicationVO ba) {
		processAtchFileGroup(ba);
		return dao.insertBa(ba) > 0;
	}


	@Override
	public boolean modifyBa(bidApplicationVO ba) {
		processAtchFileGroup(ba);
		return dao.updateBa(ba) > 0 ;
	}
	
	@Override
	public boolean removeBa(String baId) {
		bidApplicationVO ba = dao.selectBa(baId);
		boolean success = true;
		if(ba.getAtchFileId() != null) {
			try {
				success = atchService.removeAtchFileGroup(ba.getAtchFileId(), atchPath);
			}catch(IOException e) {
				throw new RuntimeException(e);
			}
		}
		if(success) {
			return dao.deleteBa(baId) > 0;
		}
		return false;
	}

	@Override
	public boolean modifyBaStatus(bidApplicationVO ba) {
		return dao.updateBaStatus(ba) > 0;
	}

	@Override
	public List<bidApplicationVO> retrieveNoBaList(int bnNo) {
		return dao.selectNoBaList(bnNo);
	}






}
