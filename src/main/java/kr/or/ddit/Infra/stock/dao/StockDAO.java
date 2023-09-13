package kr.or.ddit.Infra.stock.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface StockDAO {

	/**
	 * 재고 목록 조회
	 * @return
	 */
	public List<stockVO> selectStockList(PaginationInfo paging);
	public List<stockVO> selectStockListToReq(String stNm);

	/**
	 * 상품 등록
	 * @param stock
	 * @return
	 */
	public int insertStock(stockVO stock);

	public int updateStock(stockVO stock);
	
	public stockVO selectOne(String stId);
	
	public long selectTotalRecord(PaginationInfo paging);
	
	public List<stockVO> selectStockListByCtgr();
	
	
}
