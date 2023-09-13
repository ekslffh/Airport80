package kr.or.ddit.Infra.repairLog.service;

import java.util.List;

import kr.or.ddit.Infra.vo.repairLogVO;
import kr.or.ddit.vo.PaginationInfo;

public interface repLogService {
	
	public int createRepLog(repairLogVO repLogVO);
	
	
	// 조건별 리스트
	
	// 전체 목록
	public List<repairLogVO> retrieveRepLogList(PaginationInfo paging);
	
	// 월 미흡
	public List<repairLogVO> monthNnRepLogList(PaginationInfo paging);
	
	// 월 대기
	public List<repairLogVO> monthWtRepLogList(PaginationInfo paging);
	
	public repairLogVO retrieveRepLog(String rlNo);
	
	public repairLogVO countRepLog(String month);
	
	public int updateRepairLogStatus(repairLogVO repVO);
	
	public List<repairLogVO> getRepCharts(String rlFc);
}
