package kr.or.ddit.operate.custNoticeBrd.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operate.custNoticeBrd.service.CustNoticeBrdService;
import kr.or.ddit.operate.vo.CustNoticeBrdVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;

@Controller

public class CnbSelectController {
	
	@Inject
	private  CustNoticeBrdService service;
	
	@GetMapping("/operate/custNoticeBrd/cnbList.do")
	public String cnbList(
			@RequestParam(name="page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
			){
		
		PaginationInfo<CustNoticeBrdVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<CustNoticeBrdVO> cnbList = service.retrieveCnbList(paging);
		paging.setDataList(cnbList);
		
		model.addAttribute("paging", paging);
		
		return "operate/custNoticeBrd/cnbList";
	}
		
	
	@GetMapping("/operate/custNoticeBrd/cnbView.do")
	public String cnbView(
			@RequestParam("what") int cnbNo
			, Model model
		){
		service.increaseViews(cnbNo);
		CustNoticeBrdVO cnb = service.retrieveCnb(cnbNo);
		model.addAttribute("cnb", cnb);
		
		return "operate/custNoticeBrd/cnbView";
		
	}
	
	
	
	
	
	// 비로그인
	
	@GetMapping("/open/operate/cnbList.do")
	public String ocnbList(
			@RequestParam(name="page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
			){
		
		PaginationInfo<CustNoticeBrdVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<CustNoticeBrdVO> cnbList = service.retrieveCnbList(paging);
		paging.setDataList(cnbList);
		
		model.addAttribute("paging", paging);
		
		return "open/operate/cnbList";
	}
		
	
	@GetMapping("/open/operate/cnbView.do")
	public String ocnbView(
			@RequestParam("what") int cnbNo
			, Model model
		){
		service.increaseViews(cnbNo);
		CustNoticeBrdVO cnb = service.retrieveCnb(cnbNo);
		model.addAttribute("cnb", cnb);
		
		return "open/operate/cnbView";
		
	}
	
	
	

}
