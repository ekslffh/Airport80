package kr.or.ddit.safety.securityLog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.safety.confiscation.dao.OtherDAO;
import kr.or.ddit.safety.securityLog.service.SecurityLogService;
import kr.or.ddit.safety.vo.SecurityLogVO;
import kr.or.ddit.safety.vo.SecurityReqVO;
import kr.or.ddit.safety.vo.ZoneVO;

@Controller
@RequestMapping("/safety/securityLog.do")
public class SecurityLogController {

	@Inject
	private OtherDAO otherDAO;

	@Inject
	private SecurityLogService service;

	@ModelAttribute("secReqList")
	public List<SecurityReqVO> secRepList() {
		return otherDAO.selectSecReqList();
	}

	@ModelAttribute("zoneList")
	public List<ZoneVO> zoneList() {
		return otherDAO.selectAllZoneList();
	}

	@ModelAttribute("secLog")
	public SecurityLogVO secLog() {
		return new SecurityLogVO();
	}

	// 보안일지 처음화면
	@GetMapping
	public String securityLog() {
		return "safety/securityLog/securityLog";
	}

	// 보안접수내역 리스트출력, 필터링조회
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> jsonList(@RequestParam(required = false) String deptSelect) {
		List<SecurityLogVO> secLogList = service.retrieveSeqLogList(deptSelect);
		
		long totalCount = service.CountTotal();
		long reqCount = service.CountReq();
		long nonReqCount = service.CountNonReq();
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("totalCount", totalCount);
		result.put("reqCount", reqCount);
		result.put("nonReqCount", nonReqCount);
		result.put("secLogList",secLogList);
		
		return result;
	}

	// 보안일지 등록
	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public String doPost(@Valid @RequestBody SecurityLogVO secLogVO, Errors errors, Model model) {
		Map<String, Object> resultMap = new HashMap<>();
		model.addAttribute("result", resultMap);
		String viewName = null;
		if (errors.hasErrors()) {
			resultMap.put("success", false);
			resultMap.put("status", 400);
			viewName = "jsonView";
		} else {
			// call by reference
			boolean success = service.createSecLog(secLogVO);

			resultMap.put("secLogVO", secLogVO);
			resultMap.put("success", success);

			if (success) {
				viewName = "redirect:/safety/securityLog.do";
			} else {
				viewName = "jsonView";
			}
		}
		return viewName;
	}

}
