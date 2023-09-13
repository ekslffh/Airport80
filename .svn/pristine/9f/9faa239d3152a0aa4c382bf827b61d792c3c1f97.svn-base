package kr.or.ddit.hr.empBrd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.hr.empBrd.service.EmpbrdService;
import kr.or.ddit.hr.vo.EmpbrdVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/hr/empbrd/ajax/empbrdInsert.do")
public class EmpbrdInsertController {

    private final EmpbrdService service;

    @ModelAttribute("empbrd")
    public EmpbrdVO empbrd() {
        return new EmpbrdVO();
    }

    @GetMapping
    public String boardForm() {
        return "hr/empbrd/ajax/empbrdForm";
    }

    @PostMapping
    public String empbrdInsert(
            @Validated @ModelAttribute("empbrd") EmpbrdVO empbrd,
            BindingResult errors,
            Model model
    ) {
        String viewName = null;
        if (empbrd.getEbPub() == null) {
            empbrd.setEbPub("N");
        }

        if (!errors.hasErrors()) {
            boolean success = service.createEmpbrd(empbrd);
            if (success) {
                viewName = "redirect:/hr/empbrd/empbrdList.do";
            } else {
                model.addAttribute("message", "새글 작성 중 문제 발생");
                viewName = "hr/empbrd/ajax/empbrdForm";
            }
        } else {
            viewName = "hr/empbrd/ajax/empbrdForm";
        }

        return viewName;
    }
}