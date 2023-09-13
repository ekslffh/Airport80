package kr.or.ddit.common.requestList.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.Infra.rncReq.service.rncService;
import kr.or.ddit.Infra.stock.dao.OthersDAO;
import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.accounting.accountcategory.service.AccountCategoryService;
import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.accounting.budgetreq.service.BudgetReqService;
import kr.or.ddit.accounting.budgetreq.vo.BudgetReqVO;
import kr.or.ddit.common.requestList.service.RequestListService;
import kr.or.ddit.common.vo.RequestListVO;
import kr.or.ddit.safety.confiscation.dao.OtherDAO;
import kr.or.ddit.safety.ssupport.service.SecurityReqService;
import kr.or.ddit.safety.vo.SecurityReqVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.vo.CommonCodeVO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.extern.java.Log;

@Controller
@RequestMapping("/common")
public class RequestListController {

	@Inject
	private RequestListService service;

	@Inject
	private SecurityReqService secReqService;
	
	@Inject
	private rncService rncService;

	@Inject
	private AccountCategoryService accountCategoryService;

	@Inject
	private BudgetReqService bdgService;
	
	@Inject
	private OtherDAO otherDAO;
	
	@Inject
	private OthersDAO othersDAO;
	
	@ModelAttribute("zoneList")
	public List<ZoneVO> zoneList() {
		return otherDAO.selectAllZoneList();
	}

	@ModelAttribute("commonList")
	public List<CommonCodeVO> commonList() {
		return otherDAO.selectSecaList();
	}
	
//	@ModelAttribute("commonrncList")
//	public List<CommonCodeVO> commonLrncist(){
//		return othersDAO.selectRncList();
//	}
	
	
	@ModelAttribute("secReq")
	public SecurityReqVO secReq() {
		return new SecurityReqVO();
	}
	

	@ModelAttribute("rnc")
	public rncReqVO rncReq() {
		return new rncReqVO();
	}
	
	
	// 요청목록 화면
	@GetMapping("requestList.do")
	public String getRequestList(Model model) {
		return "common/requestList/requestList";
	}

	
	// 요청내역 전체출력(부서별 필터링) 
	@GetMapping(value = "requestAllList.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> allrequstList(
			@RequestParam(required = false) String departSelect,
			@RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate,
			@RequestParam(required = false) String searchType,
			@RequestParam(required = false) String searchWord,
			@RequestParam(name = "empNo") String empNo,
			@RequestParam(required = false) String reqStatus,
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
		) {
		RequestListVO reqObject = new RequestListVO();
		SimpleCondition condition = new SimpleCondition();
		
		LocalDate localStartDate = null;
		LocalDate localEndDate = null;
		
		if(startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
			localStartDate = LocalDate.parse(startDate);
			localEndDate = LocalDate.parse(endDate);
		}
		
		condition.setStartDate(localStartDate);
		condition.setEndDate(localEndDate);
		condition.setSearchType(searchType);
		condition.setSearchWord(searchWord);
		condition.setReqCtgr(departSelect);
		
		
		if("reqStatus".equals(reqStatus)) {
			condition.setSecReqStatus("REQ");
			condition.setRncReqStatus1("WT");
			condition.setBudReqStatus("승인대기");
		}else if("proStatus".equals(reqStatus)) {
			condition.setSecReqStatus("RES");
			condition.setRncReqStatus1("PG");
			condition.setRncReqStatus2("DL");
		}else if("comStatus".equals(reqStatus)) {
			condition.setSecReqStatus("COMP");
			condition.setRncReqStatus1("PC");
			condition.setRncReqStatus2("WO");
			condition.setBudReqStatus("승인완료");
		}else if("rejStatus".equals(reqStatus)) {
			condition.setRncReqStatus1("CP");
			condition.setBudReqStatus("반려");
		}
			
			
		PaginationInfo<RequestListVO> paging = new PaginationInfo<>(10,5);
		paging.setSimpleCondition(condition);
		paging.setCurrentPage(currentPage);
		paging.setReqWriter(empNo);
		
		List<RequestListVO> reqAllList = service.retrieveAllReqList(paging);
		
		//페이징 총개수 
		long totalCount = service.countTotalReq(paging);
		
		paging.setDataList(reqAllList);
		
		//데이터를 Map에 담기
		Map<String, Object> responseMap = new HashMap<>();
		responseMap.put("paging", paging);
		responseMap.put("totalCount", totalCount);
		
		System.out.println(paging);
		
		// 상태별 게시글 갯수
		Map<String, Integer> allCount = service.getAllCnt(empNo);
		responseMap.put("allCount", allCount);

		// 게시글 총갯수
		long reqAllCount = service.getAllCount(empNo);
		responseMap.put("reqAllCount", reqAllCount);
		
		return responseMap;
	}

	
	
	
	// 요청내역 상세뷰
	@GetMapping(value = "requestView.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Object seqListView(@RequestParam(name = "what") String reqId) {
			
			if (reqId.startsWith("SR")) {
				SecurityReqVO reqList = secReqService.retrieveSecReq(reqId);
				return reqList;
	
			} else if (reqId.startsWith("RR")) {
				 rncReqVO rncList = rncService.retrieveRncReq(reqId);
				 return rncList;
				
			} else if (reqId.startsWith("BG")) {
				BudgetReqVO bdjList = bdgService.getBudgetReq(reqId);
				return bdjList;
			}else {
				
				return null;
			}
	}
	
	//수정폼 
	@GetMapping("requestUpdate.do")
	public String secUpdate(
			@RequestParam(name="reqId", required = true) String reqId ,
			Model model
			) {
		
		if(reqId.startsWith("SR")) {
			SecurityReqVO secReq = secReqService.retrieveSecUdtForm(reqId);
			model.addAttribute("secReq",secReq);
			return "/common/requestList/ajax/secUpdate";
			
		}else if(reqId.startsWith("RR")) {
			rncReqVO rnc = rncService.retrieveRncUdpForm(reqId);
			model.addAttribute("rnc", rnc);
			return "/common/requestList/ajax/rncUpdate";
		}else if(reqId.startsWith("BG")) {
			BudgetReqVO budgetReq = bdgService.retrieveBudUdForm(reqId);
			model.addAttribute("budgetReq", budgetReq);
			List<AccountCategoryVO> accountCategories = accountCategoryService.getAllAccountCategoriesList();
			model.addAttribute("accountCategories", accountCategories);
			return "/common/requestList/ajax/budUpdate";
			
		}else {
			
		}
		return "/common/requestList/ajax/rncUpdate";
		
		
		
	}
}
