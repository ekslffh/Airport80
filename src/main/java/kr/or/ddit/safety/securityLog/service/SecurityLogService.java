package kr.or.ddit.safety.securityLog.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.safety.vo.SecurityLogVO;
import kr.or.ddit.safety.vo.SecurityReqVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;

public interface SecurityLogService {

	/**
	 * 업무일지 등록 
	 * @param secLog
	 * @return OK, FAIL 
	 */
	public boolean createSecLog(SecurityLogVO secLog);
	
	/**
	 * 업무일지 전체목록 조회 
	 * @return
	 */
	public List<SecurityLogVO> retrieveSeqLogList(String codeId);
	
	
	
	/**
	 * 업무일지 검색
	 * @param slogId
	 * @return
	 */
	public List<SecurityLogVO> retrieveSearchSeqLog(SimpleCondition condition);
	
	/**
	 * 업무일지 상세조회
	 * @param slogId
	 * @return
	 */
	public SecurityLogVO retrieveSecLog(String slogId);
	
	/**
	 * 보안일지 수정
	 * @param secLog
	 * @return
	 */
	public ServiceResult modifySecLog(SecurityLogVO secLog);
	
	/**
	 * 보안일지 삭제
	 * @param slogId
	 * @return
	 */
	public ServiceResult removeSecLog(String slogId);
	
	/**
	 * 보안일지 총갯수
	 * @return
	 */
	public long CountTotal();
	
	/**
	 * 보안일지 요청갯수
	 * @return
	 */
	public long CountReq();
	
	/**
	 * 보안일지 비요청갯수
	 * @return
	 */
	public long CountNonReq();
}
