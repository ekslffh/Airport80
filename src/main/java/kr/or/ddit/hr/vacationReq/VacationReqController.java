package kr.or.ddit.hr.vacationReq;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.collections4.Get;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.employee.service.EmpService;
import kr.or.ddit.common.schedule.service.ScheduleService;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.common.vo.ScheduleVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.hr.empLeave.service.EmpLeaveService;
import kr.or.ddit.hr.vacationReq.service.VacationService;
import kr.or.ddit.hr.vo.LeaveEmpVO;
import kr.or.ddit.hr.vo.VacationReqVO;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import kr.or.ddit.vo.calendaradapter.FullCalendarEvent;
import kr.or.ddit.vo.calendaradapter.ScheduleWrapper;
import kr.or.ddit.vo.calendaradapter.VacationWrapper;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hr/vacation/")
public class VacationReqController {

	private final VacationService service;

	private final EmpLeaveService elservice;

	private final ScheduleService Sservice;


	@ModelAttribute("simpleCondition")
	public SimpleCondition simpleCondition() {
		return new SimpleCondition();
	}

	@RequestMapping("vacation.do")
	public String getPage() {
		return "hr/vacation/vacationMain";
	}

	@RequestMapping("vacreqList.do")
	public String vacreqList(
			@RequestParam(name="page", required=false, defaultValue="1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
			) {

		PaginationInfo<VacationReqVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);

		List<VacationReqVO> vacreqList = service.retrieveVacReqList(paging);
		paging.setDataList(vacreqList);

		model.addAttribute("paging", paging);
		model.addAttribute("vacreq", new VacationReqVO());

		return "hr/vacation/ajax/vacreqList";
	}

	@RequestMapping("vacreqView.do")
	public String vacreqView (
			@RequestParam(name="what", required=true) String vrId
			, Model model
			) {
		VacationReqVO vacreq = service.retrieveVacReq(vrId);
		vacreq.setVrId(vrId);

		LocalDate startDt = vacreq.getVrStartTs();
		LocalDate endDt = vacreq.getVrEndTs();
		long daysBetween = ChronoUnit.DAYS.between(startDt, endDt);

		model.addAttribute("daysBetween", daysBetween);
		model.addAttribute("vacreq", vacreq);

		return "hr/vacation/ajax/vacreqView";		
	}

	@RequestMapping("vacreqUpdate.do")
	public ResponseEntity<String> vacreqUpdate(
			Model model,
			@Validated(UpdateGroup.class)
			@ModelAttribute("vacreq") VacationReqVO vacreq
			, BindingResult errors
			) {

		LeaveEmpVO elVO = new LeaveEmpVO();

		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyVacReqStatus(vacreq);

			System.out.println(vacreq); 
			System.out.println("status2 : " + vacreq.getVrStatus());

			if ("APPR".equals(vacreq.getVrStatus())) {
				System.out.println("type : " + vacreq.getVrType());
				
				System.out.println("vrId : " + vacreq.getVrId());
				elVO.setElEmp(vacreq.getVrEmpNo());
				elVO.setVrId(vacreq.getVrId());
				
					if("SK".equals(vacreq.getVrType())) {
						elservice.modifyElSk(elVO);
						System.out.println(elVO);
					} 
					else if ("AL".equals(vacreq.getVrType())) {
						elservice.modifyElAl(elVO);
						System.out.println(elVO);
					} 
					else if ("PD".equals(vacreq.getVrType())) {
						elservice.modifyElPd(elVO);
						System.out.println(elVO);
					} 
					else if ("PL".equals(vacreq.getVrType())) {
						elservice.modifyElPl(elVO);
						System.out.println(elVO);
					} 
					else if ("FE".equals(vacreq.getVrType())) {
						elservice.modifyElFe(elVO);
						System.out.println(elVO);
					} 
					else if ("UP".equals(vacreq.getVrType())){
						elservice.modifyElUp(elVO);
						System.out.println(elVO);
					}
					
//					elservice.insertEl(elVO);
					
				} else {
//					elservice.modifyElSK(elVO);
				}
			if(ServiceResult.OK == result) {
				return ResponseEntity.ok("success");
			}else {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류, 잠시 뒤 다시 시도하세요.");
			}
		}else {
			return ResponseEntity.badRequest().body("입력값이 유효하지 않습니다.");
		}
	}

	@RequestMapping("vacreqHave.do")
	public String vacreqHave(
			@RequestParam(name="page", required=false, defaultValue="1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
			) {
		PaginationInfo<LeaveEmpVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<LeaveEmpVO> elList = elservice.retrieveElList(paging);
		paging.setDataList(elList);

		model.addAttribute("paging", paging);
		model.addAttribute("elList", elList);
//		model.addAttribute("vacreq", new VacationReqVO());

		return "hr/vacation/ajax/vacreqHaveList";

	}

	@RequestMapping(value = "vrCalendar.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<FullCalendarEvent<VacationReqVO>> vacList(Model model) {
		List<VacationReqVO> vacList = service.retrieveVrCalList();
		return vacList.stream().map(VacationWrapper::new).collect(Collectors.toList());
	}
}


