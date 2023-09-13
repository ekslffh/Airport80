package kr.or.ddit.Infra.facility.service;

import java.util.List;

import kr.or.ddit.safety.vo.FacilityVO;

public interface FacilityService {
	
	public List<FacilityVO> getConvList();

	public List<FacilityVO> searchFacilityList();
	
	public List<FacilityVO> categoryFacility();
	
	public FacilityVO getOneFacility(String fcCd);
	
	public int changeFacility(FacilityVO fsVO);
	
}
