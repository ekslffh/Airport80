package kr.or.ddit.Infra.repairLog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.Infra.vo.repairLogVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface repLogDAO {

	//점검일지(일정) 등록
	public int insertRepLog(repairLogVO repLogVO);
	
	//목록조회
	public List<repairLogVO> selectRepLogList(PaginationInfo paging);
	
	public List<repairLogVO> selectMNRepLogList(PaginationInfo paging);
	
	public List<repairLogVO> selectMWRepLogList(PaginationInfo paging);
	
	//페이징
	public long selectTotalRecord(PaginationInfo paging);
	
	public repairLogVO selectRepLog(String rlNo);
	
	public List<repairLogVO> modalRepLogList();
	
	public repairLogVO monthRepLog(String month);

	public int updateLogStatus(repairLogVO repVO);
	
	public List<repairLogVO> getRepChart(String rlFc);
	
}
