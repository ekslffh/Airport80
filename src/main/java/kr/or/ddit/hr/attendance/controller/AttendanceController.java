package kr.or.ddit.hr.attendance.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.employee.service.EmpService;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.hr.attendance.service.AttendanceService;
import kr.or.ddit.hr.vo.AttendanceVO;	

@Controller
@RequestMapping("/hr/attendance")
public class AttendanceController {
	
	@Inject
	private AttendanceService service;
	
	@Autowired
    private EmpService empService;
	
    @GetMapping(value="checkIn", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, String> checkIn(
    	@RequestParam("time") String time
    	, @RequestParam("inout") String inout
    	, Authentication authentication
		, Model model
		, AttendanceVO attVO
    ) {
		
    	// 출퇴근 기록할 로그인 사용자
    	AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		String empNo = empVO.getEmpNo();
		
		String attCd = "AC02";
		if (inout.equals("in")) {
			attCd = "AC01";
		}
		
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("disp", "NO");
		// 오늘, 사용자 출근 기록 확인
		// 오늘 해당 사용자의 근태 기록이 아직 없을 때는 입력
		if (service.getEmpAtteToday(empNo) == null) {
			if (inout.equals("out")) {
				resultMap.put("result", "출근 상태에서만 퇴근 처리가 가능합니다.");
			} else {
				attVO.setAttEmpNo(empNo);
				attVO.setAttInTime(time);
				attVO.setAttCd(attCd);
				service.createAtte(attVO);
				empVO.setEmpStatus("1");
				empService.modifyEmpStatus(empVO);
				resultMap.put("disp", "OK");
				resultMap.put("result", "출근 처리 되었습니다.");
			}
		} else { // 이미 기록이 있다면 수정
			AttendanceVO beAtte = service.getEmpAtteToday(empNo);
			String attId = beAtte.getAttId();
			String attInTime = beAtte.getAttInTime();
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			int wh = 0;
			try {
				Date date1 = sdf.parse(attInTime);
				Date date2 = sdf.parse(time);
				
				long timeMil1 = date1.getTime();
	    		long timeMil2 = date2.getTime();
	    		
	    		long diff = timeMil2 - timeMil1;
	    		
	    		long diffHh = diff / (1000 * 60 * 60);
	    		wh = Long.valueOf(diffHh).intValue();
	    		
			} catch (ParseException e) {
				e.printStackTrace();
			}
    		
			if (inout.equals("out")) {
				attVO.setAttId(attId);
				attVO.setAttOutTime(time);
				attVO.setAttCd(attCd);
				attVO.setAttWorkHours(wh);
				service.modifyAtte(attVO);
				empVO.setEmpStatus("2");
				empService.modifyEmpStatus(empVO);
				resultMap.put("disp", "OK");
				resultMap.put("result", "퇴근 처리 되었습니다.");
			} else {
				resultMap.put("result", "이미 출근 처리 되었습니다.");
			}
		}
		
		return resultMap;
		
       }
}
