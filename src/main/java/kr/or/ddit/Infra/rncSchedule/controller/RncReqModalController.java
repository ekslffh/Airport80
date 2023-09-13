package kr.or.ddit.Infra.rncSchedule.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.Infra.rncReq.dao.rncDAO;
import kr.or.ddit.Infra.rncSchedule.service.rncScheduleService;
import kr.or.ddit.Infra.stock.dao.OthersDAO;
import kr.or.ddit.Infra.stock.dao.StockDAO;
import kr.or.ddit.Infra.repairLog.dao.repLogDAO;
import kr.or.ddit.Infra.vo.repairLogVO;
import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.Infra.vo.rncScheduleVO;
import kr.or.ddit.Infra.vo.stockUseDetailVO;
import kr.or.ddit.Infra.vo.stockUseVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.validate.UpdateGroup;

@Controller
@RequestMapping("/infra")
public class RncReqModalController {

	@Inject
	private OthersDAO othersDAO;

	@Inject
	private rncDAO rncDAO;

	@Inject
	private StockDAO stockDAO;

	@Inject
	private repLogDAO repLogDAO;

	@Inject
	private rncScheduleService service;
	
	@Inject
	private rncScheduleService scheduleService;

	@ModelAttribute("rncReqList")
	public List<rncReqVO> rncReqList() {
		return rncDAO.modalRncReqList();
	}

	@ModelAttribute("repLogList")
	public List<repairLogVO> repLogList() {
		return repLogDAO.modalRepLogList();
	}

	@ModelAttribute("zoneList")
	public List<ZoneVO> zoneList() {
		return othersDAO.selectAllZoneList();
	}

	@ModelAttribute("rncSchedule")
	public rncScheduleVO rncSchedule() {
		return new rncScheduleVO();
	}

	@ModelAttribute("stockUse")
	public stockUseVO stockUse() {
		return new stockUseVO();
	}

	// 유지보수 접수내역 확인 모달
	@GetMapping("modalRncReqList.do")
	public String modalList(Model model) {
		List<rncReqVO> comRncReq = rncDAO.modalRncReqList();
		List<repairLogVO> comRepLog = repLogDAO.modalRepLogList();
		model.addAttribute("comRncReq", comRncReq);
		model.addAttribute("comRepLog", comRepLog);
		return "infra/rncSchedule/ajax/comRncReqList";
	}

	// 청소 접수내역 확인 모달 
	@GetMapping("modalRecReqList.do")
	public String modalReqList(Model model) {
	List<rncReqVO> comRecReq = rncDAO.modalRecReqList();
	model.addAttribute("comRecReq",comRecReq);
	return "infra/rncSchedule/ajax/comRecReqList";
	}
	
	// 유지보수 일정 상세보기 모달
	@GetMapping("rncScheduleView.do")
	public String rncScheduleView(@RequestParam(name = "rsId", required = true) String rsId, Model model) {
		rncScheduleVO schOne = service.selectSchedule(rsId);
		    
		    // 현재 날짜와 시간 얻기
		    LocalDateTime currentDate = LocalDateTime.now();

		    // sch.getRsCrtTs()가 이미 LocalDateTime 객체임
		    LocalDateTime registrationDate = schOne.getRsCrtTs();
		    LocalDateTime endDate = schOne.getRsEndTs();
		    
		    // 두 날짜 사이의 차이 계산
		    Duration duration = Duration.between(registrationDate, currentDate);
		    Duration tduration = Duration.between(registrationDate, endDate);

		    // 일 수로 변환
		    long daysPassed = duration.toDays()+1;
		    long totalDaysPassed = tduration.toDays()+1;
		    System.out.println("지난 일 수: " + daysPassed + "일");
		    model.addAttribute("daysPassed", daysPassed);
		    model.addAttribute("totalDaysPassed", totalDaysPassed);
		model.addAttribute("schOne", schOne);
		System.out.println("schOne:" + schOne);

		
		return "infra/rncSchedule/ajax/rncScheduleView";
	}
	
	// 청소 일정 상세보기 모달
	@GetMapping("recScheduleView.do")
	public String scheduleView(@RequestParam(name = "rsId", required = true) String rsId, Model model) {
		rncScheduleVO schOne = service.selectSchedule(rsId);
		
		model.addAttribute("schOne", schOne);
		System.out.println("schOne:" + schOne);

		return "infra/rncSchedule/ajax/recScheduleView";
	}
	
	@GetMapping(value="stockSearch.do", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<stockVO> usingStockSearch(
			@RequestParam("stNm") String stNm
			){
		List<stockVO> stockList = service.retrieveStockList(stNm);
		return stockList;
	}

	// 처리완료
	@RequestMapping(value = "scheduleUpdate.do", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
	@ResponseBody
	public Map scheduleUpdate(
	    @Validated(UpdateGroup.class) @ModelAttribute("stockUse") stockUseVO stockUse,
	    @RequestBody Map<String, Object> requestData
	) {
	    String rsEndTsStr = (String) requestData.get("rsEndTs"); 
	    LocalDateTime rsEndTs = LocalDateTime.parse(rsEndTsStr);
	    
	    String rsId = (String) requestData.get("rsId");
	    List<Map<String, Object>> selectedStocks = (List<Map<String, Object>>) requestData.get("selectedStocks");
	    
	    Map<String, Object> map = new HashMap<>();
	    ServiceResult result = service.insertStockUse(stockUse);
	    
	    if (result == ServiceResult.OK) {
	        for (Map<String, Object> selectedStock : selectedStocks) {
	            stockUseDetailVO stockUseDetail = new stockUseDetailVO();
	            
	            stockUseDetail.setStId((String) selectedStock.get("stId")); 
	            stockUseDetail.setSuId(stockUse.getSuId()); 
	            stockUseDetail.setSoCnt(Integer.parseInt((String) selectedStock.get("quantity")));
	            
	            ServiceResult res = service.insertStockUseDetail(stockUseDetail);
	            
	            if (res != ServiceResult.OK) {
	                map.put("result", "실패");
	                map.put("message", "사용재고등록 실패");
	                return map; 
	            }else {
	            	if(selectedStock != null) {
	            		stockVO stock = new stockVO();
	            		stock.setStId((String)selectedStock.get("stId"));
	            		stock.setStQuantity(Integer.parseInt((String) selectedStock.get("quantity")));
	            		
	            		ServiceResult cntResult = service.modifyStockCnt(stock);
	            		
	            		if(cntResult != ServiceResult.OK) {
	            			map.put("cntResult", "실패");
	            			map.put("message", "재고 수량 설정 실패");
	            			return map;
	            		}
	            		
	            		ServiceResult sttsResult = service.modifySttsPC(rsId);
	            		if(sttsResult != ServiceResult.OK) {
	            			map.put("sttsResult", "실패");
	            			map.put("message", "pc로 상태변경 실패");
	            			return map;
	            		}
	            	}
	            }
	        }
	        
	        rncScheduleVO rncSchedule = new rncScheduleVO();
	        rncSchedule.setRsSuId(stockUse.getSuId()); 
	        rncSchedule.setRsEndTs(rsEndTs); 
	        rncSchedule.setRsId(rsId); 
	        
	        ServiceResult updateRes = service.updateRncSchedule(rncSchedule);
	        if (updateRes != ServiceResult.OK) {
	            map.put("result", "실패");
	            map.put("message", "RNC 일정 업데이트 실패");
	            return map;
	        }
	        
	        map.put("response", "success");
	        map.put("msg", "처리 완료");
	    } else {
	        map.put("response", "fail");
	        map.put("message", "잘못된 요청");
	    }
	    
	    return map;
	}
}

