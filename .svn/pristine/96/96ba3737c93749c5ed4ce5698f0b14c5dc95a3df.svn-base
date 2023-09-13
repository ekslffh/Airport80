package kr.or.ddit.Infra.repairRecord.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.Infra.repairRecord.service.RRecordService;
import kr.or.ddit.Infra.vo.repairRecordVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class RetrieveRepairRecordController {

	@Inject
	private RRecordService service;
	
	@ModelAttribute("record")
	public repairRecordVO recordList(){
		return new repairRecordVO();
	}
	
	@GetMapping("/infra/repairRecordOne.do")
	public String repairRecord(
			@RequestParam (name="who", required= true)String rsId,
			Model model	
			) {

		repairRecordVO record = service.retrieveRecordOne(rsId);
		model.addAttribute("record", record);
		return "infra/repairRecord/ntiles/repairRecordView";
	}
	
}
