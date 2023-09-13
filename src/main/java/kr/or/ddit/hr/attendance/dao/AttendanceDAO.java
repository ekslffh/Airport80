package kr.or.ddit.hr.attendance.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.hr.vo.AttendanceVO;

@Mapper
public interface AttendanceDAO {
	
	public AttendanceVO selectToday(String empNo);

	public int updateAtte(AttendanceVO atte);
	public int insertAtte(AttendanceVO atte);
	public int insertAtteVac(AttendanceVO atte);
	
	public void recordCheckIn (String currentTime);
	public void recordCheckOut(String currentTime);
	
	//한주 근무시간 가져오기
	public long selectCountWork(String empNo);
	//한달 근무시간 가져오기
	public long selectCountWorkMonth(String empNo);
	
}
