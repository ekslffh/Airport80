package kr.or.ddit.Infra.stockOrder.service;



import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.Infra.vo.stockOrderDetailVO;
import kr.or.ddit.Infra.vo.stockOrderVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaginationInfo;


public interface StockOrderService {
	
	public ServiceResult createStockList(stockOrderVO stockOrder);
	
	public List<stockOrderVO> retreieveStockOrderList(PaginationInfo paging);

	public stockOrderVO selectOneRetrieve(String soId);

	public List<stockOrderDetailVO> selectDetail(String soId);

	public ServiceResult updateStockCnt(String soId);
	
}
