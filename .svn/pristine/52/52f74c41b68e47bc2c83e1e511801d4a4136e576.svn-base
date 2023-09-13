package kr.or.ddit.Infra.rncReq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface rncDAO {

	public int insertRncReq(rncReqVO rncVO);
	
	//유지보수 요청 조회
	public List<rncReqVO> selectRReqList(PaginationInfo paging);
	
	//청소 요청 조회
	public List<rncReqVO> selectCReqList(PaginationInfo paging);
	
	public long selectTotalRecord(PaginationInfo paging);
	
	public long selectTotalRecordtoREC(PaginationInfo paging);
	
	//상세조회
	public rncReqVO selectRncReq(String rrId);

	//반려 
	public int updateRncReq(rncReqVO rncReq); 
	
	//수정폼 입력값
	public rncReqVO selectRncUdtForm(String rrId);
	
	//상태 'wt'로 업데이트 
	public int modifySttsWt(String rsId);
	
	//상태 'wt'로 업데이트
	public int CmodifySttsWt(String rsId);

	//상태 'pg'로 업데이트 
	public int modifySttsPg(String rsId);

	//상태 'dl'로 업데이트 
	public int modifySttsDl(String rsId);
	
	// 요청등록에서 접수 모달로 확인할때 list
	public List<rncReqVO> modalRncReqList();
	public List<rncReqVO> modalRecReqList();
	
	public List<rncReqVO> selectedWtRncReq(PaginationInfo paging);
	public List<rncReqVO> selectedPgRncReq(PaginationInfo paging);
	public List<rncReqVO> selectedDlRncReq(PaginationInfo paging);
	public List<rncReqVO> selectedWoRncReq(PaginationInfo paging);
	public List<rncReqVO> selectedPcRncReq(PaginationInfo paging);
	public List<rncReqVO> selectedCpRncReq(PaginationInfo paging);

	public List<rncReqVO> selectedCwtRncReq(PaginationInfo paging);
	
	public List<rncReqVO> selectedCcpRncReq(PaginationInfo paging);
	
	
}
