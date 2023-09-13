package kr.or.ddit.operate.lostItem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.operate.vo.LostItemVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface LostItemDAO {
	
	/**
	 * 분실물 등록
	 * @param lostItem
	 * @return
	 */
	public int insertLi(LostItemVO lostItem);
	
	/**
	 * 분실물 전체조회
	 * @return
	 */
	
	
	public long selectTotalRecord(PaginationInfo paging);
	
	public List<LostItemVO> selectLiList(PaginationInfo paging);
	
	/**
	 * 분실물 상세조회
	 * @param liId
	 * @return
	 */
	public LostItemVO selectLi(String liId);
	
	/**
	 * 분실물 상태수정
	 * @param lostItem
	 * @return
	 */
	public int updateLi(LostItemVO lostItem);

	public int updateLiStatus(LostItemVO lostItem);

	
}
