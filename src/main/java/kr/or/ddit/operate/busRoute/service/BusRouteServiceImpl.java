package kr.or.ddit.operate.busRoute.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.operate.busRoute.dao.BusRouteDAO;
import kr.or.ddit.operate.vo.busRouteVO;

@Service
public class BusRouteServiceImpl implements BusRouteService{

	@Inject
	private BusRouteDAO dao;
	
	@Override
	public List<busRouteVO> retrieveBrList() {
		return dao.selectBrList();
	}

	@Override
	public boolean createBr(busRouteVO br) {
		return dao.insertBr(br) > 0;
	}

	@Override
	public busRouteVO retrieveBr(String brId) {
		return dao.selectBr(brId);
	}


	
	
	

}
