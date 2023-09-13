package kr.or.ddit.accounting.budgetdetail.controller;

import java.util.List;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.accounting.accountcategory.service.AccountCategoryService;
import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.accounting.budget.service.BudgetService;
import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.accounting.budgetdetail.service.BudgetDetailService;
import kr.or.ddit.accounting.budgetdetail.vo.budgetDetailVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BudgetDetailController {

	
    private final BudgetDetailService budgetDetailService;
    private final AccountCategoryService accountCategoryService;
    private final BudgetService budgetService;


    @RequestMapping("/accounting/budgetdetail/BudgetDetailList.do")
    public String budgetDetailList(
    		@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
    		@RequestParam(name = "budId") String budId,
    		@ModelAttribute("simpleCondition") SimpleCondition simpleCondition,
            Model model) {
    	
    	
    	PaginationInfo<budgetDetailVO> paging1 = new PaginationInfo<>();
    	PaginationInfo<AccountCategoryVO> paging2 = new PaginationInfo<>(100,1);
        paging1.setCurrentPage(currentPage);
        paging1.setSimpleCondition(simpleCondition);
        List<budgetDetailVO> budgetDetailList = budgetDetailService.getAllBudgetDetailList(paging1);
        List<AccountCategoryVO> category = accountCategoryService.getAllAccountCategoriesList(paging2);
        paging1.setDataList(budgetDetailList);
        
        model.addAttribute("paging", paging1);
        model.addAttribute("categorylist", category);
        model.addAttribute("budId", budId);
     
        return "accounting/budgetdetail/budgetDetailList";
    }
    


    @GetMapping("/accounting/budgetdetail/BudgetDetailInsertForm.do")
    public String budgetDetailInsertForm(
    		@ModelAttribute("budget") budgetDetailVO budget,
    		@RequestParam(name = "budId") String budId,
    		@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
    		@ModelAttribute("simpleCondition") SimpleCondition simpleCondition,
    		Model model
    		) {
    	PaginationInfo<AccountCategoryVO> paging2 = new PaginationInfo<>(100,1);
    	paging2.setCurrentPage(currentPage);
        paging2.setSimpleCondition(simpleCondition);
    	List<AccountCategoryVO> category = accountCategoryService.getAllAccountCategoriesList(paging2);
        model.addAttribute("categorylist", category);
        model.addAttribute("budget", budget);
        model.addAttribute("budId", budId);
        
        return "accounting/budgetdetail/budgetDetailForm";
    } 

    @Transactional 
    @PostMapping("/accounting/budgetdetail/BudgetDetailInsertForm.do")
    public String budgetDetailInsert(
        @Validated(InsertGroup.class) @ModelAttribute("budget") budgetDetailVO budgetDetailVO,
        BindingResult result,
        @RequestParam(name = "budId") String budId,
        @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
        @ModelAttribute("simpleCondition") SimpleCondition simpleCondition,
        Model model) {
    	
        String viewName = null;
        PaginationInfo<AccountCategoryVO> paging2 = new PaginationInfo<>(100, 1);
        paging2.setCurrentPage(currentPage);
        paging2.setSimpleCondition(simpleCondition);
        List<AccountCategoryVO> category = accountCategoryService.getAllAccountCategoriesList(paging2);

        long totalUseAmt = 0; // 누적값을 저장할 변수
        long totalAmt = budgetService.getBudget(budId).getBudAmt();

        try {
            if (!result.hasErrors()) {
                boolean success = budgetDetailService.insertBudgetDetail(budgetDetailVO);
                if (success) {
                    for (budgetDetailVO budget : budgetDetailService.getBudgetDetailById(budId)) {
                        long remainingAmt = budget.getBdAmt();
                        totalUseAmt += remainingAmt; // 누적값
                    }

                    long change = totalAmt - totalUseAmt; 
                    model.addAttribute("change", change); 
                    if (change <= 0) {
                        throw new RuntimeException("예산 한도 초과 예외"); // 예외 발생
                    } else {
                        viewName = "redirect:/accounting/budget/budgetDetailList.do?budId=" + budId;
                    }
                } else {
                    model.addAttribute("message", "새로운 예산 등록 중 문제가 발생하였습니다.");
                    viewName = "accounting/budgetdetail/budgetDetailForm";
                }
            } else {
            	   viewName = "accounting/budgetdetail/budgetDetailForm";
            }
            
        } catch (DataIntegrityViolationException ex) {
            model.addAttribute("message", "항목이 중복되었습니다.");
            model.addAttribute("categorylist", category);
            viewName = "accounting/budgetdetail/budgetDetailForm";
            return viewName; 
            
        } catch (RuntimeException e) {
            model.addAttribute("message", "예산 한도 초과했습니다.");
            model.addAttribute("categorylist", category);
            budgetDetailService.deleteBudgetDetail(budgetDetailVO.getBdId());
            viewName = "accounting/budgetdetail/budgetDetailForm";           
            return viewName; 
            
        } 
        model.addAttribute("categorylist", category);
        return viewName;
    }
 
    
    @GetMapping("/accounting/budgetdetail/BudgetDetailUpdateForm.do")
    public String budgetUpdateForm(
    		@Validated(UpdateGroup.class) @ModelAttribute("budget") BudgetVO budget,
    		Errors errors,
    		@RequestParam(name = "bdId") String bdId,
    		Model model	
    		) {
//        model.addAttribute("budgetDetail", budgetDetailService.getBudgetDetail(bdId));
        return "accounting/budgetdetail/budgetDetailUpdateForm";
    }
    @Transactional
    @PostMapping("/accounting/budgetdetail/BudgetDetailUpdateForm.do")
    public String budgetUpdate(
    		@ModelAttribute("budgetDetail") budgetDetailVO budgetDetail,
            @RequestParam(name = "budId") String budId,
            BindingResult errors,
            Model model
    ) {
        if (errors.hasErrors()) {
            model.addAttribute("message", "hasErrors 오류 발생.");
            return "accounting/budgetdetail/budgetDetailUpdateForm";
        }

        boolean success = budgetDetailService.updateBudgetDetail(budgetDetail);
        if (success) {
        	 model.addAttribute("budget", budgetService.getBudget(budId));
            return "redirect:/accounting/budget/budgetDetailList.do?budId=" + budId;
        } else {
            model.addAttribute("message", "예산 수정 중 문제가 발생하였습니다.");
            
            return "accounting/budgetdetail/budgetDetailUpdateForm";
        }
    }


    
    @GetMapping("/accounting/budgetdetail/BudgetDetailDeleteForm.do")
    public String budgetDeleteForm(
    		@Validated(DeleteGroup.class)@ModelAttribute("budget") BudgetVO budget,
    		Errors errors,
    		@RequestParam(name = "bdId") String bdId,
    		@RequestParam(name = "budId") String budId,
    		Model model	
    		) {
    	if(!errors.hasErrors()) {
        budgetDetailService.deleteBudgetDetail(bdId);
    	}
        return "redirect:/accounting/budget/budgetDetailList.do?budId=" + budget.getBudId();
    }
    
    
}
