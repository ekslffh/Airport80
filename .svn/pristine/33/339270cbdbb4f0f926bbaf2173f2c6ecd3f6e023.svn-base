package kr.or.ddit.safety.ssupport.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.safety.ssupport.service.SecurityReqService;
import kr.or.ddit.safety.vo.SecurityReqVO;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class SSupportMainController {

	private final SecurityReqService service;

	@ModelAttribute("secReq")
	public SecurityReqVO secReq() {
		return new SecurityReqVO();
	}

	@RequestMapping("/safety/maincontroll.do")
	public String main() {
		return "safety/ssupport/ssupportView";
	}

	// 전체조회
	@GetMapping("/safety/seBoardList.do")
	public String securityBoard(Model model) {
		List<SecurityReqVO> secReq = service.retrieveSReqList();
		
		SecurityReqVO process = service.getAverageProcessingTime();
		
		//요청받은 갯수
		long countReq = service.CountReq();
		long countRec = service.CountRec();
		long countComp = service.CountComp();
		
		model.addAttribute("countReq", countReq);
		model.addAttribute("countRec", countRec);
		model.addAttribute("countComp", countComp);
		
		
		double doubleValue = Double.parseDouble(process.getProsTime());
		long roundedValue = Math.round(doubleValue); // 먼저 double 값을 반올림하여 long으로 변환합니다.

		Long min = roundedValue / 60;

		// 분을 시간, 분, 초로 변환
		long hours = min / 60;
		long remainderMinutes = min % 60;
		
		long seconds = roundedValue % 60;

		// 시간, 분, 초를 "00:00:00" 형식의 문자열로 변환
		String formattedTime = String.format("%02d:%02d:%02d", hours, remainderMinutes, seconds);
		
		// 정수 값을 String으로 변환하여 다시 VO에 저장합니다.
		process.setProsTime(String.valueOf(formattedTime));
		model.addAttribute("process", process);
		model.addAttribute("secReq", secReq);

		return "safety/ssupport/securityReq/securityReqList";
	}

	// 차트 정보 전달
	@RequestMapping(value = "/safety/chart/getChart.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public SecurityReqVO getChart(Model model) {
		SecurityReqVO chartInfo = service.getChartInfo();
		return chartInfo;
	}

	// 상세조회(모달)
	@GetMapping("/safety/securityView.do")
	public String securityView(@RequestParam(name = "who", required = true) String srId, Model model) {
		SecurityReqVO reqList = service.retrieveSecReq(srId);
		model.addAttribute("reqList", reqList);

		return "safety/ssupport/securityReq/securityView";
	}

	// 상태 업데이트
	@RequestMapping(value = "/safety/secStatus.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> secStatus(@RequestParam(name = "who", required = true) String srId) {
		Map<String, Object> map = new HashedMap();
		ServiceResult result = service.modifySqStatus(srId);
		String resp = null;
		;
		if (ServiceResult.OK == result) {
			map.put("resp", "OK");
			map.put("msg", "대기중으로 상태 변경 완료되었습니다.");
			List<SecurityReqVO> secReq = service.retrieveSReqList();
			map.put("data", secReq);
		} else {
			map.put("resp", "FAIL");
			map.put("msg", "대기중으로 상태 변경 실패하였습니다.");
		}
		return map;
	}

	// 헤더에서 사용하려고 만들었는데 안씀
	@RequestMapping(value = "/safety/reqList.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<SecurityReqVO> getSReqListFromJson() {
		List<SecurityReqVO> secReq = service.retrieveSReqList();
		return secReq;
	}

	// 처리완료후 일시, 내용 업데이트
	@PostMapping("/safety/secCompltUpdate.do")
	public ResponseEntity<String> SecCompltUpdate(Model model,
			@Validated(UpdateGroup.class) @ModelAttribute("reqList") SecurityReqVO reqList, BindingResult errors) {

		if (!errors.hasErrors()) {
			ServiceResult result = service.modifySecComplt(reqList);
			if (ServiceResult.OK == result) {
				return ResponseEntity.ok("success");
			} else {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류, 잠시 뒤 다시 시도하세요.");
			}
		} else {
			return ResponseEntity.badRequest().body("입력값이 유효하지 않습니다.");
		}
	}

}
