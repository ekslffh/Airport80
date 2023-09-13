package kr.or.ddit.hr.vacationReq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.hr.vo.VacationReqVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface VacationDAO {
	
	public long selectTotalRecord(PaginationInfo paging);
	
	public List<VacationReqVO> selectVacReqList(PaginationInfo paging);

	public VacationReqVO selectVacReq(String vrId);
	
	public int insertVacReq(VacationReqVO vacreq);
	
	public int updateVacReqStatus(VacationReqVO vacreq);
	
	public VacationReqVO selectVacTypeCnt(String vrId);
	
	public List<VacationReqVO> selectVrCalList();
	public List<VacationReqVO> selectMyVacList(String empNo);
	
}
