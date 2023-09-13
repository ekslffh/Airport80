package kr.or.ddit.Infra.stockOrder.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.Infra.stockOrder.dao.StockOrderDAO;
import kr.or.ddit.Infra.stockOrderDetail.dao.OrderDetailDAO;
import kr.or.ddit.Infra.vo.stockOrderDetailVO;
import kr.or.ddit.Infra.vo.stockOrderVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class StockOrderServiceImpl implements StockOrderService {
	
	@Inject
	private StockOrderDAO soDAO;
	private OrderDetailDAO odDAO;
	
	@Override
	public ServiceResult createStockList(stockOrderVO stockOrder) {
		System.out.println("Received stockOrder: "+ stockOrder);
		// STOCK_ORDER 테이블에 데이터 삽입
	    int insertCount = soDAO.insertStockOrder(stockOrder);
	    if (insertCount > 0) {
	        List<stockOrderDetailVO> stockOrderDetails = stockOrder.getStockOrderDetail();
	        System.out.println(stockOrder);
	        
	        for (stockOrderDetailVO detail : stockOrderDetails) {
	        	System.out.println(stockOrder);
	        	
	            detail.setSoId(stockOrder.getSoId());
	            // STOCK_ORDER_DETAIL 테이블에 데이터 삽입
	            int detailInsertCount = soDAO.insertStockOrderDetail(detail);
	            // detailInsertCount 체크 및 처리
	        }
	    }
	    return insertCount > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult updateStockCnt(String soId) {
	    boolean isModified = soDAO.modifyStockCnt(soId) > 0 && soDAO.modifyStockStatus(soId) > 0;

	    if (isModified) {
	        return ServiceResult.OK;
	    } else {
	        return ServiceResult.FAIL;
	    }
	}
	@Override                                                                                                                                                                                                                                                                                     
	public List<stockOrderVO> retreieveStockOrderList(PaginationInfo paging) {
		long totalRecored = soDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecored);
		return soDAO.selectStockOrderList(paging);
	}

	@Override
	public stockOrderVO selectOneRetrieve(String soId) {
		stockOrderVO stockOrderOne = soDAO.selectList(soId);
		return stockOrderOne;
	}
	
	@Override
    public List<stockOrderDetailVO> selectDetail(String soId) {
        List<stockOrderDetailVO> detail = odDAO.searchOrderDetail(soId);
        return detail;
    }
	

	
}
