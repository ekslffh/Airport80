package kr.or.ddit.Infra.rncReq.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.Infra.rncReq.service.rncService;
import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class rncReqRetrieveController {

	private final rncService service;

	@ModelAttribute("rncReq")
	public rncReqVO rncReq() {
		return new rncReqVO();
	}

	@GetMapping("/infra/rncReqList.do")
	public String rReqBoard(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
			@ModelAttribute("simpleCondition") SimpleCondition simpleCondition, 
			Model model
	) {
		
		PaginationInfo<rncReqVO> paging = new PaginationInfo<>(6, 5); // 스크린사이즈 블록사이즈 지정 가능
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		String logicalView = "";

		List<rncReqVO> reqList = service.retrieveRReqList(paging);
		paging.setDataList(reqList);
		
		logicalView = "infra/rncReq/maintenanceReqList";

		model.addAttribute("paging", paging);
		return logicalView;
	}

	@GetMapping("/infra/recReqList.do")
	public String cReqBoard(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
			@ModelAttribute("simpleCondition") SimpleCondition simpleCondition, Model model) {
		
		PaginationInfo<rncReqVO> paging = new PaginationInfo<>(6, 5); // 스크린사이즈 블록사이즈 지정 가능
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);

		String logicalView = "";

		List<rncReqVO> recList = service.retrieveCReqList(paging);
		paging.setDataList(recList);
		
		logicalView = "infra/rncReq/ntiles/cleaningReqList";

		model.addAttribute("paging", paging);
		return logicalView;

	}

	@GetMapping("/infra/rncReqView.do")
	public String maintenanceReqView(@RequestParam(name = "who", required = true) String rrId, Model model) {
		rncReqVO req = service.retrieveRncReq(rrId);

		model.addAttribute("req", req);
		return "infra/rncReq/ntiles/rncReqView";
	}

	@GetMapping("/infra/rncReqCompanion.do")
	public String rncReqCompanion(@RequestParam(name = "rrid", required = true) String rrId, Model model) {
		rncReqVO rncReq = service.retrieveRncReq(rrId);
		model.addAttribute("rncReq", rncReq);

		return "infra/rncReq/ntiles/rncReqCompanion";
	}

	/*
	 * 이름이 뭐얌 주석!
	 * 
	 * @PostMapping("/infra/rncReqUpdate.do")
	 * 
	 * @ResponseBody public String postHandler( rncReqVO rncReq
	 * // @Validated(Update.class) @ModelAttribute("rncReq") rncReqVO rncReq //
	 * , @RequestParam("rrId") String rrId // , @RequestParam("rrStts") String
	 * rrStts // , @RequestParam("rrContent") String rrContent // , BindingResult
	 * errors // , Model model ) { log.debug("체킁:"+rncReq);
	 * 
	 * 
	 * 
	 * String logicalViewName =null; Map<String, String> response = new HashMap<>();
	 * if (!errors.hasErrors()) { ServiceResult result =
	 * service.modifyRncReq(rncReq); if (ServiceResult.OK == result) {
	 * logicalViewName = "redirect:/infra/rncReqList.do"; } else {
	 * model.addAttribute("message", "서버오류, 잠시 뒤 다시 시도하세요."); logicalViewName =
	 * "infra/rncReq/maintenanceReqList"; } } else { logicalViewName =
	 * "infra/rncReq/maintenanceReqList"; } return logicalViewName;
	 * 
	 * return "success"; }
	 */

	@PostMapping("/infra/rncReqUpdate.do")
	@ResponseBody
	public String postHandler(rncReqVO rncReq) {
		log.debug("체킁:" + rncReq);

		ServiceResult result = service.modifyRncReq(rncReq);

		String rslt = "success";
		if (ServiceResult.OK != result) {
			rslt = "fail";
		}
		return rslt;
	}

//	@ResponseBody
//	@PostMapping(path = "/infra/rncReqUpdate.do", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
//	public Map<String, String> rReqUpdate(
//			@RequestBody @Validated(UpdateGroup.class) rncReqVO rncR,
//	        BindingResult errors,
//	        Model model) {
//		System.out.println(rncR);
//		Map<String, String> response = new HashMap<>();
//	    if (!errors.hasErrors()) {
//	        ServiceResult result = service.modifyRncReq(rncR);
//	        if (ServiceResult.OK == result) {
//	        	 response.put("status", "success");
//	             response.put("message", "요청이 성공적으로 처리되었습니다.");
//	        } else {
//	        	 response.put("status", "error");
//	             response.put("message", "서버 오류로 인해 처리하지 못했습니다.");
//	        }
//	    } else {
//	    	response.put("status", "validation_error");
//	        response.put("message", "요청 데이터가 유효하지 않습니다.");
//	    }
//	    return response;
//	}
}
