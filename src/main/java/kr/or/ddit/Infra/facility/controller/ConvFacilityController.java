package kr.or.ddit.Infra.facility.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.Infra.facility.service.FacilityService;
import kr.or.ddit.safety.vo.FacilityVO;

@Controller
public class ConvFacilityController {

	@Inject
	private FacilityService service;
	
	@RequestMapping(value = "/infra/ConvFacilityList.do")
	public String convFacility(Model model) throws Exception {
		List<FacilityVO> convList = service.getConvList();
		model.addAttribute("convList", convList);
		return "infra/facility/convFacility";
	}
	
}
