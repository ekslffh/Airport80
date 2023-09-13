package kr.or.ddit.safety.confiscationInfo.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.safety.confiscationInfo.service.ConfiscationInfoService;
import kr.or.ddit.safety.vo.ConfiscationInfoVO;
import kr.or.ddit.validate.UpdateGroup;

@Controller
@RequestMapping("/safety/confisInfoUpdate.do")
public class ConfisInfoUpdate {
	
	@Inject
	private ConfiscationInfoService service;
	
	@ModelAttribute("confisInfo")
	public ConfiscationInfoVO confisInfo() {
		return new ConfiscationInfoVO();
	}
	
	// 수정폼으로 이동
	@GetMapping
	public String updateForm(
			@RequestParam(name="what", required = true)int ciNo,
			Model model
			) {
		ConfiscationInfoVO confisInfo = service.retrieveConfisInfo(ciNo);
		model.addAttribute("confisInfo",confisInfo);
				
		return "safety/confisInfo/confisInfoUpdate";
	}
	
	
	//수정
	@PostMapping
	public String confisInfoUpdate(
		@Validated(UpdateGroup.class)
		@ModelAttribute("confisInfo") ConfiscationInfoVO confisInfo,
		Model model,
		Errors errors
			) {
		String logicalViewName = null;
		
		if(!errors.hasErrors()) {
			int result = service.modifyConfisInfo(confisInfo);
			
			if(result>0) {
				logicalViewName = "redirect:/safety/confisInfoView.do?what=" + confisInfo.getCiNo();
			}else {
				model.addAttribute("message", "반입불가품목 수정 중 문제 발생");
				logicalViewName = "safety/confisInfo/confisInfoUpdate";
			}
			
		}else {
			model.addAttribute("message", "반입불가품목 수정 중 문제 발생");
			logicalViewName = "safety/confisInfo/confisInfoUpdate";
		}
		
		return logicalViewName;
	}
}
