package kr.or.ddit.Infra.supplier.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.Infra.stock.dao.OthersDAO;
import kr.or.ddit.Infra.supplier.service.SupplierService;
import kr.or.ddit.Infra.vo.supplierVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/infra/ocUpdate.do")
public class OrderCompanyModifyController {

	private final SupplierService service;
	private final OthersDAO othersDAO;
	
	@ModelAttribute("commonCode")
	public List<CommonCodeVO> commonCode(){
		return othersDAO.selectCommonList();
	}
	
	@ModelAttribute("supplier")
	public supplierVO supplier(){
		return new supplierVO();
	}
	
	@GetMapping
	public String getHandler(@RequestParam String what, Model model) {
		supplierVO supplier = service.selectoneRetrieve(what);
		model.addAttribute("supplier", supplier);
		return "infra/orderCompany/orderCompanyUpdate";
	}
	
	@PostMapping
	public String postHandler(
		@Validated(UpdateGroup.class) @ModelAttribute("supplier") supplierVO supplier
		, BindingResult errors
		, Model model
	) {
		String logicalViewName= null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifySupplier(supplier);
			if(ServiceResult.OK == result) {
				logicalViewName = "redirect:/infra/orderCompanyView.do?what="+supplier.getSprId();
			}else {
				model.addAttribute("message", "서버오류, 잠시 뒤 다시 시도하세요.");
				logicalViewName = "infra/orderCompany/orderCompanyView";
			}
		}else {
			logicalViewName = "infra/orderCompany/orderCompanyView";
		}
		return logicalViewName;
	}
	
}
