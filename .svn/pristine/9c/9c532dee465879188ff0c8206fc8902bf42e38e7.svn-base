package kr.or.ddit.accounting.salary.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.accounting.salary.dao.SalaryDAO;
import kr.or.ddit.accounting.salary.vo.SalaryVO;
import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.operate.vo.flightLogVO;
import kr.or.ddit.vo.PaginationInfo;
import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class SalaryServiceImpl implements SalaryService {

    private final SalaryDAO salaryDAO;
    
    private final AtchFileService atchService;
    
    @Value("{#appInfo.salAtchPath}")
    private Resource atchPath;

 // processAtchFileGroup
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
    					// 파일 수정인경우 첨부파일 데이터 전부 삭제하고 다시 생성
    					atchService.removeAtchFileGroup(fLog.getAtchFileId(), atchPath);
    				}
    				// 파일 작성
    				fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
    				atchService.createAtchFileGroup(fileGroup, atchPath);
    				fLog.setAtchFileId(fileGroup.getAtchFileId());
    				fileGroup.setAtchFileId(fLog.getAtchFileId());
    			} catch (IOException e) {
    				throw new RuntimeException(e);
    			}
    		}
    	}

	@Override
	public List<SalaryVO> getAllSalList() {
		return salaryDAO.getAllSalList();
	}
	@Override
	public int updateIns(SalaryVO salary) {
		return salaryDAO.updateIns(salary);
	}

	@Override
	public SalaryVO getSalary(String salId) {
		return salaryDAO.selectSal(salId);
	}

	@Override
	public int updateSal(SalaryVO salary) {
		return salaryDAO.updateSal(salary);
	}

	@Override
	public List<EmployeeVO> getAllEmpList() {
		return salaryDAO.getAllEmpListSal();
	}
	
	@Override
	public List<SalaryVO> getEmpSalList(String salId) {
		return salaryDAO.getEmpSalList(salId);
	}

	
	@Override
	public int deleteSal(SalaryVO salary) {
		return salaryDAO.deleteSal(salary);
	}

	
	@Override
	public int insertSal(SalaryVO salary) {
		return salaryDAO.insertSal(salary);
	}

	@Override
	public List<SalaryVO> selectEmp(String empNo) {
		return salaryDAO.selectEmpSal(empNo);
	}

	


    
}
