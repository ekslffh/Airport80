package kr.or.ddit.operate.airline.service;

import java.util.List;

import kr.or.ddit.operate.vo.AirlineVO;
import kr.or.ddit.vo.PaginationInfo;

public interface AirlineService {
	public List<AirlineVO> retrieveAirlineList(PaginationInfo paging);

	public AirlineVO retrieveAirline(String alCd);

	public boolean createAirline(AirlineVO Airline);

	public boolean modifyAirline(AirlineVO Airline);

	public boolean removeAirline(AirlineVO Airline);
	
	public boolean modfiyStatus(AirlineVO Airline);
	
	public String getLogo(String alCd);
	
	// 총 개수
	public long countTotal(PaginationInfo paging);
	
	// 운영 중인 항공사 갯수
	public long countAirlineOn(AirlineVO airline);
	
	// 정지 중인 항공사 갯수
	public long countAirlineStop(AirlineVO airline);
	
	// 폐업한 항공사 갯수
	public long countAirlineOff(AirlineVO airline);
	
}
