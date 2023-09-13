package kr.or.ddit.common.employee.controller;

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

import kr.or.ddit.common.employee.dao.EmployeeDAO;
import kr.or.ddit.common.employee.service.EmpService;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.UpdateGroup;

@RequestMapping("/hr/emp")
@Controller
public class EmpUpdateController {

	@Inject
	private EmpService service;
	
//	@Inject
//	private EmployeeDAO empDAO;
	
	@GetMapping("empUpdate.do")
	public String updateForm(
			Model model
			, @RequestParam("what") String empNo
		) {
//			int empN = Integer.parseInt(empNo);
			EmployeeVO emp = service.retrieveEmp(empNo);
			model.addAttribute("emp", emp);
			
			return "hr/emp/empEdit";
		}
	
	@PostMapping("empUpdate.do")
	public String updateEmp (
		Model model
		, @Validated(UpdateGroup.class) @ModelAttribute("emp") EmployeeVO emp
		, BindingResult errors
	) {
		String viewName = null;
		
		if (!errors.hasErrors()) {
			boolean success = service.modifyEmp(emp);
			if (success) {
				viewName = "redirect:/hr/emp/empView.do?what=" + emp.getEmpNo();
			} else {
				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요.");
				viewName = "hr/emp/empForm";
			}
		} else {
			viewName = "hr/emp/empForm";
		}
		
		return viewName;
	}
}
