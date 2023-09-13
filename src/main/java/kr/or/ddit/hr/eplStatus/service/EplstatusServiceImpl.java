package kr.or.ddit.hr.eplStatus.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.hr.eplStatus.dao.EplstatusDAO;
import kr.or.ddit.hr.vo.EplstatusVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class EplstatusServiceImpl implements EplstatusService {

	@Inject
	private EplstatusDAO eplstatusDAO;
	
	@Override
	public boolean createEplstatus(EplstatusVO epl) {
		return eplstatusDAO.insertEplstatus(epl) > 0;
	}

	@Override
	public EplstatusVO retrieveEpl(String eplId) {
		return eplstatusDAO.selectEplstatus(eplId);
	}

	@Override
	public List<EplstatusVO> retrieveEplList(PaginationInfo paging) {
		long totalRecord = eplstatusDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		
		return eplstatusDAO.selectEplList(paging);
	}

	@Override
	public boolean modifyEplstatus(EplstatusVO epl) {
		return eplstatusDAO.updateEplstatus(epl) > 0;
	}
	
	@Override
	public EplstatusVO checkEpl(String empNo) {
		return eplstatusDAO.checkEpl(empNo);
	}

	@Override
	public boolean modifyEplAll(EplstatusVO epl) {
		return eplstatusDAO.updateEplAll(epl) > 0;
	}

}
