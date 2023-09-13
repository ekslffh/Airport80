package kr.or.ddit.Infra.stockOrderDetail.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.Infra.stockOrderDetail.dao.OrderDetailDAO;
import kr.or.ddit.Infra.vo.stockOrderDetailVO;
import kr.or.ddit.Infra.vo.stockOrderVO;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Inject
	private OrderDetailDAO odDAO;
	
	@Override
	public stockOrderDetailVO selectone(String stId) {
		stockOrderDetailVO stock = odDAO.searchStId(stId);
		return stock;
	}

	@Override
	public List<stockOrderDetailVO> selectDetail(String soId) {
		List<stockOrderDetailVO> detail = odDAO.searchOrderDetail(soId);
		return detail;
	}

}
