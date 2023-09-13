package kr.or.ddit.hr.resignEmp.service;

import java.util.List;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.vo.PaginationInfo;

public interface ResignEmpService {
	
	public List<EmployeeVO> retrieveRempList(PaginationInfo paging);
	public EmployeeVO retrieveRemp(String empNo);
	
}
