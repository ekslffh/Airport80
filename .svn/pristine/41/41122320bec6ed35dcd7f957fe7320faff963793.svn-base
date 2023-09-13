package kr.or.ddit.hr.vacationReq.controller;

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
import kr.or.ddit.hr.vacationReq.service.VacationService;
import kr.or.ddit.hr.vo.VacationReqVO;
import lombok.RequiredArgsConstructor;

// 신청 컨트롤러 
@Controller
@RequiredArgsConstructor
public class VacationReqInsertController {

   private final VacationService service;
   
   @ModelAttribute("vacreq")
   public VacationReqVO vacationReq() {
       return new VacationReqVO();
   }
   
   @GetMapping("/hr/vacation/vacationForm.do")
   public String vacReqForm(
         Authentication authentication
         , @ModelAttribute("vacreq") VacationReqVO vacreq
         , Model model
      ) {
      AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
      EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
      String emp = empVO.getEmpNo();
      
      VacationReqVO vac = new VacationReqVO();
      
      vac.setVrEmpNo(emp);
      
      model.addAttribute("vacreq", vacreq);
      return "hr/vacation/ajax/vacationForm";
   }
   
   @PostMapping("/hr/vacation/vacationForm.do")
   public String vacReqInsert(
      @ModelAttribute("vacreq") VacationReqVO vacreq
      , BindingResult errors
      , Model model
   ) {
      String viewName = null;
      if (!errors.hasErrors()) {
         boolean success = service.createVacreq(vacreq);
         if (success) {
        	model.addAttribute("message", "휴가 신청이 완료되었습니다.");
            viewName = "redirect:/in";
         } else {
            model.addAttribute("message", "휴가 신청 중 문제 발생");
            viewName = "in";
         }
      } else {
         viewName = "in";
      }
      return viewName;
   }
}