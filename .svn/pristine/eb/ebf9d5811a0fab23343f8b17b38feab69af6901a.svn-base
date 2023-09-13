package kr.or.ddit.operate.airline.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.operate.airline.dao.AirlineDAO;
import kr.or.ddit.operate.vo.AirlineVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class AirlineSerivceImpl implements AirlineService {

	@Inject
	private AirlineDAO airlineDAO;

	@Override
	public List<AirlineVO> retrieveAirlineList(PaginationInfo paging) {
		long totalRecord = airlineDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);

		return airlineDAO.selectAirlineList(paging);
	}

	@Override
	public AirlineVO retrieveAirline(String alCd) {
		return airlineDAO.selectAirline(alCd);
	}

	@Override
	public boolean createAirline(AirlineVO Airline) {
		return airlineDAO.insertAirline(Airline) > 0;
	}

	@Override
	public boolean modifyAirline(AirlineVO Airline) {
		return airlineDAO.updateAirline(Airline) > 0;
	}

	@Override
	public boolean removeAirline(AirlineVO Airline) {
		return airlineDAO.deleteAirline(Airline) > 0;
	}

	@Override
	public boolean modfiyStatus(AirlineVO Airline) {
		return airlineDAO.updateAirlineStatus(Airline) > 0;
	}

	@Override
	public String getLogo(String alCd) {
		return airlineDAO.getLogo(alCd);
	}

	@Override
	public long countTotal(PaginationInfo paging) {
		return airlineDAO.selectTotalRecord(paging);
	}

	@Override
	public long countAirlineOn(AirlineVO airline) {
		return airlineDAO.countAirlineOn(airline);
	}

	@Override
	public long countAirlineStop(AirlineVO airline) {
		return airlineDAO.countAirlineStop(airline);
	}

	@Override
	public long countAirlineOff(AirlineVO airline) {
		return airlineDAO.countAirlineOff(airline);
	}

}
