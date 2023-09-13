package kr.or.ddit.operate.contractHistory.controller;

import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.operate.contract.service.ContractHistoryService;
import kr.or.ddit.operate.vo.contractHistoryVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;

@Controller
@RequestMapping("/contractHistory")
public class ContractHistoryController {
	
	@Inject
	private ContractHistoryService chService;
	
	@PostMapping("/insert.do")
	public String insert(
		@Validated(InsertGroup.class) contractHistoryVO ch
		, Errors errors
		, String vendId
		, RedirectAttributes redirectAttributes
	) {
		String viewName = "redirect:/hr/vendor/vendorView.do?what=" + vendId;
		if (!errors.hasErrors()) {        
			ch.setChId(UUID.randomUUID().toString().substring(0, 20));
			boolean success = chService.create(ch);
			if (success) {
				redirectAttributes.addFlashAttribute("message", "계약생성 성공");
			} else {
				redirectAttributes.addFlashAttribute("message", "계약생성 실패 : 생성중 오류발생");
			}
		} else {
			redirectAttributes.addFlashAttribute("message", "계약생성 실패 : 잘못된 입력");
		}
		return viewName;
	}
	
	@PostMapping("/update.do")
	public String update(
			@Validated(UpdateGroup.class) contractHistoryVO ch
			, Errors errors
			, String vendId
			, RedirectAttributes redirectAttributes
			) {
		String viewName = "redirect:/hr/vendor/vendorView.do?what=" + vendId;
		if (!errors.hasErrors()) {        
			boolean success = chService.modify(ch);
			if (success) {
				redirectAttributes.addFlashAttribute("message", "계약수정 성공");
			} else {
				redirectAttributes.addFlashAttribute("message", "계약수정 실패 : 수정중 오류발생");
			}
		} else {
			redirectAttributes.addFlashAttribute("message", "계약수정 실패 : 잘못된 입력");
		}
		return viewName;
	}

	@PostMapping(value = "delete.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, String> delete(String chId) {
		boolean result =  chService.remove(chId);
		Map<String, String> map = new HashedMap();
		if (result) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
			map.put("message", "삭제실패하였습니다.");		
		}
		return map;
	}
	
}
