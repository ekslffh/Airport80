package kr.or.ddit.Infra.stockOrderDetail.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.Infra.stockOrderDetail.dao.OrderDetailDAO;
import kr.or.ddit.Infra.vo.stockOrderDetailVO;

@Service
public interface OrderDetailService {

	public stockOrderDetailVO selectone(String stId);
	
	public List<stockOrderDetailVO> selectDetail(String soId);
	
}
