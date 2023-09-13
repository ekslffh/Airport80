package kr.or.ddit.safety.ssupport.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.safety.vo.SecurityReqVO;
import kr.or.ddit.vo.PaginationInfo;

public interface SecurityReqService {

	// 보안요청 등록 
	public boolean createSReq(SecurityReqVO srVO);
	
	// 보안요청 전체조회 
	public List<SecurityReqVO> retrieveSReqList();
	
	// 보안요청 상세조회 
	public SecurityReqVO retrieveSecReq(String srId);
	
	// 보안요청 상태변경(요청->대기중)
	public ServiceResult modifySqStatus(String srId);
	
	// 보안요청 완료 업데이트 
	public ServiceResult modifySecComplt(SecurityReqVO secReq);
	
	// 수정폼 에서 입력된값 출력
	public SecurityReqVO retrieveSecUdtForm(String srId);
	
	// 처리 평균시간
	public SecurityReqVO getAverageProcessingTime();
	
	// 차트 데이터
	public SecurityReqVO getChartInfo();
	
	// 보안 요청갯수
	public long CountReq();
	
	// 보안요청 접수갯수
	public long CountRec();
	
	// 보안요청 완료갯수
	public long CountComp();
	
	
}
