package kr.or.ddit.safety.securityLog.service;

import java.text.MessageFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.safety.securityLog.dao.SecurityLogDAO;
import kr.or.ddit.safety.vo.SecurityLogVO;
import kr.or.ddit.safety.vo.SecurityReqVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;

@Service
public class SecurityLogServiceImpl implements SecurityLogService {

	@Inject
	private SecurityLogDAO dao;
	
	// 보안일지 등록
	@Override
	public boolean createSecLog(SecurityLogVO secLog) {
		int count = dao.insertSecLog(secLog);
		return count > 0;
	}
 
	// 보안일지 전체목록 조회 
	@Override
	public List<SecurityLogVO> retrieveSeqLogList(String codeId) {
		return dao.selectSecLogList(codeId);
	}

	// 보안일지 상세조회
	@Override
	public SecurityLogVO retrieveSecLog(String slogId) {
		SecurityLogVO secLog = dao.selectSecLog(slogId);
		if(secLog == null) {
			throw new PKNotFoundException(MessageFormat.format("{0} 에 해당하는 보안일지 없음", slogId));
		}
		return secLog;
	}

	// 보안일지 수정
	@Override
	public ServiceResult modifySecLog(SecurityLogVO secLog) {
		// TODO Auto-generated method stub
		return null;
	}

	// 보안일지 삭제 
	@Override
	public ServiceResult removeSecLog(String slogId) {
		return dao.deleteSecLog(slogId) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	// 보안일지 검색
	@Override
	public List<SecurityLogVO> retrieveSearchSeqLog(SimpleCondition condition) {
		return dao.selectSearchSecLog(condition);
	}

	// 보안일지 총갯수
	@Override
	public long CountTotal() {
		return dao.selectCountTotal();
	}

	// 보안일지 요청갯수
	@Override
	public long CountReq() {
		return dao.selectCountReq();
	}

	// 보안일지 비요청 갯수 
	@Override
	public long CountNonReq() {
		return dao.selectCountNonReq();
	}



}
