package kr.or.ddit.operate.busLog.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.operate.busLog.dao.BusLogDAO;
import kr.or.ddit.operate.busLog.service.BusLogService;
import kr.or.ddit.operate.vo.busLogVO;
import kr.or.ddit.validate.InsertGroup;

@Controller
@RequestMapping("/operate/busLog")
public class BlogInsertController {
	
	@Inject
	private BusLogService service;
	
	@ModelAttribute("blog")
	public busLogVO blog() {
		return new busLogVO();
	}
	
	@GetMapping("/blogInsert.do")
	public String blogForm(Model model) {
		model.addAttribute("blog", new busLogVO());
		return "operate/busLog/blogForm";
	}
	
	@PostMapping("/blogInsert.do")
	public String insertBlog(
			@ModelAttribute("blog") @Validated(InsertGroup.class) busLogVO blog
			, Errors errors, RedirectAttributes redirectAttributes) {
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = service.createBlog(blog);
			if(success) {
				viewName = "redirect:/operate/busLog/blogView.do?what=" + blog.getBlogId();
			}else {
				viewName = "operate/busLog/blogForm";
			}
		}else {
			viewName = "operate/busLog/blogForm";
		}
		return viewName;
	}

}
