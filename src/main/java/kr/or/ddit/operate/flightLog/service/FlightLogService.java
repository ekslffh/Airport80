package kr.or.ddit.operate.flightLog.service;

import java.util.List;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.operate.vo.flightLogVO;
import kr.or.ddit.vo.PaginationInfo;

/**
 * 운항일지 관리 비즈니스 로직
 */
public interface FlightLogService {
	/**
	 * 전체 운항일지 조회
	 * 
	 * @return 없으면 size = 0
	 */
	public List<flightLogVO> retrieveList(PaginationInfo paging);

	/**
	 * 특정 운항일지 조회
	 * 
	 * @param flId : 조회할 운항일지 아이디
	 * @return 조회된 운항일지
	 * @throws PKNotFoundException : 해당 일지가 없는 경우
	 */
	public flightLogVO retrieveOne(String flId) throws PKNotFoundException;

	/**
	 * 운항일지 작성
	 * 
	 * @param log : 작성된 일지정보
	 * @return 등록된 레코드 수 > 0 : true else false
	 */
	public boolean createLog(flightLogVO log);

	/**
	 * 운항일지 수정
	 * 
	 * @param log : 수정된 일지정보
	 * @return 수정된 레코드 수 > 0 : true else false
	 */
	public boolean modifyLog(flightLogVO log);

	/**
	 * @param flId : 삭제할 운항일지 아이디
	 * @return 삭제된 레코드 수 > 0 : true else false
	 */
	public boolean removeLog(String flId);
}
