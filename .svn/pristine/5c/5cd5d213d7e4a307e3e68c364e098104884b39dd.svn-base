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

import kr.or.ddit.safety.confiscationInfo.service.ConfiscationInfoService;
import kr.or.ddit.safety.vo.ConfiscationInfoVO;
import kr.or.ddit.validate.InsertGroup;

@Controller
@RequestMapping("/safety/confisInfoInsert.do")
public class ConfisInfoInsert {
	
	@Inject
	private ConfiscationInfoService service;
	
	@ModelAttribute("confisInfo")
	public ConfiscationInfoVO confisInfo() {
		return new ConfiscationInfoVO();
	}
	
	//등록폼으로 이동
	@GetMapping
	public String insertForm() {
		return "safety/confisInfo/confisInfoInsert";
	}
	
	//등록 
	@PostMapping
	public String confisInsert(
			@Validated(InsertGroup.class) 
			@ModelAttribute("confisInfo") ConfiscationInfoVO confisVO
			, Errors errors
			,Model model
			) {
			
			String logicalViewName = null;
			
			if(!errors.hasErrors()) {
				int result = service.createConfisInfo(confisVO);
				if(result>0) {
					logicalViewName = "redirect:/safety/confisInfoView.do?what=" + confisVO.getCiNo();
				}else {
					model.addAttribute("message", "반입불가품목 등록 중 문제 발생");
					logicalViewName = "safety/confisInfo/confisInfoInsert";
				}
			}else {
				logicalViewName = "safety/confisInfo/confisInfoInsert";
			}
		return logicalViewName;
	}
	
	
	
}
