package kr.or.ddit.operate.busLog.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operate.busLog.service.BusLogService;
import kr.or.ddit.operate.vo.busLogVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;

@Controller
@RequestMapping("/operate/busLog")
public class BlogSelectController {
	
	@Inject
	private BusLogService service;
	
	@RequestMapping("/blogList.do")
	public String blogList
			(@RequestParam(name="page", required = false, defaultValue = "1")long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
			) {
		
		PaginationInfo<busLogVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<busLogVO> blogList = service.retrieveBlogList(paging);
		paging.setDataList(blogList);
		
//		model.addAttribute("blogList", blogList);
		model.addAttribute("paging", paging);
		
		return "operate/busLog/blogList";

		
	}
	
	@RequestMapping("/blogView.do")
	public String blogView
			(@RequestParam("what") String blogId, Model model) {
			busLogVO blog = service.retrieveBlog(blogId);
			model.addAttribute("blog", blog);
			return "operate/busLog/blogView";
	}
	

}
