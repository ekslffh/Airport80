package kr.or.ddit.Infra.rncSchedule.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.Infra.vo.repairLogVO;
import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.Infra.vo.rncScheduleVO;
import kr.or.ddit.Infra.vo.stockUseDetailVO;
import kr.or.ddit.Infra.vo.stockUseVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaginationInfo;

public interface rncScheduleService {

	//유지보수 일정 등록
	public boolean createRncSchedule(rncScheduleVO rncSchedule);
	//청소 일정 등록
	public boolean createRecSchedule(rncScheduleVO rncSchedule);
	
	//유지보수 일정 조회 
	public List<rncScheduleVO> retrieveScheduleList ();
	public List<rncScheduleVO> retrieveScheduleList (PaginationInfo paging);
	
	//청소 일정조회
	public List<rncScheduleVO> retrieveRecScheduleList (PaginationInfo paging);
	
	// 상태 업데이트 
	public boolean sttsUpdate (rncReqVO rncReq);

	// 보안일지 상태업데이트 
	boolean sttsUpdateRL(repairLogVO repLog);
	
	// rrStts값 조회
	public rncScheduleVO selectSttsToRnc(String rsId);
	public repairLogVO selectSttsToRep(String rsId);
	
	
	public rncScheduleVO selectSchedule(String rsId);
	
	// 재고 리스트 조회
	public List<stockVO> retrieveStockList(@Param("stNm") String stNm);
	
	//처리완료 업데이트 
	public ServiceResult updateRncSchedule(rncScheduleVO rncSchedule);
	
	// 재고 사용 상세입력
	public ServiceResult insertStockUseDetail(stockUseDetailVO stockUse);
	
	//재고사용 아이디 생성
	public rncScheduleVO selectOneRsSuId(String rsId);
	
	// 재고 사용 입력
	public ServiceResult insertStockUse(stockUseVO stockUseVO);
	
	// 재고 수량 업데이트
	public ServiceResult modifyStockCnt(stockVO stockVO);
	
	// 처리완료 업데이트
	public ServiceResult modifySttsPC (String rsId);
	
	// 대기중 리스트조회 - 유 
	public List<rncScheduleVO> retrieveScheduleWt (PaginationInfo paging);
	// 처리중 리스트 조회 - 유
	public List<rncScheduleVO> retrieveSchedulePg (PaginationInfo paging);
	// 진행중(지연) 리스트 조회 -유
	public List<rncScheduleVO> retrieveScheduleDl (PaginationInfo paging);
	public List<rncScheduleVO> retrieveScheduleDlNP ();
	// 외주 리스트 조회 -유
	public List<rncScheduleVO> retrieveScheduleWo (PaginationInfo paging);
	// 처리완료 리스트 조회 -유
	public List<rncScheduleVO> retrieveSchedulePc (PaginationInfo paging);

	// 대기중 리스트조회 -청소
	public List<rncScheduleVO> cRetrieveScheduleWt (PaginationInfo paging);
	// 처리중 리스트 조회 - 청소
	public List<rncScheduleVO> cRetrieveSchedulePg (PaginationInfo paging);
	// 처리완료 리스트 조회 - 청소
	public List<rncScheduleVO> cRetrieveSchedulePc (PaginationInfo paging);
}
