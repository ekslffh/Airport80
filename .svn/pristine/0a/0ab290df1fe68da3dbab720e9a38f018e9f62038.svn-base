package kr.or.ddit.common.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.hr.attendance.service.AttendanceService;

import kr.or.ddit.safety.confiscation.service.ConfiscationService;
import kr.or.ddit.safety.ssupport.controller.SecurityReqController;
import kr.or.ddit.safety.ssupport.service.SecurityReqService;

@Controller
public class IndexStateController {


	@Inject
	private AttendanceService attendService;
	
	@Inject
	SecurityReqService secReqService;
	
	@Inject
	ConfiscationService confService;
	
	@RequestMapping("in/workhour.do")
	@ResponseBody
	public long getWorkHours(
			@RequestParam(name = "empNo") String empNo
			) {
		
		long workHour = attendService.countWorkHours(empNo);
		
		return workHour;
	}

	

	
}
