package kr.or.ddit.Infra.rncSchedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.Infra.vo.repairLogVO;
import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.Infra.vo.rncScheduleVO;
import kr.or.ddit.Infra.vo.stockUseDetailVO;
import kr.or.ddit.Infra.vo.stockUseVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface rncScheduleDAO {

	// 유지보수 등록
	public int insertRncSchedule(rncScheduleVO rncSchedule);

	// 청소 등록
	public int insertRecSchedule(rncScheduleVO rncSchedule);

	// 유지보수 일정 조회
	public List<rncScheduleVO> selectScheduleList(PaginationInfo paging);
	public List<rncScheduleVO> selectScheduleListNP();

	// 청소 일정조회
	public List<rncScheduleVO> selectRecScheduleList(PaginationInfo paging);
	
	//유지보수 각 상태별 조회
	public long selectTotalWt(PaginationInfo paging);
	public long selectTotalPg(PaginationInfo paging);
	public long selectTotalDl(PaginationInfo paging);
	public long selectTotalWo(PaginationInfo paging);
	public long selectTotalPc(PaginationInfo paging);

	//청소 각 상태별 조회 
	public long CselectTotalWt(PaginationInfo paging);
	public long CselectTotalPg(PaginationInfo paging);
	public long CselectTotalPc(PaginationInfo paging);
	
	public int updateStts(rncReqVO rncReq);
	
	public int updateSttsRL(repairLogVO repLog);
	
	//rrStts가져오기위해 조인해서 검색 
	public rncScheduleVO searchSttsToRnc(String rsId);
	public repairLogVO searchSttsToRep(String rsId);

	public rncScheduleVO selectScheduleOne(String rsId);

	// 처리완료 수정 업데이트
	public int modifyRncSchedule(rncScheduleVO rncSchedule);

	public int insertStockUseList(stockUseDetailVO stockUse);

	public rncScheduleVO selectRsSuId(String rsId);

	public int createSuId(stockUseVO stockUseVO);

	public int updateStockCnt(stockVO stockVO);

	public int updateSttsPC(String rsId);

	
	// 대기중 리스트조회 - 유지보수
	public List<rncScheduleVO> selectScheduleWt(PaginationInfo paging);

	// 처리중 리스트 조회 - 유지보수
	public List<rncScheduleVO> selectSchedulePg(PaginationInfo paging);

	// 진행중(지연) 리스트 조회 - 유지보수
	public List<rncScheduleVO> selectScheduleDl(PaginationInfo paging);
	// 진행중(지연) 리스트 조회 - 유지보수
	public List<rncScheduleVO> selectScheduleDlNP();

	// 외주 리스트 조회 - 유지보수
	public List<rncScheduleVO> selectScheduleWo(PaginationInfo paging);

	// 처리완료 리스트 조회 -유지보수
	public List<rncScheduleVO> selectSchedulePc(PaginationInfo paging);

	// 처리완료 리스트조회 - 청소
	public List<rncScheduleVO> CselectSchedulePc(PaginationInfo paging);
	
	// 처리중 리스트 조회 - 청소
	public List<rncScheduleVO> CselectSchedulePg(PaginationInfo paging);

	// 대기중 리스트 조회 - 청소 
	public List<rncScheduleVO> CselectScheduleWt(PaginationInfo paging);
}
