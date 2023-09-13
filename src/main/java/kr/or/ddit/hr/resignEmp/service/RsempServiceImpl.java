package kr.or.ddit.hr.resignEmp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.employee.dao.EmployeeDAO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.hr.resignEmp.dao.ResignEmpDAO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class RsempServiceImpl implements ResignEmpService {
	
	@Inject
	private ResignEmpDAO resignempDAO;

	@Override
	public List<EmployeeVO> retrieveRempList(PaginationInfo paging) {
		long totalRecord =  resignempDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		
		return resignempDAO.selectRempList(paging);
	}

	@Override
	public EmployeeVO retrieveRemp(String empNo) {
		return resignempDAO.selectRemp(empNo);
	}
	
}
