package kr.or.ddit.safety.ssupport.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.safety.vo.SecurityReqVO;
import kr.or.ddit.vo.PaginationInfo;

/**
 * @author PC-24
 *
 */
@Mapper
public interface SecurityReqDAO {
	
	public long selectTotalRecord(PaginationInfo paging);
	
	/**
	 * 보안요청 등록
	 * @param srVO
	 * @return
	 */
	public int insertSReq(SecurityReqVO srVO);
	
	/**
	 * 보안요청 전체 목록 확인
	 * @return
	 */
	public List<SecurityReqVO> selectSReqList();
	
	/**
	 * 보안요청 상세조회
	 * @param srId
	 * @return
	 */
	public SecurityReqVO selectSecReq(String srId);
	
	/**
	 * 보안요청 상태수정 
	 * @param srId
	 * @return
	 */
	public int updateSqStatus(String srId);
	
	
	/**
	 * 보안요청 완료 업데이트 
	 * @param secReq
	 * @return
	 */
	public int updateSecComplt(SecurityReqVO secReq);
	
	
	/**
	 * 보안요청 수정폼 입력된 값
	 * @param srId
	 * @return
	 */
	public SecurityReqVO selectSecUptForm(String srId);
	
	/**
	 * 보안요청 처리 시간 가져오기
	 */
	public SecurityReqVO getPorcessingTime();
	
	/**
	 * 차트용 정보
	 */
	public SecurityReqVO getChart();
	
	
	/**
	 * 보안요청 요청 갯수
	 * @return
	 */
	public long selectCountReq(); 
	
	/**
	 * 보안요청 접수 갯수
	 * @return
	 */
	public long selectCountRec();
	
	/**
	 * 보안요청 완료 갯수
	 * @return
	 */
	public long selectCountComp();

}
