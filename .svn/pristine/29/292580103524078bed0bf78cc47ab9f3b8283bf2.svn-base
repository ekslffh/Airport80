package kr.or.ddit.common.schedule.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.schedule.service.ScheduleService;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.common.vo.ScheduleVO;
import kr.or.ddit.vo.calendaradapter.FullCalendarEvent;
import kr.or.ddit.vo.calendaradapter.ScheduleWrapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ScheduleController_FC {

	private final ScheduleService service;
	
	@RequestMapping("/common/calender/scheduleList.do")
	public String list() {
		return "common/calendar/scheduleCalendar";
	}

	@RequestMapping(value = "/common/calender/scheduleListDS.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<FullCalendarEvent<ScheduleVO>> listDS(Authentication authentication, Model model) {
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		String scheTarget = empVO.getEmpDeptNo();
		List<ScheduleVO> scheduleList = service.retrieveScheduleList(scheTarget);
		return scheduleList.stream().map(ScheduleWrapper::new).collect(Collectors.toList());
	}

	@PostMapping("/common/calendar/saveEvent.do")
	@ResponseBody
	public  FullCalendarEvent<ScheduleVO> saveEvent(
			@RequestParam("scheId") String scheId,
            @RequestParam("startDate") String startDt,
            @RequestParam("endDate") String endDt,
            @RequestParam("eventName") String eventName,
            @RequestParam("eventLocation") String eventLocation,
            @RequestParam(value = "scheTarget", required = false) String scheTarget
			, Authentication authentication
			, Model model
			, ScheduleVO scheVO
			) {
		
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		
		scheVO.setScheWriter(empVO.getEmpNo());
		if (scheTarget.equals("dep")) {
			scheVO.setScheTarget(empVO.getEmpDeptNo());
		} else {
			scheVO.setScheTarget("0000");
		}
		
		// 여기서 이벤트 이름과 장소를 이용하여 데이터를 DB에 저장
			scheVO.setScheStartDt(LocalDate.parse(startDt, DateTimeFormatter.ISO_DATE));
			scheVO.setScheEndDt(LocalDate.parse(endDt, DateTimeFormatter.ISO_DATE));
			scheVO.setScheTitle(eventName);
			scheVO.setScheLoc(eventLocation);
			
		// scheId의 값이 없으면 등록
			if (StringUtils.isBlank(scheId)) {
		        service.createSchedule(scheVO);
		    } else {
		        scheVO.setScheId(scheId);
		        service.modifySchedule(scheVO);
		    };
		    
		    if (!StringUtils.isBlank(scheId)) {
		        ScheduleVO updatedSchedule = service.retrieveSchedule(scheId);
		        FullCalendarEvent<ScheduleVO> updatedEvent = new ScheduleWrapper(updatedSchedule);
		        return updatedEvent;
		    }
		
		return null;
	}
	
	@PostMapping("/common/calendar/deleteEvent.do")
	@ResponseBody
	public int deleteEvent(@RequestParam("scheId") String scheId) {

		if (StringUtils.isBlank(scheId)) {
			return 3;
		} else {
			return service.removeSchedule(scheId);
		}
	}

}
