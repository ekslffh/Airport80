package kr.or.ddit.atch.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import kr.or.ddit.atch.dao.AtchFileDAO;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;

@Service
public class AtchFileServiceImpl implements AtchFileService {
	
	@Override
	public AtchFileDetailVO retrieveAtchFileDetail(AtchFileDetailVO condition) {
		AtchFileDetailVO saved = atchDAO.selectAtchFileDetail(condition);
		if (saved == null) {
			throw new RuntimeException("조건에 맞는 파일 메타데이터가 없음.");
		}
		return saved;
	}
	
	@Inject
	private AtchFileDAO atchDAO;
	
	@Override
	public void createAtchFileGroup(AtchFileVO fileGroup, Resource saveRes) throws IOException {
		List<AtchFileDetailVO> detailList = fileGroup.getDetailList();
		if (detailList != null) {
			for (AtchFileDetailVO single : detailList) {
				File saveFile = new File(saveRes.getFile(), single.getFiNm());
				single.setFiCours(saveFile.getCanonicalPath());
			}
		}
		int cnt = atchDAO.insertAtchFileGroup(fileGroup);
		if (cnt > 1) {
			for (AtchFileDetailVO single : detailList) {
				File saveFile = new File(single.getFiCours());
				single.getUploadFile().transferTo(saveFile);
			}
		}
	}
	
	@Override
	public boolean removeAtchFileGroup(String atchFileId, Resource saveRes) throws IOException {
		AtchFileVO fileGroup = atchDAO.selectAtchFileGroup(atchFileId);
		int cnt = 0;
		if (fileGroup != null) {
			cnt += atchDAO.deleteAtchFileDetails(atchFileId);
			cnt += atchDAO.deleteAtchFileGroup(atchFileId);
			if (cnt >= 2) {
				List<AtchFileDetailVO> detailList = fileGroup.getDetailList();
				for (AtchFileDetailVO single : detailList) {
					File saveFile = new File(single.getFiCours());
					FileUtils.deleteQuietly(saveFile);
				}
			}
		}
		return cnt > 0;
	}

}
