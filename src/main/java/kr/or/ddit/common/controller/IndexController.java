package kr.or.ddit.common.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.accounting.accountcategory.service.AccountCategoryService;
import kr.or.ddit.accounting.accounting.service.AccountingService;
import kr.or.ddit.accounting.accounting.vo.AccountingVO;
import kr.or.ddit.accounting.budget.service.BudgetService;
import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.accounting.budgetdetail.vo.budgetDetailVO;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.hr.attendance.service.AttendanceService;
import kr.or.ddit.hr.empBrd.service.EmpbrdService;
import kr.or.ddit.hr.vacationReq.service.VacationService;
import kr.or.ddit.hr.vo.AttendanceVO;
import kr.or.ddit.hr.vo.EmpbrdVO;
import kr.or.ddit.hr.vo.VacationReqVO;

@Controller
public class IndexController {
	
	@Inject
	private AttendanceService atService;
	
	@Inject
	private EmpbrdService eBrdService;
	
	@Inject
	private VacationService vacreqService;
	
	@Inject
	private BudgetService budgetService;
	
	@Inject
	 private  AccountingService accountingService;
	
	@RequestMapping("/in")
	public String getCompPage() {
		return "compIndex";
	}
	
	@ModelAttribute("attVO")
	public AttendanceVO emplogin(Authentication authentication) {
		try {
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		String empNo = empVO.getEmpNo();
		AttendanceVO attVO = atService.getEmpAtteToday(empNo);
		return attVO;
		} catch (NullPointerException e) {
			return null;
		}
	}
	@ModelAttribute("empBordVO")
	public List<EmpbrdVO> getImpBord(Authentication authentication) {
		try {
			AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
			EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
			String empNo = empVO.getEmpNo();
			List<EmpbrdVO> ebPubList = eBrdService.retrieveEbpubList();
			return ebPubList;
		} catch (NullPointerException e) {
			return null;
		}
	}
	
	@ModelAttribute("vacreqList")
	public List<VacationReqVO> getVacreq(Authentication authentication) {
		try {
			AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
			EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
			String empNo = empVO.getEmpNo();
			
			List<VacationReqVO> vacreqList = vacreqService.retrieveMyvacList(empNo); 
			return vacreqList;
		} catch (NullPointerException e) {
			return null;
		}
	}
	 
	// 사원 메인페이지
	@RequestMapping("/in/{viewAttr:operate|infra|hr|accounting|safety}")
	public String getOperatePage(@PathVariable String viewAttr) {
		return viewAttr;
	}
	
	//예산그래프
	@ModelAttribute("budgetInfo")
	public String budgetList(
	    @RequestParam(required = false) String deptNo,
	    @RequestParam(name = "year", required = false) String yearStr,
	    Model model,
	    Authentication authentication
	) {
	    try {
	        // yearStr에 따로 값이 안들어오면 현재 연도로 설정하기
	        Integer year = null;
	        if (StringUtils.isBlank(yearStr)) {
	            year = LocalDate.now().getYear();
	        } else {
	            year = Integer.parseInt(yearStr);
	        }
	        EmployeeVO authMember = new EmployeeVO();
	        try {
	        	AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
	        	authMember = (EmployeeVO) wrapper.getRealUser();
	        } catch (NullPointerException e) {
				return null;
			}
	        // 부서번호 따로 안준 경우에는 로그인한 사람 기준으로 회계내역 보여주기
	        if (StringUtils.isBlank(deptNo)) {
	            deptNo = authMember.getEmpDeptNo();
	        }

	        BudgetVO budget = new BudgetVO();
	        budget.setDeptNo(deptNo);
	        budget.setBudYear(year);

	        // 연도와 부서 기준으로 예산책정 데이터 가져오기
	        Map<String, BudgetVO> budgetInfo = budgetService.retrieveListByDeptAndYear(budget);

	        // 회계내역 가져오기
	        List<AccountingVO> histories = accountingService.retrieveListByDept(budget);

	        // Calculate usedAmt and set it in BudgetVO objects
	        for (BudgetVO budgetVO : budgetInfo.values()) {
	            long usedAmt = calculateUsedAmt(histories);
	            budgetVO.setUsedAmt(usedAmt);
	        }

	        // Calculate usedAmt by quarter and set it in model
	        Map<String, Long> usedAmtByQuarter = calculateUsedAmtByQuarter(histories, year);
	        model.addAttribute("usedAmtByQuarter", usedAmtByQuarter);

	        model.addAttribute("budgetInfo", budgetInfo);
	        model.addAttribute("curYear", year);
	        model.addAttribute("curDeptNo", deptNo);
	        return "accounting/budget/budgetList";
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 정보를 로그에 출력 (프로덕션 환경에서는 다른 처리 방식을 고려)
	        return null; // 예외가 발생한 경우 에러 페이지로 리다이렉트 또는 처리 (우선 null 리턴)
	    }
	}

	private long calculateUsedAmt(List<AccountingVO> histories) {
	    long totalUsedAmt = 0;

	    try {
	        for (AccountingVO history : histories) {
	            if (history != null) {
	                Integer accAmt = history.getAccAmt();
	                if (accAmt != null) {
	                    totalUsedAmt += accAmt;
	                }
	            }
	        }
	    } catch (NullPointerException e) {
	        // 만약을 위해 예외를 처리하거나, 원하는 동작을 수행할 수 있습니다.
	        // 예를 들어, 로깅하거나 에러 메시지를 반환하거나 기본값을 사용할 수 있습니다.
	        // 예외 처리 방법에 따라 적절한 코드를 추가하세요.
	        return 0;
	    }

	    return totalUsedAmt;
	}

	private Map<String, Long> calculateUsedAmtByQuarter(List<AccountingVO> histories, int year) {
	    Map<String, Long> usedAmtByQuarter = new HashMap<>();

	    try {
	        for (int quarter = 1; quarter <= 4; quarter++) {
	            long quarterTotal = 0;
	            for (AccountingVO history : histories) {
	                if (history != null) {
	                    Integer accAmt = history.getAccAmt();
	                    String type = history.getAccType();	     
	                    LocalDateTime accUseTs = history.getAccUseTs();

	                    if (accAmt != null && accUseTs != null && !type.equals("수입")) { //지출목록만 소모액에 추가
	                        int historyYear = accUseTs.getYear();
	                        int historyQuarter = calculateQuarter(accUseTs);

	                        if (historyYear == year && historyQuarter == quarter) {
	                            quarterTotal += accAmt;
	                        }
	                    }
	                }
	            }
	            String quarterKey = "quarter" + quarter;
	            usedAmtByQuarter.put(quarterKey, quarterTotal);
	        }
	    } catch (NullPointerException e) {
	        e.printStackTrace();
	    }

	    return usedAmtByQuarter;
	}




	private int calculateQuarter(LocalDateTime date) {
	    int month = date.getMonthValue();

	    if (month >= 1 && month <= 3) {
	        return 1; // 1분기
	    } else if (month >= 4 && month <= 6) {
	        return 2; // 2분기
	    } else if (month >= 7 && month <= 9) {
	        return 3; // 3분기
	    } else {
	        return 4; // 4분기
	    }
	}
	
	/*
	// 인프라본부 메인페이지
	@RequestMapping("/in/infra")
	public String getInfraPage(Authentication authentication, Model model) {
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		model.addAttribute("empVO", empVO);
		return "infra";
	}
	
	// 인사부서 메인페이지
	@RequestMapping("/in/hr")
	public String getHrPage(Authentication authentication, Model model) {
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		model.addAttribute("empVO", empVO);
		return "hr";
	}
	// 회계부서 메인페이지
	@RequestMapping("/in/accounting")
	public String getAccountingPage(Authentication authentication, Model model) {
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		model.addAttribute("empVO", empVO);
		return "accounting";
	}
	// 안전보안본부 메인페이지
	@RequestMapping("/in/safety")
	public String getSafetyPage(Authentication authentication, Model model) {
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		model.addAttribute("empVO", empVO);
		return "safety";
	}
	*/
	// 고객용 메인페이지
	@RequestMapping("/index.do")
	public String getCustPage() {
		return "custIndex";
	}
}
