package kr.or.ddit.accounting.salary.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.accounting.salary.vo.SalaryVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.vo.PaginationInfo;



@Mapper
public interface SalaryDAO {
	
	public List<SalaryVO> getAllSalList();
	public List<SalaryVO> getEmpSalList(String salId);
	public List<SalaryVO> selectEmpSal(String empNo);	
	
	public int insertSal(SalaryVO salary);
	public SalaryVO selectSal(String salId);	
	public int updateSal(SalaryVO salary);
	public int updateIns(SalaryVO salary);
	public int deleteSal(SalaryVO salary);
	
	//직원정보조회
	public List<EmployeeVO> getAllEmpListSal();

}
