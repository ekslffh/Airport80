package kr.or.ddit.Infra.facility.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.Infra.facility.dao.FacilityDAO;
import kr.or.ddit.safety.vo.FacilityVO;

@Service
public class FacilityServiceImpl implements FacilityService {

	@Inject
	private FacilityDAO dao;
	
	@Override
	public List<FacilityVO> searchFacilityList() {
		return dao.convFacilityList();
	}

	@Override
	public List<FacilityVO> categoryFacility() {
		return dao.facilityList();
	}

	@Override
	public List<FacilityVO> getConvList() {
		return dao.convFacilityList();
	}

	@Override
	public FacilityVO getOneFacility(String fcCd) {
		return dao.getFacility(fcCd);
	}

	@Override
	public int changeFacility(FacilityVO fsVO) {
		return dao.updateFacility(fsVO);
	}
	
	
}
