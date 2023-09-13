package kr.or.ddit.safety.securityLog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.safety.vo.SecurityLogVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;

@Mapper
public interface SecurityLogDAO {

	
	/**
	 * 보안일지 등록
	 * @param recLog
	 * @return
	 */
	public int insertSecLog(SecurityLogVO secLog);
	
	/**
	 * 보안일지 전체목록 조회
	 * @return
	 */
	public List<SecurityLogVO> selectSecLogList(String codeId); 
	
	
	/**
	 * 보안일지 검색
	 * @param condition
	 * @return
	 */
	public List<SecurityLogVO> selectSearchSecLog(SimpleCondition condition);
	
	/**
	 * 보안일지 상세조회 
	 * @param slogId
	 * @return
	 */
	public SecurityLogVO selectSecLog(String slogId);
	
	/**
	 * 보안일지 수정 
	 * @param secLog
	 * @return
	 */
	public int updateSecLog(SecurityLogVO secLog);
	
	/**
	 * 보안일지 삭제
	 * @param slogId
	 * @return
	 */
	public int deleteSecLog(String slogId);
	
	
	/**
	 * 보안일지 총갯수
	 * @return
	 */
	public long selectCountTotal();
	
	/**
	 * 보안일지 요청갯수
	 * @return
	 */
	public long selectCountReq();
	
	/**
	 * 보안일지 비요청 갯수 
	 * @return
	 */
	public long selectCountNonReq();
	
}
