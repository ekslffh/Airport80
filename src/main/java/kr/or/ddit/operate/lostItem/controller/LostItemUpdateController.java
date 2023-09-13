package kr.or.ddit.operate.lostItem.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operate.enumpkg.ServiceResult;
import kr.or.ddit.operate.lostItem.dao.CommonDAO;
import kr.or.ddit.operate.lostItem.dao.LostItemDAO;
import kr.or.ddit.operate.lostItem.dao.ZoneDAO;
import kr.or.ddit.operate.lostItem.service.LostItemService;
import kr.or.ddit.operate.vo.LostItemVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/lostItem")
public class LostItemUpdateController {
	
	@Inject
	private LostItemService service;
	
	@Inject
	private CommonDAO commonDAO;

	@Inject
	private LostItemDAO dao;
	
	@Inject
	private ZoneDAO ZoneDAO;
	
	
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
		return ZoneDAO.selectZoneList();
	}

	
	@ModelAttribute("lostItem")
	public LostItemVO lostItem() {
		return new LostItemVO();
	}
	
	@GetMapping("/lostItemUpdate.do")
	public String lostItemEdit(
			@RequestParam(name = "what", required = true )String liId
			,Model model) {
		
		LostItemVO lostItem = service.retrieveLi(liId);
		model.addAttribute("lostItem", lostItem);
		return "operate/lostItem/lostItemEdit";
	}
	
	@PostMapping("/lostItemUpdate.do")
	public String updateLostItem(
			@ModelAttribute("lostItem") LostItemVO lostItem
			, Errors errors
			, Model model) {
		
//		List<LostItemVO> lostItemList = dao.selectLiList(null);
//		
//		model.addAttribute("lostItemList", lostItemList);
		String logicalViewName = null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyLi(lostItem);
			if(ServiceResult.OK == result) {
				logicalViewName = "redirect:/lostItem/lostItemView.do?what=" + lostItem.getLiId();
			}else {
				model.addAttribute("message", "수정 중 문제 발생");
				logicalViewName = "operate/lostItem/ajaj/lostItemEdit";
			}
		}else {
			logicalViewName = "operate/lostItem/lostItemEdit";
		}
		return logicalViewName;
	}
	
	
	
//	@ModelAttribute("lostItem")
//	public LostItemVO createLostItemModel() {
//	    return new LostItemVO();
//	}
//
//	@RequestMapping("/liStatusUpdate.do")
//	public String listuUpdate(
//			Model model, @ModelAttribute("lostItem") LostItemVO lostItem
//			, BindingResult errors
//			) {
//		String logicalViewName = null;
//		if(!errors.hasErrors()) {
//			ServiceResult result = service.modifyLiStatus(lostItem);
//			if(ServiceResult.OK == result) {
//				logicalViewName = "redirect:/lostItem/lostItemList.do";
//			}else {
//				logicalViewName = "operate/lostItem/lostItemList";
//			}
//		}else {
//			logicalViewName = "operate/lostItem/lostItemList";
//		}
//		return logicalViewName;
//	}

		

}
