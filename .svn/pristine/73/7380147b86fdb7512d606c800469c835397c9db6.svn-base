package kr.or.ddit.accounting.salary.service;

import java.util.List;

import kr.or.ddit.accounting.salary.vo.SalaryVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.vo.PaginationInfo;

public interface SalaryService {

	public List<SalaryVO> getAllSalList();
	public List<SalaryVO> getEmpSalList(String salId);
	public List<SalaryVO> selectEmp(String empNo);
	
	public int insertSal(SalaryVO salary);
	public SalaryVO getSalary(String salId);
	public int updateSal(SalaryVO salary);
	public int updateIns(SalaryVO salary);
	public int deleteSal(SalaryVO salary);
	
	//직원정보조회
	public List<EmployeeVO> getAllEmpList();
}
