package kr.or.ddit.Infra.stock.service;

import java.util.List;

import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaginationInfo;

/**
 * 재고관리 Business Logic Layer
 *
 */
public interface StockService {

	/**
	 * 재고 목록 조회
	 * @return
	 */
	public List<stockVO> retrieveStockList(PaginationInfo paging);
	
	/**
	 * 품목등록
	 * @param stock
	 * @return
	 */
	public ServiceResult createStock(stockVO stock);
	
	public ServiceResult modifyStock(stockVO stock);
	
	public stockVO selectoneRetrieve(String stId);
	
}
