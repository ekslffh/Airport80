package kr.or.ddit.safety.confiscation.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.safety.confiscation.service.ConfiscationService;
import kr.or.ddit.safety.vo.ConfiscationVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/safety")
public class ConfiscationController {

	private final ConfiscationService service;
	
	@ModelAttribute("confis")
	public ConfiscationVO confis() {
		return new ConfiscationVO();
	}
	
	// 압수품 조회 
	@RequestMapping("confiscation.do")
	public String confiscationList(
			 @RequestParam(name="page", required = false, defaultValue = "1" ) long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			,Model model
			) {
			//pagination 객체 생성
			PaginationInfo<ConfiscationVO> paging = new PaginationInfo<>(10,5);
			paging.setCurrentPage(currentPage);
			paging.setSimpleCondition(simpleCondition);
			
			List<ConfiscationVO> confiscationList = service.retrieveConfisList(paging);
			
			//총개수
			long totalCount = service.countTotal(paging);
			
			paging.setDataList(confiscationList);
			
			model.addAttribute("paging", paging);
			model.addAttribute("totalCount", totalCount);
			
			return "safety/confiscation/confiscationList";
	}
	
	
	// 압수품 상세조회
	@RequestMapping("confisView.do")
	public ModelAndView confiscationVeiw(
			@RequestParam(name="what", required = true) String csId
			) {
		ConfiscationVO confis = service.retrieveConfiscation(csId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("confis", confis);
		mav.setViewName("safety/confiscation/confiscationView");
		
		return mav;
	}
	
	// 압수품 삭제
	@RequestMapping("confisdelete.do")
	public String confisDelete(
			@RequestParam("csId") String csId,
			RedirectAttributes redirectAttributes
			) {
		 ServiceResult result = service.removeConfiscation(csId);
		 String logicalViewName = null;
		 if(ServiceResult.OK == result) {
			 logicalViewName = "redirect:/safety/confiscation.do";
		 }else {
			 redirectAttributes.addFlashAttribute("message","압수품 삭제 실패");
			 logicalViewName = "redirect:/safety/confisView.do?what" + csId;
		 }
		 return logicalViewName;
	}
	
	// 압수품 상태변경
	@RequestMapping("confisMthdUpdate.do")
	public String dispoRsnUpdate(
			Model model,
			@ModelAttribute("confis") ConfiscationVO confis,
			@ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Errors errors
			) {
		
		System.out.println("vo야!!!!"+confis);
		
		String logicalViewName = null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyconfisMthd(confis);
			if(ServiceResult.OK == result) {
				
				String message = "상태가 변경되었습니다.";
				String encodedMessage = null;
				
				try {
					encodedMessage = URLEncoder.encode(message, "UTF-8");
				} catch (UnsupportedEncodingException e) {
//					e.printStackTrace();
				}
				logicalViewName = "redirect:/safety/confiscation.do?message=" + encodedMessage;
				
			}else {
				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요.");
				logicalViewName = "safety/confiscation/confiscationList";
			}
		}else {
			logicalViewName = "safety/confiscation/confiscationList";
		}
		return logicalViewName;
	}  
	
	
	// 폐기물 등록폼
	@GetMapping("confisdisposal.do")
	public ModelAndView disposalForm(
			@RequestParam(name="what", required = true) String csId
			,Model model
			) {
		ConfiscationVO confis = service.retrieveConfiscation(csId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("confis", confis);
		mav.setViewName("safety/confiscation/confisdisposalForm");
		
		return mav;
	}
	
	// 폐기물 등록 
	@PostMapping("confisdisUpdate.do")
	public String disposalUpdate(
			Model model,
			@ModelAttribute("confis") ConfiscationVO config
			,RedirectAttributes redirectAttributes
			) {
		String logicalViewName = null;
		
		if(StringUtils.isNotBlank(config.getCsId()))  {
			
			ServiceResult result = service.modifyconfisDisposal(config);
			
			if(ServiceResult.OK == result) {
				
				String message = "폐기 완료되었습니다.";
				String encodedMessage = null;
				
				try {
					encodedMessage = URLEncoder.encode(message, "UTF-8");
				} catch (UnsupportedEncodingException e) {
//					e.printStackTrace();
				}
				logicalViewName = "redirect:/safety/disposal/list.do?message=" + encodedMessage;
				
			}else {
				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요.");
				logicalViewName = "safety/confiscation/confisdisposalForm";
			}
		}else {
			logicalViewName = "safety/confiscation/confisdisposalForm";
		}
	return logicalViewName;
	}
	
	
}
