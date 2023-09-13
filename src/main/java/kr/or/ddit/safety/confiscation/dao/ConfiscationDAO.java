package kr.or.ddit.safety.confiscation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.safety.vo.ConfiscationVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface ConfiscationDAO {

	public long selectTotalRecord(PaginationInfo paging);
	
	public long selectDisposalRecord(PaginationInfo paging);
	
	/**
	 * 압수품 등록
	 * @return
	 */
	public int insertConfiscation(ConfiscationVO confis);
	
	/**
	 * 압수품 전체조회
	 * @param paging
	 * @return
	 */
	public List<ConfiscationVO> selectConfiscationList(PaginationInfo paging);
	
	/**
	 * 압수품 상세조회
	 * @param csId
	 * @return
	 */
	public ConfiscationVO selectConfiscation(String csId);
	
	/**
	 * 압수품 수정
	 * @param confis
	 * @return
	 */
	public int updateConfiscation(ConfiscationVO confis);
	
	
	/**
	 * 압수품 삭제 
	 * @param csId
	 * @return
	 */
	public int deleteConfiscation(String csId);
	
	
	/**
	 * 압수품 상태변경
	 * @param confis
	 * @return
	 */
	public int updateConfisMthd(ConfiscationVO confis);
	
	
	/**
	 * 압수품폐기등록
	 * @param confis
	 * @return
	 */
	public int updateDisposal(ConfiscationVO confis);
	
	
	/**
	 * 압수품(폐기) 전체조회
	 * @param paging
	 * @return
	 */
	public List<ConfiscationVO> selectDisposalList(PaginationInfo paging);
	
	
	/**
	 * 압수품(폐기) 상세조회
	 * @param csId
	 * @return
	 */
	public ConfiscationVO selectDisposalOne(String csId);
	
	
	/**
	 * 압수품(폐기) 수정
	 * @param confis
	 * @return
	 */
	public int updateDisposalImg(ConfiscationVO confis);
	
	
}
