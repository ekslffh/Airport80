package kr.or.ddit.operate.lostItem.controller;

import java.util.List;

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

import kr.or.ddit.operate.enumpkg.ServiceResult;
import kr.or.ddit.operate.lostItem.dao.CommonDAO;
import kr.or.ddit.operate.lostItem.dao.ZoneDAO;
import kr.or.ddit.operate.lostItem.service.LostItemService;
import kr.or.ddit.operate.vo.LostItemVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/lostItem")
public class LostItemInsertController {
	 
	@Inject
	private LostItemService service;
	
	@Inject
	private CommonDAO commonDAO;
	
	@Inject
	private ZoneDAO zoneDAO;

	@ModelAttribute("commonList")
	public List<CommonCodeVO> commonList(){
		return commonDAO.selectCommonList();
	}
		
	@ModelAttribute("statusList")
	public List<CommonCodeVO> statusList(){
		return commonDAO.selectStatusList();
	}
	
	@ModelAttribute("zoneList")
	public List<ZoneVO> zoneList(){
		return zoneDAO.selectZoneList();
	}
		

	
	@ModelAttribute("lostItem")
	public LostItemVO lostItem() {
		return new LostItemVO();
	}
	
	
@GetMapping("/ajaj/lostItemInsert.do")
public String lostForm(Model model) {
	model.addAttribute("lostItem", new LostItemVO());
	return "operate/lostItem/ajaj/lostItemForm";
}
	

@PostMapping("/ajaj/lostItemInsert.do")
public String insertLostItem(
		  @ModelAttribute("lostItem") @Validated(InsertGroup.class) LostItemVO lostItem
		, Errors errors
		, RedirectAttributes redirectAttributes){
	
	String viewName = null;
	
	if(!errors.hasErrors()) {
		ServiceResult result = service.createLi(lostItem);
		
		if (ServiceResult.OK == result) {
			viewName = "redirect:/lostItem/lostItemList.do";
//			viewName = "/operate/lostItem/lostItemList";
		}else {
			viewName = "operate/lostItem/ajaj/LostItemForm";
		}
	}else {
		viewName = "operate/lostItem/ajaj/lostItemForm";
	}
	
	return viewName;
	
}
} 