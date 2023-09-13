package kr.or.ddit.safety.securityLog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.safety.confiscation.dao.OtherDAO;
import kr.or.ddit.safety.securityLog.service.SecurityLogService;
import kr.or.ddit.safety.ssupport.service.SecurityReqService;
import kr.or.ddit.safety.vo.SecurityLogVO;
import kr.or.ddit.safety.vo.SecurityReqVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.vo.SimpleCondition;

@Controller
@RequestMapping("/safety")
public class SecReqModalController {
	
	@Inject
	private OtherDAO otherDAO;
	
	@Inject
	private SecurityLogService service;
	
	@Inject
	private SecurityReqService reqService;
	
	@ModelAttribute("secReqList")
	public List<SecurityReqVO> secRepList() {
		return otherDAO.selectSecReqList();
	}
	
	@ModelAttribute("zoneList")
	public List<ZoneVO> zoneList(){
		return otherDAO.selectAllZoneList();
	}
	
	@ModelAttribute("secLog")
	public SecurityLogVO secLog() {
		return new SecurityLogVO();
	}
	
	// 보안접수내역 확인 모달
	@GetMapping("secReqList.do")
	public String secReqList(
			Model model
			) {
		List<SecurityReqVO> comSecReq = otherDAO.selectSecReqList();
		model.addAttribute("comSecReq", comSecReq);
		return "safety/securityLog/ajax/comSecReqList";
	}
	
	// 보안일지 검색
	@GetMapping(value = "secLogSerch.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<SecurityLogVO> secLogSearch(
			@RequestParam(name="searchWord", required = false) String search,
			@RequestParam(name="searchType", required = false) String select
			) {
		// SimpleCondition 객체 생성하고 데이터 설정
		SimpleCondition condition = new SimpleCondition();
		condition.setSearchWord(search);
		condition.setSearchType(select);
		
		//서비스 메서드에 SimpleCondition 객체 전달 
		List<SecurityLogVO> searchList = service.retrieveSearchSeqLog(condition);
		
		return searchList;
	}
	
	// 보안일지 상세 모달
	@GetMapping("secLogView.do")
	public String secLogView(
			@RequestParam(name = "what") String slogId,
			Model model
			) {
		SecurityLogVO secLogView = service.retrieveSecLog(slogId);
		model.addAttribute("secLogView", secLogView);
		
		return "safety/securityLog/ajax/secLogView";
	}
	
	// 모달창내부 보안지원접수 출력
	@GetMapping(value = "secReqView.do", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public SecurityReqVO secReqView(
			@RequestParam(name = "slogSrId") String slogId ,
			Model model
			) {
			Map<String, Object> resultMap = new HashMap<>();
			model.addAttribute("result", resultMap);
			SecurityReqVO secRecView = reqService.retrieveSecReq(slogId);
			
		
		return secRecView;
	}
	
	//보안일지 삭제
	@PostMapping(value = "secLogDelete.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> secLogDel(
			@RequestParam(name = "slogId") String slogId
			, Model model
			) {
			
			Map<String, Object> resultMap = new HashMap<>();
			model.addAttribute("result", resultMap);
			resultMap.put("slogId", slogId);
				
				ServiceResult result = service.removeSecLog(slogId);
				if(ServiceResult.OK == result) {
					resultMap.put("resp",  result.OK);
					return ResponseEntity.ok(resultMap);
				}else {
					resultMap.put("resp", result.FAIL);
					return ResponseEntity.ok(resultMap);
				}
			}
	

}
