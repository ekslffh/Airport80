package kr.or.ddit.Infra.supplier.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.Infra.supplier.service.SupplierService;
import kr.or.ddit.Infra.vo.supplierVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;

@Controller
public class CCRetrieveController {

	@Inject
	private SupplierService service;
	
	
	@RequestMapping("/infra/ccList.do")
	public String constructionCompanyList(
		@RequestParam(name="page", required = false, defaultValue="1")long currentPage
		, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
		, Model model) {
		
		PaginationInfo<supplierVO> paging = new PaginationInfo<>(5,5); // 스크린사이즈 블록사이즈 지정 가능
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<supplierVO> ccList = service.retrieveCcList(paging);
		paging.setDataList(ccList);
		
		model.addAttribute("paging" , paging);
		model.addAttribute("ccList" , ccList);
		return "infra/construction/ccList";
	}
	@RequestMapping("/infra/ccView.do")
	public ModelAndView view (@RequestParam(name="what", required = true) String sprId) {
		supplierVO supplier = service.selectCCRetrieve(sprId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("supplier", supplier);                         
		mav.setViewName("infra/orderCompany/orderCompanyView");
		return mav;
	}
	
	
}
