package kr.or.ddit.hr.empBrd.service;

import java.util.List;

import kr.or.ddit.hr.vo.EmpbrdVO;
import kr.or.ddit.vo.PaginationInfo;

public interface EmpbrdService {
	
	public List<EmpbrdVO> retrieveEmpbrdList(PaginationInfo paging);
	public List<EmpbrdVO> retrieveEbpubList();
	
	public EmpbrdVO retrieveEmpbrd(int ebNo);
	
	public boolean createEmpbrd(EmpbrdVO board);
	public boolean modfiyEmpbrd(EmpbrdVO board);
	public boolean removeEmpbrd(EmpbrdVO board);
	public void increaseViews(int ebVws);
	
}