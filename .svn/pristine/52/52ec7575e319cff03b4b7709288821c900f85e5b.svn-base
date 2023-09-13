package kr.or.ddit.operate.airline.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.operate.vo.AirlineVO;
import kr.or.ddit.vo.PaginationInfo;


@Mapper
public interface AirlineDAO {
	public AirlineVO selectAirline(String alCd);

	public int insertAirline(AirlineVO airline);

	public long selectTotalRecord(PaginationInfo paging);

	public List<AirlineVO> selectAirlineList(PaginationInfo paging);

	public int updateAirline(AirlineVO airline);

	public int deleteAirline(@Param("alCd") AirlineVO airline);

	public int updateAirlineStatus(AirlineVO airline);

	public String getLogo(String alCd);

	// 운영 중인 항공사 갯수
	public long countAirlineOn(AirlineVO airline);

	// 정지 중인 항공사 갯수
	public long countAirlineStop(AirlineVO airline);

	// 폐업한 항공사 갯수
	public long countAirlineOff(AirlineVO airline);
}
