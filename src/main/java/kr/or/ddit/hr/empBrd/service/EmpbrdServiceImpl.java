package kr.or.ddit.hr.empBrd.service;

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
import kr.or.ddit.hr.empBrd.dao.EmpbrdDAO;
import kr.or.ddit.hr.vo.EmpbrdVO;
import kr.or.ddit.vo.PaginationInfo;


@Service
public class EmpbrdServiceImpl implements EmpbrdService {

	@Inject
	private EmpbrdDAO empbrdDAO;

	@Inject
	private AtchFileService atchService;

	@Value("#{appInfo.ebAtchPath}")
	private Resource atchPath;


    @Override
    public List<EmpbrdVO> retrieveEmpbrdList(PaginationInfo paging) {
        long totalRecord = empbrdDAO.selectTotalRecord(paging);
        paging.setTotalRecord(totalRecord);

        return empbrdDAO.selectEmpbrdList(paging);
    }

	@Override
    public List<EmpbrdVO> retrieveEbpubList() {
        return empbrdDAO.selectEbpubList();
    }

	
	@Override
	public EmpbrdVO retrieveEmpbrd(int ebNo) {
		return empbrdDAO.selectEmpbrd(ebNo);
	}

	private void processAtchFileGroup(EmpbrdVO empbrd) {
		MultipartFile[] ebFiles = empbrd.getEbFiles();
		if(ebFiles == null) return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for (MultipartFile ebFile : ebFiles) {
			if (ebFile.isEmpty()) continue;
			detailList.add(new AtchFileDetailVO(ebFile));
		}
		if (detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);

			try {
				if (StringUtils.isNotBlank(empbrd.getAtchFileId())) {
					atchService.removeAtchFileGroup(empbrd.getAtchFileId(), atchPath);
				}
				fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
				atchService.createAtchFileGroup(fileGroup, atchPath);
				empbrd.setAtchFileId(fileGroup.getAtchFileId());
			} catch(IOException e) {
				throw new RuntimeException(e);
			}
		}
	}

	@Override
	public boolean createEmpbrd(EmpbrdVO board) {
		processAtchFileGroup(board);
		return empbrdDAO.insertEmpbrd(board) > 0;
	}

	@Override
	public boolean modfiyEmpbrd(EmpbrdVO board) {
		processAtchFileGroup(board);
		return empbrdDAO.updateEmpbrd(board) > 0;
	}

	@Override
	public boolean removeEmpbrd(EmpbrdVO board) {
		return empbrdDAO.deleteEmpbrd(board) > 0;
	}

	@Override
	public void increaseViews(int ebVws) {
		empbrdDAO.increaseViews(ebVws);
	}

	

}