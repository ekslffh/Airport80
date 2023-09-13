package kr.or.ddit.safety.ssupport.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.safety.confiscation.dao.OtherDAO;
import kr.or.ddit.safety.ssupport.service.SecurityReqService;
import kr.or.ddit.safety.vo.SecurityReqVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.CommonCodeVO;

@Controller
@RequestMapping("/safety/secReqInsert.do")
public class SecurityReqController {

	@Inject
	private OtherDAO otherDAO;

	@Inject
	private SecurityReqService service;

	@ModelAttribute("zoneList")
	public List<ZoneVO> zoneList() {
		return otherDAO.selectAllZoneList();
	}

	@ModelAttribute("commonList")
	public List<CommonCodeVO> commonList() {
		return otherDAO.selectSecaList();
	}

	@ModelAttribute("secReq")
	public SecurityReqVO secReq() {
		return new SecurityReqVO();
	}

	@GetMapping
	public String getInsertForm() {
		return "/safety/ssupport/securityReq/securityReqForm";
	}

	// 보안요청 등록
	@PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, String> postInsert(
			Model model, @Validated @RequestBody SecurityReqVO secReq
			, Errors errors) {

		Map<String, String> map = new HashedMap<String, String>();

		if (!errors.hasErrors()) {

			boolean success = service.createSReq(secReq);
			if (success) {
				map.put("result", "보안요청이 성공하였습니다.");
			} else {
				map.put("result", "보안지원 요청에 실패하였습니다.");
			}
		} else {
			map.put("result", "보안지원 요청에 실패하였습니다.");
		}
		return map;
	}

}
