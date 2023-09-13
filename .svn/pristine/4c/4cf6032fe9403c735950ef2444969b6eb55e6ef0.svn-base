package kr.or.ddit.Infra.rncReq.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaginationInfo;

public interface rncService {
	
	//유지보수&청소 요청 등록
	public boolean createRncReq(rncReqVO rnc);
	
	//유지보수 요청 리스트 조회
	public List<rncReqVO> retrieveRReqList(PaginationInfo paging);
	
	//청소 요청 리스트 조회
	public List<rncReqVO> retrieveCReqList(PaginationInfo paging);
	
	//유지보수&청소 요청 상세조회
	public rncReqVO retrieveRncReq(String rrId);
	
	//반려 업데이트
	public ServiceResult modifyRncReq(rncReqVO rncReq);
	
	//수정폼 입력값
	public rncReqVO retrieveRncUdpForm(String rrId);
	
	//상태 업데이트
	public ServiceResult updateSttsWT(String rsId);
	public ServiceResult CupdateSttsWT(String rsId);
	public ServiceResult updateSttsPG(String rsId);
	public ServiceResult updateSttsDL(String rsId);
	
	public List<rncReqVO> wtRepLogList(PaginationInfo paging);
	public List<rncReqVO> pgRepLogList(PaginationInfo paging);
	public List<rncReqVO> dlRepLogList(PaginationInfo paging);
	public List<rncReqVO> woRepLogList(PaginationInfo paging);
	public List<rncReqVO> pcRepLogList(PaginationInfo paging);
	public List<rncReqVO> cpRepLogList(PaginationInfo paging);

	public List<rncReqVO> cwtReqLogList(PaginationInfo paging);
	public List<rncReqVO> ccpReqLogList(PaginationInfo paging);
	
	
}
