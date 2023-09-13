package kr.or.ddit.operate.flightLog.controller;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.operate.flightLog.service.FlightLogService;
import kr.or.ddit.operate.vo.flightLogVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.PaginationInfo;

@Controller
@RequestMapping("/operate/flightlog")
public class FlightLogController {
	
	@Inject
	private FlightLogService fLogService;
	
	@ModelAttribute("fLog")
	public flightLogVO flightLog() {
		return new flightLogVO();
	}
	
	@GetMapping("/main.do")
	public String fLogMain() {
		return "operate/flightLog/flightLogMain";
	}
	
	@GetMapping("/list.do")
	public String fLogList(@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
			Model model) {
		PaginationInfo<flightLogVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);

		List<flightLogVO> fLogList = fLogService.retrieveList(paging);
		paging.setDataList(fLogList);

		model.addAttribute("paging", paging);

		return "operate/flightLog/flightLogList";
	}

	@GetMapping("/view.do")
	public String fLogView(@RequestParam(name = "what") String flId, Model model) {
		flightLogVO fLog = fLogService.retrieveOne(flId);
		model.addAttribute("fLog", fLog);
		return "operate/flightLog/flightLogView";
	}

	@GetMapping("/insert.do")
	public String getInsertPage(Model model) {
		return "operate/flightLog/flightLogForm";
	}

	@PostMapping("/insert.do")
	public String insertFLog(
		@ModelAttribute("fLog") @Validated(InsertGroup.class) flightLogVO fLog
		, Errors errors
		, RedirectAttributes redirectAttributes
	) {
		String viewName = null;

		if (!errors.hasErrors()) {
			fLog.setFlId(UUID.randomUUID().toString());
			boolean success = fLogService.createLog(fLog);
			if (success) {
				redirectAttributes.addFlashAttribute("message", "일지작성이 완료되었습니다.");
				viewName = "redirect:/operate/flightlog/view.do?what=" + fLog.getFlId();
			} else {
				redirectAttributes.addFlashAttribute("message", "일지작성에 실패하였습니다.");
				viewName = "operate/flightLog/flightLogForm";
			}
		} else {
			viewName = "operate/flightLog/flightLogForm";
		}
		return viewName;
	}

	@GetMapping("/update.do")
	public String getUpdatePage(@RequestParam(name = "what") String flId, Model model) {
		flightLogVO fLog = fLogService.retrieveOne(flId);
		model.addAttribute("fLog", fLog);
		return "operate/flightLog/flightLogForm";
	}

	@PostMapping("/update.do")
	public String updateFLog(@Validated(UpdateGroup.class) flightLogVO fLog, Errors errors) {
		String viewName = null;

		if (!errors.hasErrors()) {
			boolean success = fLogService.modifyLog(fLog);
			if (success) {
				viewName = "redirect:/operate/flightlog/view.do?what=" + fLog.getFlId();
			} else {
				viewName = "operate/flightLog/flightLogForm";
			}
		} else {
			viewName = "operate/flightlog/flightLogForm";
		}
		return viewName;
	}
	
	@GetMapping("/delete.do")
	public String deleteLog(
			@Validated(DeleteGroup.class) flightLogVO fLog,
			Errors errors
	) {
		String viewName = null;
		
		if (!errors.hasErrors()) {
			boolean success = fLogService.removeLog(fLog.getFlId());
			if (success) {
				// 삭제 성공시 전체 리스트 보여주기
				viewName = "redirect:/operate/flightlog/list.do";
			} else {
				// 삭제 실패시 운항일지 뷰로 다시 돌아가기
				viewName = "redirect:/operate/flightlog/view.do?what=" + fLog.getFlId();
			}
		} else {
			viewName = "redirect:/operate/flightlog/view.do?what=" + fLog.getFlId();
		}
		return viewName;
	}

}
