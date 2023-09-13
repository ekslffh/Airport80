package kr.or.ddit.operate.bidNotice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CommonCodeVO;

@Mapper
public interface BidCommonDAO {
	
	List<CommonCodeVO> selectBidStuList();

	
	

}
