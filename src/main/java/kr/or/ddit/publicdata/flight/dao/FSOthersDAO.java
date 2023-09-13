package kr.or.ddit.publicdata.flight.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.operate.vo.AirlineVO;
import kr.or.ddit.vo.AirPortsVO;

@Mapper
public interface FSOthersDAO {
	
	public List<AirlineVO> selectAirlineList();
	public AirlineVO selectAirline(String alCd);
	
	public List<AirPortsVO> selectAirportList();
	public AirPortsVO selectAirport(String apCd);

}
