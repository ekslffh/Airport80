package kr.or.ddit.Infra.rncReq.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.ibatis.annotations.Insert;
import org.springframework.http.MediaType;
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

import kr.or.ddit.Infra.rncReq.service.rncService;
import kr.or.ddit.Infra.stock.dao.OthersDAO;
import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.CommonCodeVO;

@Controller
@RequestMapping("/infra/rncInsert.do")
public class rncInsertController {

	@Inject
	private rncService service;

	@Inject
	private OthersDAO othersDAO;

	@ModelAttribute("zoneList")
	public List<ZoneVO> zoneList() {
		return othersDAO.selectAllZoneList();
	}

	@ModelAttribute("commonList")
	public List<CommonCodeVO> commonList() {
		return othersDAO.selectRncList();
	}

	@ModelAttribute("rnc")
	public rncReqVO rncReq() {
		return new rncReqVO();
	}

	@GetMapping
	public String getInsertForm() {
		return "/infra/rncReq/ntiles/rncReqForm";
	}

	// 수리요청 등록
	@PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, String> postInsert(
			Model model, @Validated(InsertGroup.class) rncReqVO rnc, Errors errors) {

		Map<String, String> map = new HashedMap<String, String>();

		if (!errors.hasErrors()) {

			boolean success = service.createRncReq(rnc);
			if (success) {
				map.put("result", "수리청소요청이 성공하였습니다.");
			} else {
				map.put("result", "수리청소 요청에 실패하였습니다.");
			}
		} else {
			map.put("result", "수리청소 요청에 실패하였습니다.");
		}
		return map;
	}
}
