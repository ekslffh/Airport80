package kr.or.ddit.common.account.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.account.dao.AccountDAO;
import kr.or.ddit.common.account.service.AccountService;
import kr.or.ddit.common.vo.AccountVO;
import kr.or.ddit.validate.UpdateGroup;


@Controller
@RequestMapping("/common/acc/accUpdate.do")
public class AccountUpdateController {
	
	@Inject
	private AccountService service;
	
	@Inject
	private AccountDAO accountDAO;
	
	public String updateForm(
		Model model
		, @RequestParam("what") int accId
	) {
		AccountVO account = service.retrieveAccount(accId);
		model.addAttribute("account", account);
		
		return "common/acc/accountEdit";
	}
	
	@PostMapping
	public String updateAccount (
		Model model
		, @Validated(UpdateGroup.class) @ModelAttribute("account") AccountVO account
		, BindingResult errors
	) {
		String viewName = null;
		
		if (!errors.hasErrors()) {
			boolean success = service.modifyAccount(account);
			if (success) {
				viewName = "redirect:/common/acc/accountView.do?what=" + account.getAccId();
			} else {
				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요.");
				viewName = "common/acc/accountForm";
			}
		} else {
			viewName = "common/acc/accountForm";
		}
		
		return viewName;
	}
}
