package kr.or.ddit.operate.bidApplication.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.operate.vo.bidApplicationVO;
import kr.or.ddit.operate.vo.bidNoticeVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface BidApplDAO {
	
	public int insertBa(bidApplicationVO ba);
	
	public long selectTotalRecord(PaginationInfo paging);
	
	public List<bidApplicationVO> selectBaList(PaginationInfo paging);
	
	public bidApplicationVO selectBa(String baId);
	
	public int updateBa(bidApplicationVO ba);
	
	public int deleteBa(String baId);
	
	public int updateBaStatus(bidApplicationVO ba);
	
	public List<bidApplicationVO> selectNoBaList(int bnNo);
	

}
