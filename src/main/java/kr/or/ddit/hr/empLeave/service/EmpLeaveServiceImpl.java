package kr.or.ddit.hr.empLeave.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.hr.empLeave.dao.EmpLeaveDAO;
import kr.or.ddit.hr.vo.LeaveEmpVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class EmpLeaveServiceImpl implements EmpLeaveService{
	
	@Inject
	private EmpLeaveDAO elDAO;

	@Override
	public boolean modifyElSk(LeaveEmpVO lemp) {
		return elDAO.updateElSk(lemp) > 0;
	}

	@Override
	public boolean modifyElAl(LeaveEmpVO lemp) {
		return elDAO.updateElAl(lemp) > 0;
	}

	@Override
	public boolean modifyElPd(LeaveEmpVO lemp) {
		return elDAO.updateElPd(lemp) > 0;
	}

	@Override
	public boolean modifyElPl(LeaveEmpVO lemp) {
		return elDAO.updateElPl(lemp) > 0;
	}

	@Override
	public boolean modifyElFe(LeaveEmpVO lemp) {
		return elDAO.updateElFe(lemp) > 0;
	}

	@Override
	public boolean modifyElUp(LeaveEmpVO lemp) {
		return elDAO.updateElUp(lemp) > 0;
	}

	@Override
	public List<LeaveEmpVO> retrieveElList(PaginationInfo paging) {
		return elDAO.selectElList(paging);

	}

}
