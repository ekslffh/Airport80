package kr.or.ddit.Infra.stockOrder.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.Infra.stockOrder.service.StockOrderService;
import kr.or.ddit.Infra.stockOrderDetail.dao.OrderDetailDAO;
import kr.or.ddit.Infra.vo.stockOrderDetailVO;
import kr.or.ddit.Infra.vo.stockOrderVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("infra/orderDetail.do")
public class OrderDetailController {
	
	private final StockOrderService service;
	private final OrderDetailDAO orderDetailDAO;
	
	@ModelAttribute("orderDetail")
	public stockOrderVO stockOrder() {
		return new stockOrderVO();
	}
	
	@ModelAttribute("stockList")
	public stockOrderDetailVO stockList() {
		return new stockOrderDetailVO();
	}
	
	@GetMapping
	public String getHandler(@RequestParam String what, Model model ) {
		stockOrderVO orderDetail = service.selectOneRetrieve(what);
		List<stockOrderDetailVO> detail = orderDetailDAO.searchOrderDetail(what);
		model.addAttribute("orderDetail", orderDetail);
		model.addAttribute("detail", detail);
		return "infra/stockOrder/ajax/orderDetail";
	}
	
	
	@PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map postHandler(
			 @RequestBody Map<String, String> requestBody,
			 @ModelAttribute("simpleCondition") SimpleCondition simpleCondition,
		        BindingResult errors,
		        Model model) {
		String soId = requestBody.get("what"); // 요청 본문에서 soId 값을 가져옴
		stockOrderVO orderDetail = service.selectOneRetrieve(soId);
		List<stockOrderDetailVO> detail = orderDetailDAO.searchOrderDetail(soId);
	    String logicalViewName = null;

	    Map<String ,String> map = new HashedMap();
	    if (!errors.hasErrors()) {
	        // 선택된 아이템마다 업데이트 로직을 수행
	        ServiceResult result = service.updateStockCnt(soId);
	        System.out.println(result);
	        if (ServiceResult.OK == result) {
	        	map.put("result", "성공");
//	            model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하세요.");
//	            logicalViewName = "infra/stockOrder/stockOrderList";
//	            return logicalViewName; // 처리 중 문제 발생 시 바로 빠져나감
	        // 모든 아이템이 성공적으로 업데이트 되었을 경우
	        //logicalViewName = "redirect:/infra/stockOrderList.do";
	    } else {
	    	map.put("result", "실패");
	    	map.put("message", "서버오류, 잠시 뒤 다시 시도하세요.");
//	    	System.out.println(errors.getAllErrors());
//	        logicalViewName = "infra/stockOrder/stockOrderList";
	    }
	    }else {
	    	System.out.println(errors.getAllErrors());
	    	map.put("result", "실패");
	    	map.put("message", "잘못된 요청");
	    }
	    System.out.println(map);
	    return map;
	}
}
