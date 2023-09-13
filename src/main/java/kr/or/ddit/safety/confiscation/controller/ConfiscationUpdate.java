package kr.or.ddit.safety.confiscation.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.safety.confiscation.dao.OtherDAO;
import kr.or.ddit.safety.confiscation.service.ConfiscationService;
import kr.or.ddit.safety.vo.ConfiscationInfoVO;
import kr.or.ddit.safety.vo.ConfiscationVO;
import kr.or.ddit.safety.vo.SecurityLogVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.validate.UpdateGroup;

@Controller
@RequestMapping("/safety/confisUpdate.do")
public class ConfiscationUpdate {

	@Inject
	private ConfiscationService service;
	
	@Inject
	private OtherDAO otherDAO;
	
	@ModelAttribute("confisInfo")
	public List<ConfiscationInfoVO> confisInfo(){
		return otherDAO.selectConfisInfoList();
	}
	
	@ModelAttribute("zoneList")
	public List<ZoneVO> zoneList(){
		return otherDAO.selectZoneList();
	}
	
	//보안일지 ID 전체조회(모달)
	@ModelAttribute("securityList")
	public List<SecurityLogVO> securityList(){
		return otherDAO.selectSecurityList();
	}
	
	@ModelAttribute("confis")
	public ConfiscationVO confis(){
		return new ConfiscationVO();
	}
	
	@GetMapping
	public String updateForm(
			@RequestParam(name="what", required = true) String csId
			, Model model
			) {
		ConfiscationVO confis = service.retrieveConfiscation(csId);
		model.addAttribute("confis", confis);
		
		return "safety/confiscation/confiscationUpdate";
	}
	
	 
	@PostMapping
	public String updateProcess(
			Model model
			, @Validated(UpdateGroup.class)
			@ModelAttribute("confis") ConfiscationVO confis
			, BindingResult errors
			) {
		
			String logicalViewName = null;
			if(!errors.hasErrors()) {
				ServiceResult result = service.modifyConfiscation(confis);
				if(ServiceResult.OK == result) {
					logicalViewName = "redirect:/safety/confisView.do?what=" + confis.getCsId();
				}else {
					model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요.");
					logicalViewName = "safety/confiscation/confiscationUpdate";
				}
			}else {
				logicalViewName = "safety/confiscation/confiscationUpdate";
			}
		return logicalViewName;
	}
}
