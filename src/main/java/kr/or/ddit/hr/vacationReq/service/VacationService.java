
package kr.or.ddit.hr.vacationReq.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.hr.vo.VacationReqVO;
import kr.or.ddit.vo.PaginationInfo;

public interface VacationService {
	
	public List<VacationReqVO> retrieveVacReqList(PaginationInfo paging);
	public List<VacationReqVO> retrieveMyvacList(String empNo);
	
	public VacationReqVO retrieveVacReq(String vrId);
	
	public boolean createVacreq(VacationReqVO vacreq);
	public ServiceResult modifyVacReqStatus(VacationReqVO vacreq);
	
	public VacationReqVO retrieveVacTypeCnt(String vrId);
	public List<VacationReqVO> retrieveVrCalList();
}
