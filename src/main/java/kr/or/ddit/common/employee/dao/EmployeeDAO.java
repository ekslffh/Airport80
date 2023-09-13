package kr.or.ddit.common.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.hr.vo.AttendanceVO;
import kr.or.ddit.hr.vo.LeaveEmpVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface EmployeeDAO {
	public EmployeeVO selectEmp(String empNo);
	
	public int insertEmp(EmployeeVO emp);
	
	public long selectTotalRecord(PaginationInfo paging);
	
	public List<EmployeeVO> selectEmpList(PaginationInfo paging);
	
	public List<EmployeeVO> selectAllNoPaging();
	
	public int updateEmp(EmployeeVO emp);
	
	public int deleteEmp(@Param("empNo") EmployeeVO emp);
	
	public int updateEmpStatus(EmployeeVO emp);
	
	public EmployeeVO selectEmpMy(String empNo);
} 
