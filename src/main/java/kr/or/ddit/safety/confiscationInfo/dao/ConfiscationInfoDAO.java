package kr.or.ddit.safety.confiscationInfo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.safety.vo.ConfiscationInfoVO;
import kr.or.ddit.safety.vo.LiquidVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface ConfiscationInfoDAO {

	public long selectTotalRecord(PaginationInfo paging);
	
	
	/**
	 * 반입금지품목 등록
	 * @param confisInfo
	 * @return
	 */
	public int insertConfisInfo(ConfiscationInfoVO confisInfo);
	
	/**
	 * 반입금지품목 전체조회
	 * @return
	 */
	public List<ConfiscationInfoVO> selectConfisInfoList(PaginationInfo paging);
	
	
	/**
	 * 액체류정의 전체조회
	 * @return
	 */
	public List<LiquidVO> selectLiquidList();
	
	/**
	 * 반입금지품목 상세조회
	 * @param ciNo
	 * @return
	 */
	public ConfiscationInfoVO selectConfisInfo(int ciNo);
	
	/**
	 * 반입금지품목 수정
	 * @param confisInfo
	 * @return
	 */
	public int updateConfisInfo(ConfiscationInfoVO confisInfo);
	
	/**
	 * 반입금지품목 삭제
	 * @param ciNo
	 * @return
	 */
	public int deleteConfisInfo(int ciNo);

	

	
}

