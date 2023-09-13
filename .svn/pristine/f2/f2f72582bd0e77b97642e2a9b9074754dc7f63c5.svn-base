package kr.or.ddit.hr.empBrd.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.hr.empBrd.service.EmpbrdService;
import kr.or.ddit.hr.vo.EmpbrdVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class EmpbrdDeleteController {

	private final EmpbrdService service;
	
	@PostMapping("/hr/empbrd/empbrdDelete.do")
	public String empbrdDelete(EmpbrdVO empbrd, RedirectAttributes redirectAttributes) {
		boolean success = service.removeEmpbrd(empbrd);
		String viewName = null;
		
		if(success) {
			
			String message = "게시물이 삭제되었습니다.";
			String encodedMessage = null;
			
			try {
				encodedMessage = URLEncoder.encode(message, "UTF-8");
			} catch (UnsupportedEncodingException e) {
//				e.printStackTrace();
			}
			
			viewName = "redirect:/hr/empbrd/empbrdList.do?message=" + encodedMessage;;
		} else {
			redirectAttributes.addFlashAttribute("message", "게시글 삭제 실패, 비밀번호 확인");
			viewName = "redirect:/hr/empbrd/empbrdView.do?what="+empbrd.getEbNo();
		}
		
		return viewName;
	}
}
