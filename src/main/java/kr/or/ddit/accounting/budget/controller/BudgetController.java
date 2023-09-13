package kr.or.ddit.accounting.budget.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
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

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.accounting.accountcategory.service.AccountCategoryService;
import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.accounting.budget.service.BudgetService;
import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.accounting.budgetdetail.service.BudgetDetailService;
import kr.or.ddit.accounting.budgetdetail.vo.budgetDetailVO;
import kr.or.ddit.common.dao.EtcDAO;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.DepartmentVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BudgetController {

    private final BudgetService budgetService;
    private final BudgetDetailService budgetDetailService;
    private final AccountCategoryService accountCategoryService;
    private final EtcDAO etcDao;
    
    @GetMapping("/accounting/budget/BudgetList.do")
    public String budgetList(
    		@RequestParam(required = false) String deptNo
    		, @RequestParam(name = "year", required = false) String yearStr
    		, Model model
    		, Authentication authentication
    ) {
    	// yearStr에 따로 값이 안들어오면 현재 연도로 설정하기
    	Integer year = null;
    	if (StringUtils.isBlank(yearStr)) {
    		year = LocalDate.now().getYear();
    	} else {
    		year = Integer.parseInt(yearStr);
    	}
    	
    	AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
    	EmployeeVO authMember = (EmployeeVO) wrapper.getRealUser();
    	// 부서번호 따로 안준경우에는 로그인한 사람 기준으로 회계내역 보여주기?
    	if (StringUtils.isBlank(deptNo)) {
    		deptNo = authMember.getEmpDeptNo();
    	}
    	
    	BudgetVO budget = new BudgetVO();
    	budget.setDeptNo(deptNo);
    	budget.setBudYear(year);
    	
    	// 연도와 부서 기준으로 예산책정 데이터 가져오기
    	Map<String, BudgetVO> budgetInfo = budgetService.retrieveListByDeptAndYear(budget);
    	model.addAttribute("budgetInfo", budgetInfo);
    	model.addAttribute("curYear", year);
    	model.addAttribute("curDeptNo", deptNo);
    	
        return "accounting/budget/budgetList";
    }
    
    @ModelAttribute("budget")
    public BudgetVO budgetVO() {
    	return new BudgetVO();
    }
    
    public boolean register(Map<String, Object> requestMap) {
    	// JSON 데이터를 문자열로 변환하여 ObjectMapper를 통해 처리
	    ObjectMapper objectMapper = new ObjectMapper();

	    // JSON 문자열을 JsonNode로 변환
	    JsonNode jsonNode = objectMapper.valueToTree(requestMap);

	    Integer year = Integer.parseInt(String.valueOf(requestMap.get("year")));
	    String deptNo = String.valueOf(requestMap.get("deptNo"));
	    
	    long budAmt1 = Long.parseLong(String.valueOf(requestMap.get("oneqAmt")));
	    long budAmt2 = Long.parseLong(String.valueOf(requestMap.get("twoqAmt")));
	    long budAmt3 = Long.parseLong(String.valueOf(requestMap.get("threeqAmt")));
	    long budAmt4 = Long.parseLong(String.valueOf(requestMap.get("fourqAmt")));
	    
	    // JsonNode에서 id와 pw를 추출하여 List<String>으로 변환
	    List<budgetDetailVO> bdList1 = objectMapper.convertValue(jsonNode.get("oneq"), new TypeReference<List<budgetDetailVO>>() {});
	    List<budgetDetailVO> bdList2 = objectMapper.convertValue(jsonNode.get("twoq"), new TypeReference<List<budgetDetailVO>>() {});
	    List<budgetDetailVO> bdList3 = objectMapper.convertValue(jsonNode.get("threeq"), new TypeReference<List<budgetDetailVO>>() {});
	    List<budgetDetailVO> bdList4 = objectMapper.convertValue(jsonNode.get("fourq"), new TypeReference<List<budgetDetailVO>>() {});
    	
	    // 1분기부터 예산부터 저장하기
	    // budget먼저 생성하고 그 아이디를 넣어서 budgetDetail insertall하기
	    // 아이디 생성시에 부서번호 4자리 + 적용연도 4자리 + 분기 => ex) 202312012 : 2023년도 인사부서(1201) 2분기 예산정보
	    String budId = deptNo + year; // 여기에 분기만 더해서 아이디 생성하기
	    
	    // 성공여부 판단하기
	    boolean success = true;
	    
	    // 1분기 예산 등록하기 + 디테일 정보들도 함께 저장하기
	    BudgetVO budget1 = new BudgetVO();
	    budget1.setBudId(budId + 1);
	    budget1.setDeptNo(deptNo);
	    budget1.setBudYear(year);
	    budget1.setBudQuarter(1);
	    budget1.setBudAmt(budAmt1);
	    // 예산과 예산상세 한번에 저장하기
	    budget1.setDetailList(bdList1);
	    success = budgetService.insertBudget(budget1);
	    
	    // 2분기 예산 등록하기
	    BudgetVO budget2 = new BudgetVO();
	    budget2.setBudId(budId + 2);
	    budget2.setDeptNo(deptNo);
	    budget2.setBudYear(year);
	    budget2.setBudQuarter(2);
	    budget2.setBudAmt(budAmt2);
	    budget2.setDetailList(bdList2);
	    success = budgetService.insertBudget(budget2);
	    
	    // 3분기 예산 등록하기
	    BudgetVO budget3 = new BudgetVO();
	    budget3.setBudId(budId + 3);
	    budget3.setDeptNo(deptNo);
	    budget3.setBudYear(year);
	    budget3.setBudQuarter(3);
	    budget3.setBudAmt(budAmt3);
	    budget3.setDetailList(bdList3);
	    success = budgetService.insertBudget(budget3);
	    
	    // 4분기 예산 등록하기
	    BudgetVO budget4 = new BudgetVO();
	    budget4.setBudId(budId + 4);
	    budget4.setDeptNo(deptNo);
	    budget4.setBudYear(year);
	    budget4.setBudQuarter(4);
	    budget4.setBudAmt(budAmt4);
	    budget4.setDetailList(bdList4);
	    return budgetService.insertBudget(budget4);
    }
    
    @GetMapping("/accounting/budget/BudgetInsertForm.do")
    public String budgetInsertForm(
    		Model model
    ) {
    	// 부서리스트 정보 필요함
    	List<DepartmentVO> departments = etcDao.getDepartmentList();
    	model.addAttribute("departments", departments);
    	
    	// 예산 등록할때 카테고리 리스트 조회해야 함.
    	List<AccountCategoryVO> categories = accountCategoryService.getAllAccountCategoriesList();
    	model.addAttribute("categories", categories);
    	
        return "accounting/budget/budgetForm";
    }

    @PostMapping(value = "/accounting/budget/BudgetInsertForm.do", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> budgetInsert (
    		@RequestBody Map<String, Object> requestMap
    		, Model model
    ) {
    	boolean result = register(requestMap);

	    if (result) {
	    	return ResponseEntity.ok("success");
	    } else {
	    	return ResponseEntity.badRequest().body("예산내역 저장실패");
	    }
    }
    
    @RequestMapping("/accounting/budget/BudgetView.do")
    public String budgetView(@RequestParam("acaId") String acaId, Model model) {
        BudgetVO budget = budgetService.getBudget(acaId);
        model.addAttribute("budget", budget);
        return "accounting/budget/budgetView";
    }
    
    @GetMapping(value = "/accounting/budget/autoGenerate.do", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, BudgetVO> getPrevBudget(
    		BudgetVO budget
    ) {
    	Map<String, BudgetVO> budgetInfo = budgetService.retrieveListByDeptAndYear(budget);
    	return budgetInfo;
    }

    @GetMapping("/accounting/budget/BudgetUpdate.do")
    public String budgetUpdateForm(
    		@ModelAttribute("budget") BudgetVO budget
    		, Model model
    ) {
    	// 부서리스트 정보 필요함
    	List<DepartmentVO> departments = etcDao.getDepartmentList();
    	model.addAttribute("departments", departments);
    	
    	// 예산 등록할때 카테고리 리스트 조회해야 함.
    	List<AccountCategoryVO> categories = accountCategoryService.getAllAccountCategoriesList();
    	model.addAttribute("categories", categories);
    	
    	Map<String, BudgetVO> budgetInfo = budgetService.retrieveListByDeptAndYear(budget);
    	model.addAttribute("budgetInfo", budgetInfo);
    	
        return "accounting/budget/budgetForm";
    }
    
    @PostMapping("/accounting/budget/BudgetUpdate.do")
    public ResponseEntity<?> budgetUpdate(
    		@RequestBody Map<String, Object> requestMap
    ) {
    	// 기존에 있던 회계내역 전부 삭제하고 다시 받기
    	Integer year = Integer.parseInt(String.valueOf(requestMap.get("year")));
    	String deptNo = String.valueOf(requestMap.get("deptNo"));
    	
    	BudgetVO budget = new BudgetVO();
    	budget.setBudYear(year);
    	budget.setDeptNo(deptNo);
    	
    	// 1. budget_detail먼저 삭제하기
    	boolean result = budgetDetailService.removeByYearAndDeptNo(budget);
    	if (!result) {
    		// budget_detail 삭제 실패시
    		return ResponseEntity.badRequest().body("예산상세 삭제에 실패하였습니다.");
    	}
    	
    	// 2. budget 삭제하기
    	result = budgetService.removeByYearAndDeptNo(budget);
    	if (!result) {
    		// budget 삭제 실패시
    		return ResponseEntity.badRequest().body("예산 삭제에 실패하였습니다.");
    	}
    	
    	// 등록하기
    	result = register(requestMap);
    	if (result) {
 	    	return ResponseEntity.ok("success");
 	    } else {
 	    	return ResponseEntity.badRequest().body("예산내역 수정에 실패하였습니다.");
 	    }
    }

    @RequestMapping("/accounting/budget/BudgetDelete.do")
    public String budgetDelete(
    		@Validated(DeleteGroup.class) @ModelAttribute("budget") BudgetVO budget,
            BindingResult errors, Model model) {
        if (!errors.hasErrors()) {
            budgetService.deleteBudget(budget.getBudId());
            return "redirect:/accounting/budget/BudgetList.do";
        } else {
            model.addAttribute("message", "예산 삭제 중 문제가 발생하였습니다.");
            return "accounting/budget/budgetView";
        }
    }
    
    @GetMapping("/accounting/budget/budgetDetailList.do")
    public String budgetDetailList(
            @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
            @RequestParam(name = "budId") String budId,
            @ModelAttribute("simpleCondition") SimpleCondition simpleCondition,
            Model model) {

        PaginationInfo<budgetDetailVO> paging = new PaginationInfo<>();
        paging.setCurrentPage(currentPage);
        paging.setSimpleCondition(simpleCondition);
        List<budgetDetailVO> budgetDetail = budgetDetailService.getBudgetDetailById(budId);

        long totalRemainingAmt = 0; // 누적값을 저장할 변수
        long totalAmt=budgetService.getBudget(budId).getBudAmt();

        for (budgetDetailVO budget : budgetDetail) {
            long remainingAmt = budget.getBdAmt();
            totalRemainingAmt += remainingAmt; // 누적값 계산
            budget.setBdAmt(remainingAmt); // budgetDetailVO의 bd_amt 값을 잔여 액수로 업데이트
        }

        paging.setDataList(budgetDetail);

        model.addAttribute("totalRemainingAmt", totalRemainingAmt); // 누적값을 모델에 추가
        model.addAttribute("totalAmt", totalAmt); 
        model.addAttribute("paging", paging);
        model.addAttribute("budId", budId);
        
        return "accounting/budget/budgetDetailList";
    }

}