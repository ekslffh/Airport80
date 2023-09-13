package kr.or.ddit.accounting.accountcategory.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accounting.accountcategory.service.AccountCategoryService;
import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/accounting")
@RequiredArgsConstructor
public class AccountCategoryController {

 
    private final AccountCategoryService accountCategoryService;

	@RequestMapping("/accountcategory/AcccList.do")
	public String AcccList(
			@RequestParam(name="page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
	) {
		PaginationInfo<AccountCategoryVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		List<AccountCategoryVO> accountCategories = accountCategoryService.getAllAccountCategoriesList(paging);
		paging.setDataList(accountCategories);
		
		model.addAttribute("paging", paging);
		return "accounting/accountcategory/accountcategorylist";
	}

	@GetMapping("/accountcategory/AcccInsertForm.do")
	public String AcccInsert(Model model) {
	    model.addAttribute("accountcategory", new AccountCategoryVO());
	    return "accounting/accountcategory/accountcategoryForm";
	}


@PostMapping("/accountcategory/AcccInsertForm.do")
public String AcccInserts(
    @Validated(InsertGroup.class) @ModelAttribute("accountcategory") AccountCategoryVO accountcategory,
    BindingResult errors,
    Model model
) {
    String viewName = null;
    if (!errors.hasErrors()) {
        boolean success = accountCategoryService.insertAccountCategory(accountcategory);
        if (success) {
            try {
                String message = URLEncoder.encode("계정과목 등록 성공", "UTF-8");
                viewName = "redirect:AcccList.do?message=" + message;
            } catch (UnsupportedEncodingException e) {
                // UTF-8 인코딩을 지원하지 않을 때 처리할 예외 핸들링 코드
                e.printStackTrace();
            }
        } else {
            model.addAttribute("message", "새글 작성중 문제 발생");
            viewName = "accounting/accountcategory/accountcategoryForm";
        }
    } else {
        viewName = "accounting/accountcategory/accountcategoryForm";
    }

    return viewName;
}

	
	@RequestMapping("/accountcategory/AcccView.do")
	public String boardView(
		@RequestParam("what") String acaId
		, Model model
	) {
		AccountCategoryVO accountcategory = accountCategoryService.getAccountCategoryById(acaId);
		model.addAttribute("accountcategory", accountcategory);
		return"accounting/accountcategory/accountcategoryView";
	}
	
    
    @PostMapping("/accountcategory/AcccUpdate.do")
    public String updateAccountCategory(AccountCategoryVO accountCategory) {
        accountCategoryService.updateAccountCategory(accountCategory);
        return "redirect:AcccList.do";
    }


    
    @RequestMapping("/accountcategory/AcccDelete.do")
    public String deleteAccountCategory(
            @Validated(DeleteGroup.class) @ModelAttribute("accountcategory") AccountCategoryVO accountcategory,
            BindingResult errors,
            Model model) {
        String viewName = null;
        try {
            if (!errors.hasErrors()) { // vo 에서 설정한 오류 잡기
                int success = accountCategoryService.deleteAccountCategory(accountcategory.getAcaId());
                if (success > 0) { // 성공
                    viewName = "redirect:AcccList.do";
                } else {   //실패
                    model.addAttribute("message", "삭제처리 중 오류발생");
                    viewName = "accounting/accountcategory/accountcategoryForm";
                }
            } else { // vo 에서 설정한 오류 있으면
                viewName = "accounting/accountcategory/accountcategoryForm";
            }
        } catch (DataIntegrityViolationException ex) { // 삭제일때 cascade 하면 무결성 깨질 수 있어서 불가처리
            model.addAttribute("message", "이미 책정된 과목은 삭제할 수 없습니다.");
            viewName = "redirect:/accounting/accountcategory/AcccList.do";
        }

        return viewName;
    }
    
    @RequestMapping("/accountcategory/AcccDeleteMultiple.do")
    @ResponseBody
    public ResponseEntity<String> deleteMultipleAccountCategories(@RequestBody List<String> accountIds) {
        try {
            if (accountIds.isEmpty()) {
                return new ResponseEntity<>("NoData", HttpStatus.NOT_FOUND);
            }

            int successCount = accountCategoryService.deleteMultipleAccountCategories(accountIds);
            if (successCount > 0) {
                return new ResponseEntity<>("Success", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("NoData", HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            String errorMessage = "에러: " + e.getMessage();
            return new ResponseEntity<>(errorMessage, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }



}
