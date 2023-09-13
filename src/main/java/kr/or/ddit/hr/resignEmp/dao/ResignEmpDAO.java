package kr.or.ddit.hr.resignEmp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface ResignEmpDAO {

	public long selectTotalRecord(PaginationInfo paging);
	
	public List<EmployeeVO> selectRempList(PaginationInfo paging);
	public EmployeeVO selectRemp(String empNo);
	
}
