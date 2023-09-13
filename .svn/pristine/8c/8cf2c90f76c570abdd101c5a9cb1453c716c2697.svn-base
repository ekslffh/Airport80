package kr.or.ddit.common.employee.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.Resource;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.common.account.dao.AccountDAO;
import kr.or.ddit.common.employee.dao.EmployeeDAO;
import kr.or.ddit.common.vo.AccountVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class EmpServiceImpl implements EmpService {
	
	@Inject
	private PasswordEncoder encoder;
	
	@Inject
	private EmployeeDAO employeeDAO;
	
	@Inject
	private AccountDAO accountDAO;
	
	@Inject
	private AtchFileService atchService;
	
	@Value("#{appInfo.empAtchPath}")
	private Resource atchPath;
	
	
	// processAtchFileGroup
	private void processAtchFileGroup(EmployeeVO emp) {
			MultipartFile[] empFiles = emp.getEmpFiles();
			if (empFiles == null) return;
			List<AtchFileDetailVO> detailList = new ArrayList<>();
			for (MultipartFile empFile : empFiles) {
				if (empFile.isEmpty()) continue;
				detailList.add(new AtchFileDetailVO(empFile));
			}
			if (detailList.size() > 0) {
				AtchFileVO fileGroup = new AtchFileVO();
				fileGroup.setDetailList(detailList);

				try {
					if (StringUtils.isNotBlank(emp.getAtchFileId())) {
						atchService.removeAtchFileGroup(emp.getAtchFileId(), atchPath);
					}
					fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
					atchService.createAtchFileGroup(fileGroup, atchPath);
					emp.setAtchFileId(fileGroup.getAtchFileId());
					fileGroup.setAtchFileId(emp.getAtchFileId());
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
		}
	
	
	
	
	

	

	@Override
	public List<EmployeeVO> retrieveEmpList(PaginationInfo paging) {
		long totalRecord = employeeDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		
		return employeeDAO.selectEmpList(paging);
	}

	@Override
	public EmployeeVO retrieveEmp(String empNo) {
		return employeeDAO.selectEmp(empNo);
	}

	@Override
	public boolean createEmp(EmployeeVO emp) {
		processAtchFileGroup(emp);
		AccountVO av = new AccountVO();
		
		av.setAccInfo("EMP");
		av.setAccAuth("ROLE_USER");
		
		int cnt = employeeDAO.insertEmp(emp);
		av.setAccId(emp.getEmpNo());
		
		av.setAccPw(encoder.encode(emp.getEmpNo()));

		cnt += accountDAO.insertAccount(av);
		return cnt > 1;
	}

	@Override
	public boolean modifyEmp(EmployeeVO emp) {
		processAtchFileGroup(emp);
		return employeeDAO.updateEmp(emp) > 0;
	}


	@Override
	public boolean updateCheckIn(EmployeeVO emp) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<EmployeeVO> retrieveAllNoPaging() {
		return employeeDAO.selectAllNoPaging();
	}

	@Override
	public boolean modifyEmpStatus(EmployeeVO emp) {
		return employeeDAO.updateEmpStatus(emp) > 0;
	}

	@Override
	public EmployeeVO retrieveEmpMy(String empNo) {
		return employeeDAO.selectEmpMy(empNo);
		
	}
	
	
	
	

	
	

}
