package kr.or.ddit.hr.eplStatus.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.hr.common.dao.HrCommonDAO;
import kr.or.ddit.hr.eplStatus.service.EplstatusService;
import kr.or.ddit.hr.vo.EplstatusVO;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/hr/parking/eplInsert.do")
public class EplstatusInsertController {

	private final EplstatusService service;
	
	@Inject
	private HrCommonDAO HCDao;
	
	@ModelAttribute("eplstatus")
	public EplstatusVO eplstatus() {
		return new EplstatusVO();
	}
	
	@ModelAttribute("parkArea")
	public List<CommonCodeVO> parckArea(){
		return HCDao.selectEpList();
	}
	
	@GetMapping
	public String eplstatusForm(Authentication authentication, Model model) {
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		String emp = empVO.getEmpNo();
		EplstatusVO eplVO = service.checkEpl(emp);
		if(eplVO != null) {
			model.addAttribute("epl", eplVO);
		}
		return "hr/parking/eplForm";
	}
	
	@PostMapping
	public String eplstatusInsert(
		@Validated @ModelAttribute("eplStatus") EplstatusVO eplStatus,
		BindingResult errors,
		Model model
	) {
		String viewName = null;
		
		if(eplStatus.getEplId() == "") {
			System.out.println("입력으로 들어옴");
			if(!errors.hasErrors()) {
				boolean success = service.createEplstatus(eplStatus);
				if (success) {
					viewName = "redirect:/hr/parking/eplInsert.do";
				} else {
					model.addAttribute("message", "주차장 신청폼 작성 중 문제 발생");
					viewName = "hr/parking/eplForm";
				}
			} else {
				viewName = "hr/parking/eplForm";
			}
			return viewName;
		} else {
			if (!errors.hasErrors()) {
				boolean success = service.modifyEplAll(eplStatus);
				if(success) {
					model.addAttribute("message", "주차장 신청내역 수정이 완료되었습니다.");
					viewName = "redirect:/hr/parking/eplInsert.do";
				} else {
					model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요");
					viewName = "hr/parking/eplList.do";
				}
			} else {
				viewName = "hr/parking/eplList.do";
			}
			return viewName;
		}
		
//		if(!errors.hasErrors()) {
//			boolean success = service.createEplstatus(eplStatus);
//			if (success) {
//				viewName = "redirect:/hr/parking/eplView.do?what=" + eplStatus.getEplId();
//			} else {
//				model.addAttribute("message", "주차장 신청폼 작성 중 문제 발생");
//				viewName = "hr/parking/eplForm";
//			}
//		} else {
//			viewName = "hr/parking/eplForm";
//		}
//		return viewName;
	}
	
//	@PostMapping("eplUpdate.do")
//	public String updateEplAll (
//		Model model
//		, @ModelAttribute("eplStatus") EplstatusVO epl
//		, BindingResult errors
//	) {
//		
//		String viewName = null;
//		
//		model.addAttribute("eplStatus", epl);
//		
//		if (!errors.hasErrors()) {
//			boolean success = service.modifyEplAll(epl);
//			if(success) {
//				viewName = "redirect:/hr/parking/eplView.do?what=" + epl.getEplId();
//			} else {
//				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요");
//				viewName = "hr/parking/eplList.do";
//			}
//		} else {
//			viewName = "hr/parking/eplList.do";
//		}
//		return viewName;
//	}
	
}
