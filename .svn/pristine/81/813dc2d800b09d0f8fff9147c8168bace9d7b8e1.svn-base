package kr.or.ddit.Infra.stock.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.Infra.stock.service.StockService;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;

@Controller
public class StockRetrieveController {

	@Inject
	private StockService service;
	
	@RequestMapping("infra/stockList.do")
	public String listHandler(
			@RequestParam(name="page", required = false, defaultValue="1")long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model) {
		
		PaginationInfo<stockVO> paging = new PaginationInfo<>(10,5); // 스크린사이즈 블록사이즈 지정 가능
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<stockVO> stockList = service.retrieveStockList(paging);
		paging.setDataList(stockList);
		
		for (stockVO stock : stockList) {
			if (stock.getStQuantity() <= 5) {
				stock.setStStatus("발주필요");
			}
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("stockList", stockList);
		
		return "infra/stock/stockList";
	}
}
