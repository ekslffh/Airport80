package kr.or.ddit.operate.lostItem.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operate.enumpkg.ServiceResult;
import kr.or.ddit.operate.lostItem.service.LostItemService;
import kr.or.ddit.operate.vo.LostItemVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;

@Controller
public class LostItemSelectController {
	
	@Inject
	private LostItemService service;
	
	@ModelAttribute("lostItem")
	public LostItemVO lostItem() {
		return new LostItemVO();
	}
	
	@ModelAttribute("lostItem")
	public LostItemVO createLostItemModel() {
		return new LostItemVO();
	}
	
	
	
	@RequestMapping("/lostItem/lostItemList.do")
	public String LostItemList(@RequestParam(name="page", required = false, defaultValue="1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model) {
		
		PaginationInfo<LostItemVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<LostItemVO> lostItemList = service.retrieveLiList(paging);
		paging.setDataList(lostItemList);
		
		model.addAttribute("lostItemList", lostItemList);
		model.addAttribute("paging", paging);
		
		return "operate/lostItem/lostItemList";
	}
	
	
	@RequestMapping("/lostItem/lostItemView.do")
	public String LostItemView(@RequestParam(name = "what", required = true) String liId, Model model) {
		LostItemVO lostItem = service.retrieveLi(liId);
		model.addAttribute("lostItem", lostItem);
		return "operate/lostItem/lostItemView";
	}
	
	

	@RequestMapping("/lostItem/liStatusUpdate.do")
	public String listuUpdate(
			Model model, @ModelAttribute("lostItem") LostItemVO lostItem
			, BindingResult errors
			) {
		String logicalViewName = null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyLiStatus(lostItem);
			if(ServiceResult.OK == result) {
				logicalViewName = "redirect:/lostItem/lostItemList.do";
			}else {
				logicalViewName = "operate/lostItem/lostItemList";
			}
		}else {
			logicalViewName = "operate/lostItem/lostItemList";
		}
		return logicalViewName;
	}
	
	
	
	
	
	// 비로그인
	@RequestMapping("/open/operate/lostItemList.do")
	public String oLiList(@RequestParam(name="page", required = false, defaultValue="1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model) {
		
		PaginationInfo<LostItemVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<LostItemVO> lostItemList = service.retrieveLiList(paging);
		paging.setDataList(lostItemList);
		
		model.addAttribute("lostItemList", lostItemList);
		model.addAttribute("paging", paging);
		
		return "open/operate/lostItemList";
	}

	@RequestMapping("/open/operate/lostItemView.do")
	public String oLiView(@RequestParam(name = "what", required = true) String liId, Model model) {
		LostItemVO lostItem = service.retrieveLi(liId);
		model.addAttribute("lostItem", lostItem);
		return "open/operate/lostItemView";
	}
	
	
	
	
	
	
	
}
 