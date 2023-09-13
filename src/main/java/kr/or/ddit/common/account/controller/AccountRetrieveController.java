package kr.or.ddit.common.account.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.account.service.AccountService;
import kr.or.ddit.common.vo.AccountVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
@RequestMapping("/common/acc/")
public class AccountRetrieveController {

	private final AccountService service;
	
	@RequestMapping("accountList.do")
	public void AccountList(
		@RequestParam(name="page", required = false, defaultValue = "1") long currentPage
		, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
		, Model model
	) {
		PaginationInfo<AccountVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<AccountVO> accountList = service.retrieveAccountList(paging);
		paging.setDataList(accountList);
		
		model.addAttribute("paging", paging);
	}
	
	
	@RequestMapping("accountView.do")
	public void accountView (
		@RequestParam("what") int accId
		, Model model
	) {
		AccountVO account = service.retrieveAccount(accId);
		model.addAttribute("account", account);
	}
}
