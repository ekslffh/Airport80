package kr.or.ddit.Infra.repairLog.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.Infra.repairLog.service.repLogService;
import kr.or.ddit.Infra.vo.repairLogVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import kr.or.ddit.vo.cacaomapadapter.CacaoMapAreaEvent;
import kr.or.ddit.vo.cacaomapadapter.ZoneWSDNWrapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class RepLogRetrieveController {

	private final repLogService service;

	@ModelAttribute("repLog")
	public repairLogVO repLog() {
		return new repairLogVO();
	}

	@GetMapping("/infra/repLogList.do")
	public String RepLogList(@RequestParam(name = "mode", required = false) String mode,
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
			@RequestParam(name = "tabs", required = false, defaultValue = "0") int tab,
			@RequestParam(name = "deptSelect", required = false) String rrStts,
			@ModelAttribute("simpleCondition") SimpleCondition simpleCondition, Model model) {

		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-01");
		repairLogVO work = service.countRepLog(date.format(today));
		SimpleDateFormat month = new SimpleDateFormat("yyyy-MM");
		String thismonth = month.format(today);

		PaginationInfo<repairLogVO> paging = new PaginationInfo<>(10, 5); // 스크린사이즈 블록사이즈 지정 가능
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);

		List<repairLogVO> repLog;
		List<repairLogVO> nnLog;
		List<repairLogVO> wtLog;
		String logicalView = "";

		repLog = service.retrieveRepLogList(paging);
		nnLog = service.monthNnRepLogList(paging);
		wtLog = service.monthWtRepLogList(paging);
		paging.setDataList(repLog);
		logicalView = "infra/repLog/repLogList";

		String tabs[] = new String[6];

		if (tab == 0) {
			tabs[0] = "active";
			tabs[3] = "show active";
		} else if (tab == 1) {
			tabs[1] = "active";
			tabs[4] = "show active";
		} else if (tab == 2) {
			tabs[2] = "active";
			tabs[5] = "show active";
		}

		model.addAttribute("tabs", tabs);
		model.addAttribute("thisMonth", thismonth);
		model.addAttribute("repLog", repLog);
		model.addAttribute("nnLog", nnLog);
		model.addAttribute("wtLog", wtLog);
		model.addAttribute("work", work);
		model.addAttribute("paging", paging);

		return logicalView;
	}

	@GetMapping("/infra/repLogView")
	public String maintenanceReqView(@RequestParam(name = "what", required = true) String rlNo, Model model) {
		repairLogVO rep = service.retrieveRepLog(rlNo);
		model.addAttribute("rep", rep);

		return "infra/repLog/repLogView";
	}

	@GetMapping("/infra/replog/replogUpdate.do")
	@ResponseBody
	public int updateRepairLog(@RequestParam(name = "what") String rlNo,
			@RequestParam(name = "status") String status) {
		
		System.out.println(rlNo + " " + status);
		// 요청을 처리하는 로직을 작성
		repairLogVO repVO = new repairLogVO();
		repVO.setRlNo(rlNo);
		if ("NN".equals(status)) {
		    // 'NN' 상태에 대한 처리
			repVO.setRlIr("NN");
			repVO.setRlIs("WT");
		} else if ("CAN".equals(status)) {
		    // 'CAN' 상태에 대한 처리
			repVO.setRlIr("CAN");
			repVO.setRlIs("CAN");
		} else if ("SS".equals(status)) {
		    // 'SS' 상태에 대한 처리
			repVO.setRlIr("SS");
			repVO.setRlIs("COMP");
		} else {
			return 0;
		}

		try {
			// rlNo와 status를 사용하여 업데이트 로직 수행
			int su = service.updateRepairLogStatus(repVO);
			
			return su;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@RequestMapping(value = "/infra/replog/replogCharts.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<repairLogVO> repCharts(
			@RequestParam("rlFc") String rlFc
			) {
		List<repairLogVO> repCharts = service.getRepCharts(rlFc);
		
		return repCharts;
	}
	
}
