package kr.or.ddit.Infra.rncSchedule.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.apache.tiles.request.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.Infra.rncReq.service.rncService;
import kr.or.ddit.Infra.rncSchedule.service.rncScheduleService;
import kr.or.ddit.Infra.vo.repairLogVO;
import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.Infra.vo.rncScheduleVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ScheduleRetrieveController {

	private final rncScheduleService service;

	private final rncService rncService;

	@ModelAttribute("Schedule")
	public rncScheduleVO rncSchedule() {
		return new rncScheduleVO();
	}

	@ModelAttribute("rncReq")
	public rncReqVO rncReq() {
		return new rncReqVO();
	}

	@GetMapping("/infra/rncScheduleList.do")
	public String rncScheduleList(@ModelAttribute("simpleCondition") SimpleCondition simpleCondition,
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage, Model model) {

		PaginationInfo<rncScheduleVO> paging = new PaginationInfo<>(6, 5); // 스크린사이즈 블록사이즈 지정 가능
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);

		String logicalView = null;
		List<rncScheduleVO> schList = service.retrieveScheduleList(paging);
		paging.setDataList(schList);

		// 현재 날짜와 시간 얻기
		LocalDateTime currentDate = LocalDateTime.now();
		long daysPassed = 0;
		LocalDateTime registrationDate = null;
		rncReqVO rncReq = new rncReqVO();
		LocalDateTime rsStartTs = null;
		LocalDateTime endDate = null;
		ServiceResult update = null;
		String rsId = null;
		String rrRsId = null;
		long totalDaysPassed = 0;

		// 각 일정에 대한 처리
		for (rncScheduleVO schedule : schList) {
			schedule.getRsId();

			registrationDate = schedule.getRsStartTs();
			endDate = schedule.getRsEndTs();
			currentDate = LocalDateTime.now(); // 현재 날짜 다시 설정
			Duration duration = Duration.between(endDate, currentDate);
			daysPassed = duration.toDays() + 1;
			totalDaysPassed = duration.toDays() + 1;
			rsStartTs = schedule.getRsStartTs();

			if (daysPassed < 0) {
				daysPassed = 0;
			}

			System.out.println("일정 ID: " + schedule.getRsId() + ", 일정 등록일로부터 지난 일 수: " + daysPassed + "일, "
					+ "접수일로부터 총 소요일:" + totalDaysPassed);
			schedule.setDaysPassed(daysPassed);
			schedule.setTotalDaysPassed(totalDaysPassed);

			// dl 리스트에서 schedule과 같은 객체 찾기
			rncScheduleVO foundItem = null;

			List<rncScheduleVO> dl = service.retrieveScheduleDlNP();

			for (rncScheduleVO item : dl) {
				if (item.equals(schedule)) {
					foundItem = item;
					break; // 일치하는 객체를 찾으면 루프를 종료합니다.
				}
			}

			// 해당하는 객체 찾은 경우
			if (foundItem != null) {
				foundItem.setDaysPassed(daysPassed);
			}

			rsId = schedule.getRsId();
			System.out.println(schedule);
			System.out.println(schedule.getDaysPassed());
			System.out.println("currentDate.isBefore(endDate): " + currentDate.isBefore(endDate));

			// 현재 날짜가 시작일보다 이전인 경우 'WT'로 설정
			// 현재 날짜가 시작일을 경과한 경우 'PG'로 설정
			// 현재 날짜가 종료일을 경과한 경우 'DL'로 설정

				
			if (currentDate.isBefore(rsStartTs)) {
				rncReq.setRrStts("WT");
				rncReq.setRrRsId(rsId);
				update = rncService.updateSttsWT(rsId);
			} else if (currentDate.isBefore(rsStartTs)) {
				rncReq.setRrStts("PG");
				rncReq.setRrRsId(rsId);
				update = rncService.updateSttsPG(rsId);
			} else if (currentDate.isAfter(endDate)) {
				rncReq.setRrStts("DL");
				rncReq.setRrRsId(rsId);
				update = rncService.updateSttsDL(rsId);
			}

			}
		
		logicalView = "infra/rncSchedule/rncScheduleList";

//		model.addAttribute("schList", schList);
		model.addAttribute("paging", paging);
		model.addAttribute("currentDate", currentDate);
		model.addAttribute("daysPassed", daysPassed);

//		}
		return logicalView;
	}

	@GetMapping("/infra/recScheduleList.do")
	public String recScheduleList(@ModelAttribute("simpleCondition") SimpleCondition simpleCondition,
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
			 Model model) {

		PaginationInfo<rncScheduleVO> paging = new PaginationInfo<>(6, 5); // 스크린사이즈 블록사이즈 지정 가능
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);

		List<rncScheduleVO> schList = null;

		String logicalView = null;
		schList = service.retrieveRecScheduleList(paging);
		paging.setDataList(schList);

		String rsType = null;
		for (rncScheduleVO schedule : schList) {
			rsType = schedule.getRsType();
		}
		
		// 현재 날짜와 시간 얻기
		LocalDateTime currentDate = LocalDateTime.now();
		long daysPassed = 0;
		LocalDateTime registrationDate = null;
		rncReqVO rncReq = new rncReqVO();
		LocalDateTime rsStartTs = null;
		LocalDateTime endDate = null;
		ServiceResult update = null;
		String rsId = null;
		String rrRsId = null;

		// 각 일정에 대한 처리
		for (rncScheduleVO schedule : schList) {
			schedule.getRsId();

			registrationDate = schedule.getRsStartTs();
			endDate = schedule.getRsEndTs();
			currentDate = LocalDateTime.now(); // 현재 날짜 다시 설정
			rsStartTs = schedule.getRsStartTs();
			if (daysPassed < 0) {
				daysPassed = 0;
			}

			rsId = schedule.getRsId();

			// 현재 날짜가 시작일보다 이전인 경우 'WT'로 설정
			// 현재 날짜가 시작일을 경과한 경우 'PG'로 설정
			// 현재 날짜가 종료일을 경과한 경우 'DL'로 설정

			if (currentDate.isBefore(rsStartTs)) {
				rncReq.setRrStts("WT");
				rncReq.setRrRsId(rsId);
				update = rncService.CupdateSttsWT(rsId);
			} else if (currentDate.isAfter(rsStartTs)) {
				rncReq.setRrStts("PG");
				rncReq.setRrRsId(rsId);
				update = rncService.updateSttsPG(rsId);
			}
		}

//		model.addAttribute("schList", schList);
		model.addAttribute("paging", paging);
		model.addAttribute("currentDate", currentDate);
//		model.addAttribute("daysPassed", daysPassed);

		return "infra/rncSchedule/recScheduleList2";
	}

}
