package kr.or.ddit.Infra.facility.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.Infra.facility.service.FacilityService;
import kr.or.ddit.Infra.stock.dao.OthersDAO;
import kr.or.ddit.safety.vo.FacilityVO;
import kr.or.ddit.safety.vo.ZoneVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class facilityRetrieveController {

	private final FacilityService service;
	
	private final OthersDAO othersDAO;
	
	@ModelAttribute("facility")
	public FacilityVO facility() {
		return new FacilityVO();
	}
	
	@ModelAttribute("zoneList")
	public List<ZoneVO> zoneList() {
		return othersDAO.selectAllZoneList();
	}
	
	@ModelAttribute("facilityList")
	public List<FacilityVO> facilityList(){
		return service.categoryFacility();
	}
	
	@GetMapping("infra/facility.do")
	public String getlist() {
		return "infra/facility/facility";
	}
	
	@RequestMapping(value = "infra/getfacility.do" , produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public FacilityVO getone(
			@RequestParam("fcCd") String fcCd
			) {
		FacilityVO fcVO = new FacilityVO();
		fcVO = service.getOneFacility(fcCd);
		return fcVO;
	}
	
	@RequestMapping(value = "infra/updatefacility.do" , consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int updateone(
			@RequestBody FacilityVO fcVO, Errors errors 
			) {
		int resp = service.changeFacility(fcVO);
		return resp;
	}
	
}
