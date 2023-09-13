package kr.or.ddit.safety.prohibitedPerson.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.safety.vo.ProhibitedPersonVO;

@Mapper
public interface ProhibitedPersonDAO {

	/**
	 * 입출국금지자 등록
	 * @param proPerson
	 * @return
	 */
	public int insertPPerson(ProhibitedPersonVO proPerson);
	
	
	/**
	 * 입국금지자 전체조회
	 * @return
	 */
	public List<ProhibitedPersonVO> selectEnterPersonList();
	
	
	/**
	 * 출국금지자 전체조회
	 * @return
	 */
	public List<ProhibitedPersonVO> selectExitPersonList();
	
	
	/**
	 * 입출국금지자 상세조회
	 * @param pno
	 * @return
	 */
	public ProhibitedPersonVO selectPPerson(String pno);
	
	
	/**
	 * 입출국금지자 수정
	 * @param proPerson
	 * @return
	 */
	public int updatePPerson(ProhibitedPersonVO proPerson);
	
	/**
	 * 입출국금지자 삭제 
	 * @param pno
	 * @return
	 */
	public int deletePPerson(String pno);
	
	
	
	
}
