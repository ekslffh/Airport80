package kr.or.ddit.operate.custNoticeBrd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.operate.vo.CustNoticeBrdVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface CustNoticeBrdDAO {
	
	public int insertCnb(CustNoticeBrdVO cnb);
	
	public long selectTotalRecord(PaginationInfo paging);
	
	public List<CustNoticeBrdVO> selectCnbList(PaginationInfo paging);
	
	public CustNoticeBrdVO selectCnb(int cnbNo);
	
	public int updateCnb(CustNoticeBrdVO cnb);
	
	public int deleteCnb(int cnbNo);
	
	public void increaseViews(int cnbVws);
	
}
