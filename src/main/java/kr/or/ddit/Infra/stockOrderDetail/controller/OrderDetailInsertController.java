package kr.or.ddit.Infra.stockOrderDetail.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.Infra.stock.dao.OthersDAO;
import kr.or.ddit.Infra.stock.dao.StockDAO;
import kr.or.ddit.Infra.stock.service.StockService;
import kr.or.ddit.Infra.stockOrderDetail.service.OrderDetailService;
import kr.or.ddit.Infra.supplier.dao.SupplierDAO;
import kr.or.ddit.Infra.vo.stockOrderDetailVO;
import kr.or.ddit.Infra.vo.stockOrderVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.validate.InsertGroup;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("infra/OrderDetailInsert.do")
@Controller
public class OrderDetailInsertController {

	private final OrderDetailService service;
	private final StockDAO stockDAO;
	
	@ModelAttribute("stock")
	public stockVO stock() {
		return new stockVO();
	}
	
	@ModelAttribute("odList")
	public stockOrderDetailVO orderDetail() {
		return new stockOrderDetailVO();
	}
	
	@GetMapping
	public String getHandler(Model model) {
		 
		return "infra/stockOrder/orderDetail";
	}
	
	
}
