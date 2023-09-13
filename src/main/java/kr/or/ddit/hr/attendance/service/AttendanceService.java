package kr.or.ddit.hr.attendance.service;

import kr.or.ddit.hr.vo.AttendanceVO;

public interface AttendanceService {
	
	public AttendanceVO getEmpAtteToday(String empNo);
	
	public boolean modifyAtte(AttendanceVO atte);
	public boolean createAtte(AttendanceVO atte);
	public boolean createAtteVac(AttendanceVO atte);
	
	//한주 근무시간 가져오기
	public long countWorkHours(String empNo); 
	//한달 근무시간 가져오기
	public long selectCountWorkMonth(String empNo);
}
