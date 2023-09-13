package kr.or.ddit.safety.ssupport.service;

import java.text.MessageFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.safety.ssupport.dao.SecurityReqDAO;
import kr.or.ddit.safety.vo.SecurityReqVO;

@Service
public class SecurityReqServiceImpl implements SecurityReqService {

	@Inject
	private SecurityReqDAO dao;
	
	@Override
	public boolean createSReq(SecurityReqVO srVO) {
		return dao.insertSReq(srVO) > 0;
	}

	//보안요청 전체조회 
	@Override
	public List<SecurityReqVO> retrieveSReqList() {
		return dao.selectSReqList();
	}

	//보안요청 상세조회
	@Override
	public SecurityReqVO retrieveSecReq(String srId) {
		SecurityReqVO secReq = dao.selectSecReq(srId);
		
		if(secReq==null) {
			throw new PKNotFoundException(MessageFormat.format("{0} 보안요청 없음", srId));
		}
		return secReq;
	}

	//보안요청 상태변경(요청->대기중)
	@Override
	public ServiceResult modifySqStatus(String srId) {
		return dao.updateSqStatus(srId) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	// 보안요청 완료 업데이트 
	@Override
	public ServiceResult modifySecComplt(SecurityReqVO secReq) {
		return dao.updateSecComplt(secReq) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	// 수정폼 에서 입력된값 출력
	@Override
	public SecurityReqVO retrieveSecUdtForm(String srId) {
		return dao.selectSecUptForm(srId);
	}

	@Override
	public SecurityReqVO getAverageProcessingTime() {
		return dao.getPorcessingTime();
	}

	@Override
	public SecurityReqVO getChartInfo() {
		return dao.getChart();
	}

	//보안 요청갯수
	@Override
	public long CountReq() {
		return dao.selectCountReq();
	}

	//보안 접수갯수
	@Override
	public long CountRec() {
		return dao.selectCountRec();
	}

	//보안 완료갯수
	@Override
	public long CountComp() {
		return dao.selectCountComp();
	}

}
