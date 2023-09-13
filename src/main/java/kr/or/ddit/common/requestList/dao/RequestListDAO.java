package kr.or.ddit.common.requestList.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.vo.RequestListVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface RequestListDAO {
	

	/**
	 * 페이징 처리 전체수 조회
	 * @param paging
	 * @return
	 */
	public long selectTotalRecord(PaginationInfo paging);
	

	/**
	 * 요청목록 전체조회 
	 * @param paging
	 * @return
	 */
	public List<RequestListVO> selectRequestList(PaginationInfo paging);
	
	/**
	 * 요청별 상태값 가져오기
	 * @param empNo
	 * @return Map(key: 상태, value: 개수)
	 */
	public Map<String, Integer> getAllCnt(String empNo);
	
	/**
	 * 게시물 전체갯수 가져오기
	 * @param empNo
	 * @return
	 */
	public long allCount(String empNo);
	
	
}
