package kr.or.ddit.operate.bidNotice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.operate.vo.bidNoticeVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface BidNoticeDAO {
	
	public int insertBn(bidNoticeVO bn);
	
	public long selectTotalRecord(PaginationInfo paging);
	
	public List<bidNoticeVO> selectBnList();
	
	public bidNoticeVO selectBn(int bnNo);
	
	public int updateBn(bidNoticeVO bn);
	
	public int deleteBn(int bnNo);
	
	public int updateBnStatus(bidNoticeVO bn);
	
	

}
