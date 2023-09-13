package kr.or.ddit.common.employee.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.employee.service.EmpService;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.hr.vo.LeaveEmpVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/hr/emp/")
public class EmpRetrieveController {

	private final EmpService service;
		
	@RequestMapping("empList.do")
	public void empList(
		@RequestParam(name="page", required=false, defaultValue="1") long currentPage
		, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
		, Model model
	) {
		PaginationInfo<EmployeeVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<EmployeeVO> empList = service.retrieveEmpList(paging);
		
		paging.setDataList(empList);
		
		model.addAttribute("paging", paging);
		
	}
	
	@RequestMapping("empView.do")
	public String empView (
		@RequestParam(name="what", required=true) String empNo
		, Model model
	) {
		EmployeeVO emp = service.retrieveEmp(empNo);
		model.addAttribute("emp", emp);
		
		return "hr/emp/empView";		
	}
	
	@RequestMapping("empModal.do")
	public String empModal (
			@RequestParam(name="what", required=true) String empNo
			, Model model
			) {
		EmployeeVO emp = service.retrieveEmp(empNo);
		model.addAttribute("emp", emp);
		
		return "hr/emp/ajax/empModal";		
	}
	
	

	
	@RequestMapping("ajax/empMypage.do")
	public String empMy(@RequestParam(name="what", required = true) String empNo, Model model) {
		EmployeeVO emp = service.retrieveEmpMy(empNo);
		model.addAttribute("emp", emp);
		return "hr/emp/ajax/empMypage";
	}

		
		
	}
	

