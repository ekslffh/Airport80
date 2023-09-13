package kr.or.ddit.operate.busRoute.controller;

import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.inject.Inject;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.operate.busRoute.service.BusRouteService;
import kr.or.ddit.operate.vo.CustNoticeBrdVO;
import kr.or.ddit.operate.vo.busRouteVO;

@Controller
public class BusRouteSelectController {
	
	@Inject
	private BusRouteService service;
	
	@RequestMapping("/operate/busRoute/brList.do")
	public String busRouteList(Model model) {
		List<busRouteVO> busRouteList = service.retrieveBrList();
		model.addAttribute("busRouteList",busRouteList);
		return "operate/busRoute/brList";
	}
	
	@GetMapping("/operate/busRoute/brView.do")
	public String brView(
			@RequestParam("what") String brId
			, Model model
		){
		
		busRouteVO br = service.retrieveBr(brId);
		model.addAttribute("br", br);
		
		return "operate/busRoute/brView";
	
}
	
	
	
	// 비로그인
	@RequestMapping("/open/operate/brList.do")
	public String obusRouteList(Model model) {
		List<busRouteVO> busRouteList = service.retrieveBrList();
		model.addAttribute("busRouteList",busRouteList);
		return "open/operate/brList";
	}
	
	@GetMapping("/brView.do")
	public String obrView(
			@RequestParam("what") String brId
			, Model model
		){
		
		busRouteVO br = service.retrieveBr(brId);
		model.addAttribute("br", br);
		
		return "operate/busRoute/brView";
	
}
}