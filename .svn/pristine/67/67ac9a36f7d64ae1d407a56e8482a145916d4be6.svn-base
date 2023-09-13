package kr.or.ddit.Infra.facility.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.safety.vo.FacilityVO;

@Mapper
public interface FacilityDAO {
	
	public List<FacilityVO> convFacilityList();

	public List<FacilityVO> searchFacilityList();
	
	public List<FacilityVO> facilityList();
	
	public FacilityVO getFacility(String fcCd);
	
	public int updateFacility(FacilityVO fcVO);
}
