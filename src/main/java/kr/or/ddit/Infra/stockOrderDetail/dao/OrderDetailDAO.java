package kr.or.ddit.Infra.stockOrderDetail.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.Infra.vo.stockOrderDetailVO;

@Mapper
public interface OrderDetailDAO {

	public stockOrderDetailVO searchStId(String stId);
	
	public List<stockOrderDetailVO> searchOrderDetail(String soId);
	
}
