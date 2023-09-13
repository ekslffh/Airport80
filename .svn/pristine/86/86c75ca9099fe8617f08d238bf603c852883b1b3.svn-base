package kr.or.ddit.operate.flightLog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.operate.vo.flightLogVO;
import kr.or.ddit.vo.PaginationInfo;

/**
 * 운항일지 관리 퍼시스턴스 레이어
 */
@Mapper
public interface FlightLogDAO {
	/**
	 * 전체 레코드 수 조회
	 * 
	 * @param paging
	 * @return 전체 레코드 수
	 */
	public long selectTotalRecord();

	/**
	 * 전체 운항일지 조회
	 * 
	 * @return 없으면 size = 0
	 */
	public List<flightLogVO> selectList(PaginationInfo paging);

	/**
	 * 특정 운항일지 조회
	 * 
	 * @param flId : 조회할 운항일지 아이디
	 * @return 없으면 null 반환
	 */
	public flightLogVO selectOne(String flId);

	/**
	 * 운항일지 작성
	 * 
	 * @param log : 작성된 일지정보
	 * @return 등록된 레코드 수 > 0 : 성공
	 */
	public int insertLog(flightLogVO log);

	/**
	 * 운항일지 수정
	 * 
	 * @param log : 수정된 일지정보
	 * @return 수정된 레코드 수 > 0 : 성공
	 */
	public int updateLog(flightLogVO log);

	/**
	 * @param flId : 삭제할 운항일지 아이디
	 * @return 삭제된 레코드 수 > 0 : 성공
	 */
	public int deleteLog(String flId);
}
