package kr.or.ddit.Infra.stockOrder.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.Infra.vo.stockOrderDetailVO;
import kr.or.ddit.Infra.vo.stockOrderVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface StockOrderDAO {
	
	public int insertStockOrder(stockOrderVO stockOrder);
	
	public int insertStockOrderDetail(stockOrderDetailVO detail);
	
	public List<stockOrderVO> selectStockOrderList(PaginationInfo paging);
	
	public stockOrderDetailVO selectStock(String soId);
	
	public long selectTotalRecord(PaginationInfo paging);
	
	public stockOrderVO selectList(String soId);
	
	public int modifyStockCnt(String soId);
	
	public int modifyStockStatus(String soId);
}
