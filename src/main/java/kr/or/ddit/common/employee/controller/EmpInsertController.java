package kr.or.ddit.common.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.account.service.AccountService;
import kr.or.ddit.common.employee.service.EmpService;
import kr.or.ddit.common.vo.AccountVO;
import kr.or.ddit.common.vo.EmployeeVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/hr/emp/empInsert.do")
public class EmpInsertController {

//	private final AccountService service;
	private final EmpService service;

	@ModelAttribute
	public EmployeeVO emp() {
		return new EmployeeVO();
	}

	@GetMapping
	public String empForm(@ModelAttribute("emp") EmployeeVO emp, Model model ) {
		model.addAttribute("emp", emp);
		return "hr/emp/empForm";
	}

	@PostMapping
	public String empInsert(
			@Validated @ModelAttribute("emp") EmployeeVO emp,
			BindingResult errors,
			Model model
			) {
		String viewName = null;
		
		if (!errors.hasErrors()) {
			boolean success = service.createEmp(emp);
			if (success) {
				viewName = "redirect:/hr/emp/empList.do";
			} else {
				model.addAttribute("message", "계정 생성 중 문제 발생");
				viewName = "hr/emp/empForm";
			}
		} else {
			viewName = "hr/emp/empForm";
			System.out.println(errors.getAllErrors());
		}

		return viewName;
	}
}
