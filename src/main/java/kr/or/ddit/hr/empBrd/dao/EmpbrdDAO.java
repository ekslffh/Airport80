package kr.or.ddit.hr.empBrd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.hr.vo.EmpbrdVO;
import kr.or.ddit.vo.PaginationInfo;


@Mapper
public interface EmpbrdDAO {
	public long selectTotalRecord(PaginationInfo paging);
	
	public List<EmpbrdVO> selectEmpbrdList(PaginationInfo paging);
	public List<EmpbrdVO> selectEbpubList();
	
	public EmpbrdVO selectEmpbrd(int ebNo);
	public int insertEmpbrd(EmpbrdVO board);
	public int updateEmpbrd(EmpbrdVO empbrd);
	public int deleteEmpbrd(EmpbrdVO empbrd);
	
	public void increaseViews(int ebVws);
	
	



}