package kr.or.ddit.Infra.stock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.Infra.stock.dao.StockDAO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class StockServiceImpl implements StockService {

	@Inject
	private StockDAO stockDAO;
	
	@Override
	public List<stockVO> retrieveStockList(PaginationInfo paging) {
		long totalRecord = stockDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return stockDAO.selectStockList(paging);
	}

	@Override
	public ServiceResult createStock(stockVO stock) {
		return stockDAO.insertStock(stock) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyStock(stockVO stock) {
		return stockDAO.updateStock(stock) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public stockVO selectoneRetrieve(String stId) {
		stockVO stockList = stockDAO.selectOne(stId);
		return stockList;
	}
	

}
