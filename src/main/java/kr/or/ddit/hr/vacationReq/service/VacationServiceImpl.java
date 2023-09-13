package kr.or.ddit.hr.vacationReq.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.hr.attendance.dao.AttendanceDAO;
import kr.or.ddit.hr.vacationReq.dao.VacationDAO;
import kr.or.ddit.hr.vo.AttendanceVO;
import kr.or.ddit.hr.vo.VacationReqVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class VacationServiceImpl implements VacationService {
	
	@Inject
	private VacationDAO vacationDAO;
	
	@Inject
	private AttendanceDAO attendanceDAO;

//	휴가 신청 리스트 
	@Override
	public List<VacationReqVO> retrieveVacReqList(PaginationInfo paging) {
		long totalRecord = vacationDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		
		return vacationDAO.selectVacReqList(paging);
	}

//	휴가 신청 
	@Override
	public boolean createVacreq(VacationReqVO vacreq) {
		AttendanceVO av = new AttendanceVO();
		
		int cnt = vacationDAO.insertVacReq(vacreq);
		
		av.setAttId(vacreq.getVrAttId());
		av.setAttEmpNo(vacreq.getVrEmpNo());
		av.setAttMemo(vacreq.getVrType());
		av.setAttCd("AC03");
		av.setAttDt(vacreq.getVrStartTs());
		
		cnt += attendanceDAO.insertAtteVac(av);
		
		return cnt > 1;
	}

	@Override
	public VacationReqVO retrieveVacReq(String vrId) {
		return vacationDAO.selectVacReq(vrId);
	}

	@Override
	public ServiceResult modifyVacReqStatus(VacationReqVO vacreq) {
		return vacationDAO.updateVacReqStatus(vacreq) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public VacationReqVO retrieveVacTypeCnt(String vrId) {
		return vacationDAO.selectVacTypeCnt(vrId);
	}

	@Override
	public List<VacationReqVO> retrieveVrCalList() {
		return vacationDAO.selectVrCalList();
	}

	@Override
	public List<VacationReqVO> retrieveMyvacList(String empNo) {
		return vacationDAO.selectMyVacList(empNo);
	}



}
