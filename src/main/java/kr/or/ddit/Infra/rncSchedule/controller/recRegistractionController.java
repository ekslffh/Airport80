package kr.or.ddit.Infra.rncSchedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.Infra.rncSchedule.service.rncScheduleService;
import kr.or.ddit.Infra.stock.dao.OthersDAO;
import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.Infra.vo.rncScheduleVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/infra/recRegistraction.do")
public class recRegistractionController {

	private final rncScheduleService service;
	
	private final OthersDAO othersDAO;
	
	@ModelAttribute("zoneList")
	public List<ZoneVO> zoneList(){
		return othersDAO.selectAllZoneList();
	}
	
	@ModelAttribute("commonList")
	public List<CommonCodeVO> commonList(){
		return othersDAO.selectRncList();
	}
	
	@ModelAttribute("schedule")
	public rncScheduleVO rncSch() {
		return new rncScheduleVO();
	}
	
	
//	@ModelAttribute("rncReq")
//	public List<rncReqVO> rncReq(){
//		return ;
//	}
//	@modelAttribute("stock")
//	public List<stockVO> stock(){
//		return ;
//	}

	@GetMapping
	public String getInsertForm() {
		return "infra/rncSchedule/recScheduleForm";
	}
	
	@PostMapping
	public String insertSchedule(
			@Validated(InsertGroup.class) @ModelAttribute("schedule") rncScheduleVO schedule
			, Errors errors
			, Model model
			) {
		String logicalViewName= null;
		if(!errors.hasErrors()) {
			
			boolean result = service.createRecSchedule(schedule);
			String rrId = schedule.getRrId();
			String rrRsId = schedule.getRsId();
			System.out.println("schedule"+schedule);
			System.out.println(rrRsId);
					
			rncReqVO rncReq = new rncReqVO();
			rncReq.setRrId(rrId);
			rncReq.setRrRsId(rrRsId);
			
			if(result) {
				boolean sttsUpdate = service.sttsUpdate(rncReq);
				if(sttsUpdate) {
					logicalViewName="redirect:/infra/recScheduleList.do";
				}
			}else {
				model.addAttribute("message","서버오류, 잠시 뒤 다시 시도하세요.");
				logicalViewName = "infra/rncSchedule/recScheduleForm";
			}
		}else {
			System.out.println(errors.getAllErrors());
			logicalViewName="infra/rncSchedule/recScheduleForm";
		}
		
		return logicalViewName;
		
	}

}
