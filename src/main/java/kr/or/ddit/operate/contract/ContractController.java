package kr.or.ddit.operate.contract;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operate.contract.service.ContractService;
import kr.or.ddit.operate.vo.contractVO;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/contract")
public class ContractController {
	private final ContractService contractService;
	
	@GetMapping("/list.do")
	public String getList(
		@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
		, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
		, Model model
	) {
		List<contractVO> conList = contractService.retrieveList();
		return "operate/contract/conList";
	}
	
}
