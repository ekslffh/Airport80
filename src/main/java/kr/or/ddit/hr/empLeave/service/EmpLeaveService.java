package kr.or.ddit.hr.empLeave.service;

import java.util.List;

import kr.or.ddit.hr.vo.LeaveEmpVO;
import kr.or.ddit.vo.PaginationInfo;

public interface EmpLeaveService {
	
	public List<LeaveEmpVO> retrieveElList(PaginationInfo paging);

	public boolean modifyElSk(LeaveEmpVO lemp);
	
	public boolean modifyElAl(LeaveEmpVO lemp);
	
	public boolean modifyElPd(LeaveEmpVO lemp);
	
	public boolean modifyElPl(LeaveEmpVO lemp);
	
	public boolean modifyElFe(LeaveEmpVO lemp);
	
	public boolean modifyElUp(LeaveEmpVO lemp);
}
