package kr.or.ddit.common.requestList.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.vo.RequestListVO;
import kr.or.ddit.vo.PaginationInfo;


/**
 * 요청목록 비즈니스 로직 레이어
 * 로그인한 직원의 요청목록 조회가 가능하다.
 * 요청목록의 상세조회와 수정이 가능하다.
 */
public interface RequestListService {
	
	/**
	 * 로그인한 직원의 사번 기준으로 요청목록 전체조회
	 * @param departSelect
	 * @param empNo
	 * @return 페이징된 전체 목록 list 
	 */
	public List<RequestListVO> retrieveAllReqList(PaginationInfo paging);
	

	/**
	 * 요청 전체수 출력 
	 * @param paging
	 * @return 
	 */
	public long countTotalReq(PaginationInfo paging);
	
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
	public long getAllCount(String empNo);
	
}
