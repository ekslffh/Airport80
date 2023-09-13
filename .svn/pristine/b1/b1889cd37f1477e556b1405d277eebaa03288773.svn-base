package kr.or.ddit.operate.lostItem.service;

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
import kr.or.ddit.operate.enumpkg.ServiceResult;
import kr.or.ddit.operate.lostItem.dao.LostItemDAO;
import kr.or.ddit.operate.vo.LostItemVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class LostItemServiceImpl implements LostItemService{
	
	@Inject
	private LostItemDAO dao;
	
	@Inject
	private AtchFileService atchService;
	
	@Value("#{appInfo.liAtchPath}")
	private Resource atchPath;
	
	
	// processAtchFileGroup
	private void processAtchFileGroup(LostItemVO li) {
			MultipartFile[] liFiles = li.getLiFiles();
			if (liFiles == null) return;
			List<AtchFileDetailVO> detailList = new ArrayList<>();
			for (MultipartFile liFile : liFiles) {
				if (liFile.isEmpty()) continue;
				detailList.add(new AtchFileDetailVO(liFile));
			}
			if (detailList.size() > 0) {
				AtchFileVO fileGroup = new AtchFileVO();
				fileGroup.setDetailList(detailList);
				// 1. 첨부파일의 메타 데이터 저장
				// 2. 첨부파일의 2진 데이터 저장
				try {
					if (StringUtils.isNotBlank(li.getAtchFileId())) {
						
						atchService.removeAtchFileGroup(li.getAtchFileId(), atchPath);
					}

					fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
					atchService.createAtchFileGroup(fileGroup, atchPath);
					li.setAtchFileId(fileGroup.getAtchFileId());
					fileGroup.setAtchFileId(li.getAtchFileId());
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
		}
	
	


	
	@Override
	public List<LostItemVO> retrieveLiList(PaginationInfo paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		
		return dao.selectLiList(paging);
	}

	@Override
	public LostItemVO retrieveLi(String liId) {

		return dao.selectLi(liId);
	}
	

	
	@Override
	public ServiceResult createLi(LostItemVO lostItem) {
		processAtchFileGroup(lostItem);
		return dao.insertLi(lostItem) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	
	@Override
	public ServiceResult modifyLi(LostItemVO lostItem) {
		processAtchFileGroup(lostItem);

		return dao.updateLi(lostItem) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyLiStatus(LostItemVO lostItem) {
		return dao.updateLiStatus(lostItem) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}



	
	}


	
	



