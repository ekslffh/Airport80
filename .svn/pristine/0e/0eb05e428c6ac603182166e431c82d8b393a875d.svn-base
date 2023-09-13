package kr.or.ddit.Infra.stockOrder.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.Infra.stock.dao.OthersDAO;
import kr.or.ddit.Infra.stock.dao.StockDAO;
import kr.or.ddit.Infra.stockOrder.service.StockOrderService;
import kr.or.ddit.Infra.supplier.dao.SupplierDAO;
import kr.or.ddit.Infra.vo.stockOrderDetailVO;
import kr.or.ddit.Infra.vo.stockOrderVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.Infra.vo.supplierVO;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/infra/stockOrderInsert.do")
public class OrderInsertController {

	private final StockOrderService service;
	private final SupplierDAO supplierDAO;
	private final OthersDAO othersDAO;
	private final StockDAO stockDAO;

	@ModelAttribute("commonCode")
	public List<CommonCodeVO> commonCode() {
		return othersDAO.selectCommonList();
	}

	@ModelAttribute("supplier")
	public List<supplierVO> supplier() {
		return supplierDAO.selectSupplier();
	}
	
	@ModelAttribute("stockList")
	public List<stockVO> stockList(){
		return stockDAO.selectStockListByCtgr();
	}
	
	@ModelAttribute("stockOrder") 
	public stockOrderVO stockOrderList(){
		return new stockOrderVO();
	}
	
	@ModelAttribute("stockOrderDetail")
	public stockOrderDetailVO stockOrderDetail() {
		return new stockOrderDetailVO();
	}
	@GetMapping
	public String getHandler(Model model) {

		
		return "infra/stockOrder/insertStockOrder";
	}
	
	@PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map postHandler(
			@Validated(InsertGroup.class) @ModelAttribute("stockOrder") stockOrderVO stockOrder
			, BindingResult errors
	        , @RequestBody Map<String, Object> requestMap
	        , Authentication authentication
			, Model model
	) {

		 // JSON 데이터를 문자열로 변환하여 ObjectMapper를 통해 처리
	    ObjectMapper objectMapper = new ObjectMapper();

	    // JSON 문자열을 JsonNode로 변환
	    JsonNode jsonNode = objectMapper.valueToTree(requestMap);

	    // JsonNode에서 id와 pw를 추출하여 List<String>으로 변환
	    List<stockOrderDetailVO> orderItems = objectMapper.convertValue(jsonNode.get("orderItems"), new TypeReference<List<stockOrderDetailVO>>() {});
		
		String sprId = (String) requestMap.get("sprId");
		int soAmount = (int) requestMap.get("soAmount");
		
	    stockOrder.setStockOrderDetail(orderItems);
	    
	    System.out.println(sprId);
	    System.out.println(orderItems);
	    System.out.println(soAmount);
	    
	    stockOrder.setSoTs(LocalDateTime.now()); // 현재 시간 설정
	    
	    AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
	    EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
	    
	    // SecurityContextHolder에서 Authentication 객체를 가져옴
	    authentication = SecurityContextHolder.getContext().getAuthentication();
	    
	    // 로그인한 사용자의 아이디와 이름을 가져와서 stockOrder에 설정
	    String loggedInUserId = empVO.getEmpNo(); // 아이디
	    stockOrder.setSoEmpNo(loggedInUserId);
	    stockOrder.setSoStatus("발주완료");
	    stockOrder.setSoAmount(soAmount);
	    stockOrder.setSprId(sprId);
	   
	    System.out.println(stockOrder.getSoEmpNo());
	    System.out.println(stockOrder.getSoStatus());
	    
	    String logicalViewName = null;
	    
	    Map<String, String> map = new HashedMap();
	    if (!errors.hasErrors()) {
		      
			ServiceResult result = service.createStockList(stockOrder);
			System.out.println(result);
			if (ServiceResult.OK == result) {
				map.put("result", "썽공");
				
//				logicalViewName = "redirect:/infra/stockList.do";
			} else {
				map.put("result", "실패");
				map.put("message", "서버오류, 잠시 뒤 다시 시도하세요.");
//				model.addAttribute("message", "서버오류, 잠시 뒤 다시 시도하세요.");
//				logicalViewName = "infra/stockOrder/insertStockOrder";
			}
		} else {
			System.out.println(errors.getAllErrors());
			map.put("result", "실패");
			map.put("message", "잘못된 요청");
//			logicalViewName = "infra/stockOrder/insertStockOrder";
		}
		
		return map;
	}
}

