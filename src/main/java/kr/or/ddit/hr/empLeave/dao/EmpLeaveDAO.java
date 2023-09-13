package kr.or.ddit.hr.empLeave.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.hr.vo.LeaveEmpVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface EmpLeaveDAO {
	
	public List<LeaveEmpVO> selectElList(PaginationInfo paging);
	
	// 병가
	public int updateElSk(LeaveEmpVO lemp);
	
	// 연차
	public int updateElAl(LeaveEmpVO lemp);
	
	// 출산
	public int updateElPl(LeaveEmpVO lemp);
	
	// 경조사
	public int updateElFe(LeaveEmpVO lemp);
	
	// 무급
	public int updateElUp(LeaveEmpVO lemp);
	
	// 공가
	public int updateElPd(LeaveEmpVO lemp);
	

}
