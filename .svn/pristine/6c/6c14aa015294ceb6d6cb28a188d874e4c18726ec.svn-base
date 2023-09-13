package kr.or.ddit.hr.attendance.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.hr.attendance.dao.AttendanceDAO;
import kr.or.ddit.hr.vo.AttendanceVO;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Inject
	private AttendanceDAO attendanceDAO;
	
	@Override
	public boolean modifyAtte(AttendanceVO atte) {
		return attendanceDAO.updateAtte(atte) > 0;
	}

	@Override
	public boolean createAtte(AttendanceVO atte) {
		return attendanceDAO.insertAtte(atte) > 0;
	}

	@Override
	public AttendanceVO getEmpAtteToday(String empNo) {
		return attendanceDAO.selectToday(empNo);
	}

	@Override
	public boolean createAtteVac(AttendanceVO atte) {
		return attendanceDAO.insertAtteVac(atte) > 0;
	}

	//한달 근무시간 가져오기 
	@Override
	public long countWorkHours(String empNo) {
		return attendanceDAO.selectCountWork(empNo);
	}

	@Override
	public long selectCountWorkMonth(String empNo) {
		return attendanceDAO.selectCountWorkMonth(empNo);
	}


	
	
}
