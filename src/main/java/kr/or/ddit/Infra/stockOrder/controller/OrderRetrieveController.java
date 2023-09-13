package kr.or.ddit.Infra.stockOrder.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.Infra.stockOrder.service.StockOrderService;
import kr.or.ddit.Infra.vo.stockOrderDetailVO;
import kr.or.ddit.Infra.vo.stockOrderVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;

@Controller
public class OrderRetrieveController {

	@Inject
	private StockOrderService service;
	
	@RequestMapping("infra/stockOrderList.do")
	public String listHandler(
			@RequestParam(name="page", required = false, defaultValue="1")long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model ) {
		
		PaginationInfo<stockOrderVO> paging = new PaginationInfo<>(5,5); // 스크린사이즈 블록사이즈 지정 가능
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
	
		List<stockOrderVO> soList = service.retreieveStockOrderList(paging);
		paging.setDataList(soList);
		
		model.addAttribute("paging", paging);
		model.addAttribute("soList", soList);
		
		return "infra/stockOrder/stockOrderList";
	}

//	@RequestMapping("infra/stockOrderDetail.do")
//	public String getHandler(@RequestParam String what, Model model) {
//		stockOrderDetailVO onestock = service.selectStock(soId);
//		model.addAttribute(onestock);
//	}
}