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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.operate.busLog.service.BusLogService;
import kr.or.ddit.operate.vo.busLogVO;
import kr.or.ddit.validate.UpdateGroup;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/operate/busLog")
public class BlogUpdateController {
	
	@Inject
	private BusLogService service;
	
	@ModelAttribute("blog")
	public busLogVO blog() {
		return new busLogVO();
	}
	
	@GetMapping("/blogUpdate.do")
	public String updateEdit(
			Model model, @RequestParam(name = "what", required = true) String blogId
			) {
		busLogVO blog = service.retrieveBlog(blogId);
		model.addAttribute("blog", blog);
		
		return "operate/busLog/blogEdit";
	}

	@PostMapping("/blogUpdate.do")
	public String updateBlog(
			@ModelAttribute("blog") @Validated(UpdateGroup.class) busLogVO blog
			, Errors errors, RedirectAttributes redirectAttributes
			) {
		
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = service.modifyBlog(blog);
			if(success) {
				viewName = "redirect:/operate/busLog/blogView.do?what=" + blog.getBlogId();
			}else {
				viewName = "operate/busLog/blogForm";
			}
		}else {
			viewName = "operate/busLog/blogEdit";
		}
		return viewName;
	}
	
}
