package kr.or.ddit.safety.confiscationInfo.service;

import java.util.List;

import kr.or.ddit.safety.vo.ConfiscationInfoVO;
import kr.or.ddit.safety.vo.LiquidVO;
import kr.or.ddit.vo.PaginationInfo;

public interface ConfiscationInfoService {

	// 등록
	public int createConfisInfo(ConfiscationInfoVO confisInfo);
	
	// 전체조회 
	public List<ConfiscationInfoVO> retrieveConfisInfoList(PaginationInfo paging);
	
	// 액체물 전체조회 
	public List<LiquidVO> retrieveLiquidList();
	
	// 상세조회
	public ConfiscationInfoVO retrieveConfisInfo(int ciNo);
	
	// 수정
	public int modifyConfisInfo(ConfiscationInfoVO confisInfo);
	
	//삭제
	public int removeConfisInfo(int ciNo);
	
}
