package kr.or.ddit.safety.confiscation.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.safety.confiscation.dao.OtherDAO;
import kr.or.ddit.safety.confiscation.service.ConfiscationService;
import kr.or.ddit.safety.vo.ConfiscationInfoVO;
import kr.or.ddit.safety.vo.ConfiscationVO;
import kr.or.ddit.safety.vo.SecurityLogVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.validate.InsertGroup;

@Controller
@RequestMapping("/safety")
public class ConfiscationInsert {
	
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
	
	@ModelAttribute("securityList")
	public List<SecurityLogVO> securityList(){
		return otherDAO.selectSecurityList();
	}
	
	
	
	@ModelAttribute("confis")
	public ConfiscationVO confis(){
		return new ConfiscationVO();
	}
	@GetMapping("/confisInsert.do")
	public String getHandler() {
		return "safety/confiscation/confiscationInsert";
	}
	
	@PostMapping("confisInsertPost.do")
	public String postHandler(
		Model model
		, @Validated(InsertGroup.class)
		  @ModelAttribute("confis") ConfiscationVO confis
		, Errors errors
		, Authentication authentication
	) {
		String logicalViewName = null;
		if(!errors.hasErrors()) {
			
			//writer 넣어주기(로그인한 계정)
//			AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
//			EmployeeVO employee = (EmployeeVO)wrapper.getRealUser();
//			String writer = employee.getEmpNo();
//			
//			confis.setCsWriter(writer);
			
			ServiceResult result = service.createConfiscation(confis);
			if(ServiceResult.OK == result) {
				logicalViewName =  "redirect:/safety/confisView.do?what=" + confis.getCsId();
			}else {
				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요.");
				logicalViewName = "safety/confiscation/confiscationInsert";
			}
		}else {
			logicalViewName = "safety/confiscation/confiscationInsert";
		}
		
		return logicalViewName;
	}
	
}
