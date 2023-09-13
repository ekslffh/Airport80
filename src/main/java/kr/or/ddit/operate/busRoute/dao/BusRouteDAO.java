package kr.or.ddit.operate.busRoute.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.operate.vo.busRouteVO;

@Mapper
public interface BusRouteDAO {
	
	public int insertBr(busRouteVO br);
	
	public List<busRouteVO> selectBrList();
	
	public busRouteVO selectBr(String brId);
	


}
