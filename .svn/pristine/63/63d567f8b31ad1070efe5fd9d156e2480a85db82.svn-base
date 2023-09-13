package kr.or.ddit.operate.bidNotice.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.Resource;
import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.operate.bidNotice.dao.BidNoticeDAO;
import kr.or.ddit.operate.vo.bidNoticeVO;

@Service
public class BidNoticeServiceImpl implements BidNoticeService{
	
	@Inject
	private BidNoticeDAO dao;
	
	@Inject
	private AtchFileService atchService;
	
	@Value("#{appInfo.bnAtchPath}")
	private Resource atchPath;
	
	// processAtchFileGroup
	private void processAtchFileGroup(bidNoticeVO bn) {
			MultipartFile[] bnFiles = bn.getBnFiles();
			if (bnFiles == null) return;
			List<AtchFileDetailVO> detailList = new ArrayList<>();
			for (MultipartFile bnFile : bnFiles) {
				if (bnFile.isEmpty()) continue;
				detailList.add(new AtchFileDetailVO(bnFile));
			}
			if (detailList.size() > 0) {
				AtchFileVO fileGroup = new AtchFileVO();
				fileGroup.setDetailList(detailList);
				// 1. 첨부파일의 메타 데이터 저장
				// 2. 첨부파일의 2진 데이터 저장
				try {
					if (StringUtils.isNotBlank(bn.getAtchFileId())) {
						
						atchService.removeAtchFileGroup(bn.getAtchFileId(), atchPath);
					}

					fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
					atchService.createAtchFileGroup(fileGroup, atchPath);
					bn.setAtchFileId(fileGroup.getAtchFileId());
					fileGroup.setAtchFileId(bn.getAtchFileId());
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
		}	
	
	

	@Override
	public boolean createBn(bidNoticeVO bn) {
		processAtchFileGroup(bn);
		return dao.insertBn(bn) > 0 ;
	}

	@Override
	public List<bidNoticeVO> retrieveBnList() {
//		long totalRecord = dao.selectTotalRecord(paging);
//		paging.setTotalRecord(totalRecord);
		return dao.selectBnList();
	}

	@Override
	public bidNoticeVO retrieveBn(int bnNo) {
		return dao.selectBn(bnNo);
	}
	
	@Override
	public boolean modifyBn(bidNoticeVO bn) {
		processAtchFileGroup(bn);
		return dao.updateBn(bn) > 0;
	}


	@Override
	public boolean removeBn(int bnNo) {
		return dao.deleteBn(bnNo) > 0;
	}

	@Override
	public boolean modifyBnStatus(bidNoticeVO bn) {
		return dao.updateBnStatus(bn) > 0 ;
	}

}
