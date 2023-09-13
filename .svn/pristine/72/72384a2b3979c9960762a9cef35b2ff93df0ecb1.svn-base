package kr.or.ddit.common.account.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.account.service.AccountService;
import kr.or.ddit.common.vo.AccountVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class AccountDeleteController {

	private final AccountService service;
	
	@PostMapping("/common/acc/accountDelete.do")
	public String accountDelete(AccountVO account, RedirectAttributes redirectAttributes) {
		boolean success = service.removeAccount(account);
		String viewName = null;
		
		if(success) {
			viewName = "redirect:/common/acc/accountList.do";
		} else {
			redirectAttributes.addFlashAttribute("message", "게시글 삭제 실패, 비밀번호 확인");
			viewName = "redirect:/common/acc/accountView.do?what="+account.getAccId();
		}
		
		return viewName;
	}
	
	
	
}
