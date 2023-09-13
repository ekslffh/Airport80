package kr.or.ddit.accounting.accounting.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.commons.lang.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import kr.or.ddit.accounting.accountcategory.service.AccountCategoryService;
import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.accounting.accounting.service.AccountingService;
import kr.or.ddit.accounting.accounting.vo.AccountingVO;
import kr.or.ddit.accounting.accounting.vo.AmountMonthVO;
import kr.or.ddit.accounting.budget.service.BudgetService;
import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/accounting/history")
public class AccountingController {
	
    private final AccountCategoryService accountCategoryService;
    private final BudgetService budgetService;
    private final AccountingService accountingService;
	
	@ModelAttribute("accounting")
	public AccountingVO accountingVO() {
		return new AccountingVO();
	}
	
	@GetMapping(value = "/cntCategoryAmt", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, List<String>> getAmtByCategory(
		@RequestParam(name = "deptNo", required = false) String deptNo
		, @RequestParam(name = "year", required = false) String yearStr
		, @RequestParam(name ="quarter", required = false) String quarterStr
		, Authentication authentication
	) {
		
		Integer year = null;
		Integer quarter = null;
		
		// 부서안넣어주면 현재 로그인한 사용자의 부서번호 넣어주기
		if (StringUtils.isBlank(deptNo)) {
			AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
			EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
			deptNo = empVO.getEmpDeptNo();
		}
		
		// 연도 선택안하면 현재연도 넣어주기
		if (StringUtils.isBlank(yearStr)) {
			year = LocalDate.now().getYear();
		} else {
			year = Integer.parseInt(yearStr);
		}
		
		// 분기 선택안하면 현재분기
		// 현재 날짜 가져오기

		if (StringUtils.isBlank(quarterStr)) {
			// 월을 가져오기 (1월부터 12월까지)
	        Month currentMonth = LocalDate.now().getMonth();
	        // 현재 월을 기반으로 분기 계산
	        int currentQuarter;
	        
	        if (currentMonth.getValue() >= 1 && currentMonth.getValue() <= 3) {
	            quarter = 1;
	        } else if (currentMonth.getValue() >= 4 && currentMonth.getValue() <= 6) {
	        	quarter = 2;
	        } else if (currentMonth.getValue() >= 7 && currentMonth.getValue() <= 9) {
	        	quarter = 3;
	        } else {
	        	quarter = 4;
	        }
		} else {
			quarter = Integer.parseInt(quarterStr);
		}
		
		// 특정 부서의 특정 연도의 특정 분기에 따른 category별 사용양 보여주기
		BudgetVO budget = new BudgetVO();
		budget.setDeptNo(deptNo);
		budget.setBudYear(year);
		budget.setBudQuarter(quarter);
		Map<String, List<String>> result = accountingService.getAmountByCategoryAndQrt(budget);
		
		List<String> yList = new ArrayList<String>();
		List<String> qList = new ArrayList<String>();
		yList.add(year.toString());
		qList.add(quarter.toString());
		result.put("year", yList);
		result.put("quarter", qList);
		
		return result;
	}
	
	@GetMapping(value = "/cntMonthAmt", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, List<String>> getAmtByMonth (
			@RequestParam(name = "deptNo", required = false) String deptNo
			, @RequestParam(name = "year", required = false) String yearStr
			, Authentication authentication
	) {
		
		Integer year = null;
		Integer quarter = null;
		
		// 부서안넣어주면 현재 로그인한 사용자의 부서번호 넣어주기
		if (StringUtils.isBlank(deptNo)) {
			AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
			EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
			deptNo = empVO.getEmpDeptNo();
		}
		
		// 연도 선택안하면 현재연도 넣어주기
		if (StringUtils.isBlank(yearStr)) {
			year = LocalDate.now().getYear();
		} else {
			year = Integer.parseInt(yearStr);
		}
		
		// 특정 부서의 특정 연도의 특정 분기에 따른 category별 사용양 보여주기
		BudgetVO budget = new BudgetVO();
		budget.setDeptNo(deptNo);
		budget.setBudYear(year);
		List<AmountMonthVO> monthList = accountingService.getAmountByMonth(budget);
		Map<String, List<String>> result = new HashedMap<String, List<String>>();
		
		List<String> incomeList = new ArrayList<String>();
		List<String> expenseList = new ArrayList<String>();
		for (AmountMonthVO month : monthList) {
			incomeList.add(month.getIncome());
			expenseList.add(month.getExpense());
		}
		
		result.put("income", incomeList);
		result.put("expense", expenseList);
		
		List<String> yList = new ArrayList<String>();
		List<String> qList = new ArrayList<String>();
		yList.add(year.toString());
		result.put("year", yList);
		
		return result;
	}
	
	@GetMapping("/list.do")
	public String getList(
			@ModelAttribute("budget") BudgetVO budget
			, Authentication authentication
			, Model model
	) throws JsonProcessingException 
	{
		// ! 필요한 데이터 : 특정 연도와 부서번호를 가지고 회계내역을 가져온다.
		
		// 1. 연도 선택안하면 현재 연도로 세팅하기
		if (budget.getBudYear() == null) {
			budget.setBudYear(LocalDate.now().getYear());
		}
		
		// 2. 로그인한 사용자 기준으로 부서번호와 팀번호 추출하기
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO employee = (EmployeeVO) wrapper.getRealUser();
		String deptNo = employee.getEmpDeptNo();
		String teamNo = employee.getEmpTeam();
		
		List<AccountingVO> histories = null;
		// 3. 회계부서(부서번호: 1201, 팀번호: 32)라면 연도만 가지고 전체 내역 가져와야 함
		if (deptNo.equals("1201") && teamNo.equals("32")) {
			// 3-1. 만약 특정 부서번호가 요청되었으면 들어오면 해당하는 부서번호로 보여줌
			if (StringUtils.isNotBlank(budget.getDeptNo())) {
				histories = accountingService.retrieveListByDept(budget);
			} else { // 3-2. 특정 부서번호가 안들어온다면 전체 부서 통틀어서 특정연도의 회계내역 가져오기
				histories = accountingService.retrieveList(budget);
			}
		} else { // 3-3. 이외 타부서(인사, 운영, 보안, 인프라)는 본인의 부서의 회계 내역만 조회해야 함
			budget.setDeptNo(deptNo);
			histories = accountingService.retrieveListByDept(budget);
		}
		
		// 4-1. model에 담아서 보내주기
		model.addAttribute("histories", histories);
		
		// 4-2. json형식으로도 보내줘서 그래프 그릴 예정
		// Java 객체를 JSON 문자열로 변환합니다.
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.registerModule(new JavaTimeModule());
		objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
		
        String historiesToJson = objectMapper.writeValueAsString(histories);
		model.addAttribute("historiesToJson", historiesToJson);
        
		// 5. 예산 등록할때 카테고리 리스트 조회해야 함. 전체 카테고리 리스트 model에 넣어주기
    	List<AccountCategoryVO> categories = accountCategoryService.getAllAccountCategoriesList();
    	model.addAttribute("categories", categories);
		
    	// 6. historyList화면으로 이동
		return "accounting/history/historyList";
	}
	
	@PostMapping(value = "/insert.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, String> insert(
			@ModelAttribute("accounting") @Validated(InsertGroup.class) AccountingVO accounting
			, Errors errors
			, Authentication authentication
	) {
		Map<String, String> result = new HashedMap<String, String>();
		if (!errors.hasErrors()) {
			// 부서아이디와 사용일을 기준으로 연도와 분기를 구한다. 이를 통해 예산 아이디를 찾아낸다.
			AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
			EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
			String deptNo = empVO.getEmpDeptNo();
			LocalDateTime useTime = accounting.getAccUseTs();
			int year = useTime.getYear();
			int month = useTime.getMonthValue();
			int quarter = (month - 1) / 3 + 1;
			
			// 특정한 회계상세내역 아이디 찾아서 넣어주기
			String budId = deptNo + year + quarter;
			accounting.setAccBudId(budId);
			
			// 회계내역 생성하기
			// 추가로 넣어줘야 하는데이터
			accounting.setAccId(UUID.randomUUID().toString().substring(0, 15));
			
			// 데이터 추가하기
			boolean success = accountingService.create(accounting);
			// 성공시에 해당하는 테이블 다시 돌려주기
			if (success) {
				result.put("result", "success");
			} else {
				result.put("result", "fail");
				result.put("message", "회계내역 추가에 실패하였습니다.");
			}
			
			// 실패시에도 일단 테이블 동일하게 돌려주기?
		} else {
			result.put("result", "fail");
			result.put("message", "회계내역 입력내용을 확인해주세요.");
		}
		return result;
	}
	
	@PostMapping(value = "/update.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, String> update(
			@ModelAttribute("accounting") @Validated(UpdateGroup.class) AccountingVO accounting
			, Errors errors
			, Authentication authentication
	) {
		Map<String, String> result = new HashedMap<String, String>();
		if (!errors.hasErrors()) {
			// 부서아이디와 사용일을 기준으로 연도와 분기를 구한다. 이를 통해 예산 아이디를 찾아낸다.
			AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
			EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
			String deptNo = empVO.getEmpDeptNo();
			LocalDateTime useTime = accounting.getAccUseTs();
			int year = useTime.getYear();
			int month = useTime.getMonthValue();
			int quarter = (month - 1) / 3 + 1;
			
			// 특정한 회계상세내역 아이디 찾아서 넣어주기
			String budId = deptNo + year + quarter;
			accounting.setAccBudId(budId);
			
			// 회계내역 생성하기
			// 추가로 넣어줘야 하는데이터
//			accounting.setAccId(UUID.randomUUID().toString().substring(0, 15));
			
			// 데이터 추가하기
			boolean success = accountingService.modify(accounting);
			// 성공시에 해당하는 테이블 다시 돌려주기
			if (success) {
				result.put("result", "success");
			} else {
				result.put("result", "fail");
				result.put("message", "회계내역 수정에 실패하였습니다.");
			}
			
			// 실패시에도 일단 테이블 동일하게 돌려주기?
		} else {
			result.put("result", "fail");
			result.put("message", "회계내역 입력내용을 확인해주세요.");
		}
		return result;
	}
	
	@PostMapping(value = "delete.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, String> delete(String accId) {
		boolean result =  accountingService.remove(accId);
		Map<String, String> map = new HashedMap();
		if (result) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
			map.put("message", "삭제실패하였습니다.");		
		}
		return map;
	}
}
