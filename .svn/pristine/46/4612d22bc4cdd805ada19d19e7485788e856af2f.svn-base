package kr.or.ddit.common.employee.service;

import java.util.List;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.hr.vo.LeaveEmpVO;
import kr.or.ddit.vo.PaginationInfo;

public interface EmpService {
	
	public List<EmployeeVO> retrieveEmpList(PaginationInfo paging);
	public EmployeeVO retrieveEmp(String empNo);
	
	public boolean createEmp(EmployeeVO emp);
	public boolean modifyEmp(EmployeeVO emp);
	
	public boolean updateCheckIn(EmployeeVO emp);
	
	public List<EmployeeVO> retrieveAllNoPaging();
	
	public boolean modifyEmpStatus(EmployeeVO emp);
	
	public EmployeeVO retrieveEmpMy(String empNo);
	


}
