package kr.or.ddit.operate.busLog.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.operate.busLog.service.BusLogService;
import kr.or.ddit.operate.vo.busLogVO;
import kr.or.ddit.validate.DeleteGroup;

@Controller
@RequestMapping("/operate/busLog")
public class BlogDeleteController {
	
	@Inject
	private BusLogService service;
	
	@GetMapping("/blogDelete.do")
	public String blogDelete(@Validated(DeleteGroup.class)busLogVO blog,
			Errors errors) {
		String viewName = null;
		
		if(!errors.hasErrors()) {
			boolean success = service.removeBlog(blog.getBlogId());
			if(success) {
				viewName = "redirect:/operate/busLog/blogList.do";
			}else {
				viewName = "redirect:/operate/busLog/blogView.do?what=" + blog.getBlogId();
			}
		}else {
			viewName = "redirect:/operate/busLog/blogView.do?what=" + blog.getBlogId();
		}
		return viewName;
	}

}
