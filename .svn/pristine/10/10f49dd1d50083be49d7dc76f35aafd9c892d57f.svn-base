package kr.or.ddit.accounting.budgetreq.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.el.parser.ParseException;

import kr.or.ddit.accounting.accountcategory.service.AccountCategoryService;
import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.accounting.budgetdetail.service.BudgetDetailService;
import kr.or.ddit.accounting.budgetdetail.vo.budgetDetailVO;
import kr.or.ddit.accounting.budgetreq.service.BudgetReqService;
import kr.or.ddit.accounting.budgetreq.vo.BudgetReqVO;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BudgetReqController {

	private final BudgetReqService bdReqService;
	private final AccountCategoryService accountCategoryService;
	private final BudgetDetailService budgetDetailService;

	@RequestMapping("/accounting/budgetrequest/BudgetReqList.do")
	public String BudgetReqService(@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
			@ModelAttribute("simpleCondition") SimpleCondition simpleCondition, Model model,
			Authentication authentication) {

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		String deptNo = empVO.getEmpDeptNo();

		if (deptNo == "1201" || deptNo.equals("1201")) { // 로그인 정보에 따라 전체 리스트
			List<BudgetReqVO> allReq = bdReqService.getAllBudgetReqListDAO();
			model.addAttribute("BudgetReqList", allReq);
			return "accounting/budgetrequest/BudgetReqList";
		} else {
			List<BudgetReqVO> deptReq = bdReqService.getDeptBudgetReqListDAO(deptNo);
			model.addAttribute("BudgetReqList", deptReq); // 부서별 리스트
			return "accounting/budgetrequest/BudgetReqList";
		}

	}

	@RequestMapping("/accounting/budgetrequest/BudgetRequestForm.do")
	public String showBudgetRequestForm(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
			Authentication authentication, Model model) {

		List<AccountCategoryVO> accountCategories = accountCategoryService.getAllAccountCategoriesList();
		model.addAttribute("accountCategories", accountCategories);

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		String empNo = empVO.getEmpNo();
		model.addAttribute("empNo", empNo);

		// 새로운 BudgetReqVO 객체를 생성하여 모델에 추가
		BudgetReqVO budgetReq = new BudgetReqVO();
		model.addAttribute("budgetReq", budgetReq);

		// 예산 요청 폼 JSP 페이지로 이동
		return "accounting/budgetrequest/ex/BudgetReqForm";
	}

	// 인서트
	@RequestMapping(value = "/accounting/budgetrequest/insert.do", method = RequestMethod.POST)
	public ResponseEntity<String> insertBudgetRequest(
			@Validated(InsertGroup.class) @ModelAttribute("budgetReq") BudgetReqVO budgetReq, BindingResult errors,
			Model model) {
		// 유효성 검사 에러 체크
		if (errors.hasErrors()) {
//				  System.out.println(errors.getAllErrors());
			return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		} else {
			bdReqService.insertBudgetReq(budgetReq);
			return new ResponseEntity<>("success", HttpStatus.OK);
		}

	}

	@RequestMapping("/accounting/budgetrequest/DetailPage.do")
	public String showDetailPage(@RequestParam(required = true) String bgRId, // 필수값, 기본값 true //생략가능
			Authentication authentication, Model model) {

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();

		BudgetReqVO budgetDetail = bdReqService.getBudgetReq(bgRId);
		model.addAttribute("budgetDetail", budgetDetail);
		model.addAttribute("loginEmpNo", empVO.getEmpNo());

		return "accounting/budgetrequest/BudgetDetail";
	}

	@GetMapping("/accounting/budgetrequest/update.do")
	public String updatePage(@RequestParam String bgRId, Authentication authentication, Model model) {
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		String deptNo = empVO.getEmpDeptNo();

		if (deptNo == "1201" || deptNo.equals("1201")) {
			BudgetReqVO budgetDetail = bdReqService.getBudgetReq(bgRId);
			
			
			model.addAttribute("budgetDetail", budgetDetail);
			return "accounting/budgetrequest/ex/BudgetUpdate";
		} else {
			return "redirect:/accounting/budgetrequest/BudgetReqList.do";
		}
	}

	@PostMapping("/accounting/budgetrequest/update.do")
	public String update(
			@Validated(UpdateGroup.class) @ModelAttribute("budgetDetail") BudgetReqVO budgetDetail,
			Errors errors, @RequestParam String bgRId,
			Authentication authentication, Model model) {

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		String empNo = empVO.getEmpNo();
		String empNm = empVO.getEmpNm();
		String deptNo = empVO.getEmpDeptNo();

		budgetDetail.setSalEmpNo(empNo);
		budgetDetail.setSalEmpNm(empNm);
		
		BudgetReqVO budgetReq = bdReqService.getBudgetReq(bgRId);
		// 부서번호, 연도, 분기, 카테고리아이디
		String rDeptNo = budgetReq.getEmpEmpNo().substring(0, 4);
		
		
        // SimpleDateFormat을 사용하여 문자열을 Date로 파싱
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSSSSSSSS");
        
       String useTs = budgetReq.getBgRUseTs();
//       java.text.ParseException: Unparseable date: "2023-08-10 14:06:00"
       String year = useTs.substring(0, 4);
       String month = useTs.substring(5, 7);
       
       int quarter = (Integer.parseInt(month) - 1) / 3 + 1;

        // Date에서 연도와 분기 추출
        String result = rDeptNo;
        String categoryId = budgetReq.getAcaId();
        result += year + quarter;
        
        String budId = result;
        
        budgetDetailVO insertData = new budgetDetailVO();
        insertData.setBudId(budId);
        insertData.setAcaId(categoryId);
        
        budgetDetailVO budgetDetailVo = budgetDetailService.getBudgetDetail(insertData);
        
        Long amt = budgetDetailVo.getBdAmt();
        
        amt += budgetReq.getBgRAmt();
        
        budgetDetailVo.setBdAmt(amt);
        
        budgetDetailService.updateBudgetDetail(budgetDetailVo);
        
		if (deptNo == "1201" || deptNo.equals("1201")) {
			int cnt = bdReqService.updateBudgetReq(budgetDetail);
			
			// 예산책정 데이터 변경하기
			
			return "redirect:/accounting/budgetrequest/DetailPage.do?bgRId=" + bgRId;
		} else {
			model.addAttribute("message", "업데이트 중 에러 발생");
			return "redirect:/accounting/budgetrequest/DetailPage.do?bgRId=" + bgRId;
		}

	}

	@RequestMapping("/accounting/budgetrequest/delete.do")
	public String deleteBudgetRequest(
			@Validated(DeleteGroup.class) @RequestParam("bgRId") String bgRId,
			@Validated(DeleteGroup.class) @ModelAttribute("budgetDetail") BudgetReqVO budgetDetail,
			Errors errors, 
			Model model,
			Authentication authentication) {
		
		// 사용자 정보 가져오기
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();

		// 유효성 검사 오류가 없는지 확인
		if (!errors.hasErrors()) { 
			int cnt = bdReqService.deleteBudgetReq(bgRId);

			if (cnt > 0) {
				// 삭제 성공 시 필요한 동작 수행
				model.addAttribute("message", "삭제 성공");
				return "redirect:/accounting/budgetrequest/BudgetReqList.do";
			} else {
				// 삭제 실패 시 적절한 에러 메시지 추가
				model.addAttribute("message", "삭제 실패");
				return "redirect:/accounting/budgetrequest/DetailPage.do?bgRId=" + bgRId;
			}
		} else {
			// 유효성 검사 오류가 있을 경우, 이에 대한 처리
			model.addAttribute("message", "항목을 찾을 수 없습니다.");
			return "redirect:/accounting/budgetrequest/BudgetReqList.do";
		}
	}
}
