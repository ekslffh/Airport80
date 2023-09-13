package kr.or.ddit.publicdata.flight.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.operate.vo.AirlineVO;
import kr.or.ddit.publicdata.flight.dao.FSOthersDAO;
import kr.or.ddit.vo.AirPortsVO;

@Service
public class FSServiceImpl implements FSService {

	@Inject
	private FSOthersDAO fsoDao;

	@Override
	public List<AirlineVO> selectAirlineList() {
		return fsoDao.selectAirlineList();
	}

	@Override
	public AirlineVO selectAirline(String alCd) {
		return fsoDao.selectAirline(alCd);
	}

	@Override
	public List<AirPortsVO> selectAirportList() {
		return fsoDao.selectAirportList();
	}

	@Override
	public AirPortsVO selectAirport(String apCd) {
		return fsoDao.selectAirport(apCd);
	}
}
