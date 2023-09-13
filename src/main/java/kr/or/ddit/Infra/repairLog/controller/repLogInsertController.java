package kr.or.ddit.Infra.repairLog.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.format.datetime.standard.DateTimeFormatterRegistrar;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.Infra.repairLog.service.repLogService;
import kr.or.ddit.Infra.vo.repairLogVO;
import kr.or.ddit.common.util.ExcelRequestManager;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;

@Controller
public class repLogInsertController {

	@Inject
	private repLogService service;

	@RequestMapping(value = "/infra/repLogInsert.do")
	public String listApplicant(HttpServletRequest request, Model model) throws Exception {
		return "infra/repLog/excelinsertTest";
	}

	@RequestMapping(value = "/infra/repLogByexcel", method = RequestMethod.POST)
	public String repLogByexcelAction(@ModelAttribute("repLogVO") repairLogVO repLogVO,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			final MultipartHttpServletRequest multiRequest, ModelMap model, Authentication authentication)
			throws Exception {

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();

		Map<String, Object> resMap = new HashMap<String, Object>();
		int cnt = 0;
		try {

			ExcelRequestManager em = new ExcelRequestManager();
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			List<HashMap<String, String>> apply = null;

			apply = em.parseExcelSpringMultiPart(files, "applicant", 0, "", "reserve");
			
			for (int i = 0; i < apply.size(); i++) {

				LocalDate date = LocalDate.parse(apply.get(i).get("cell_0"), DateTimeFormatter.ISO_DATE);
				repLogVO.setRlDt(date); // 점검일자
				repLogVO.setRlSection(apply.get(i).get("cell_3")); // 점검구역 코드
				repLogVO.setRlContent(apply.get(i).get("cell_2")); // 점검내용
				repLogVO.setRlFc(apply.get(i).get("cell_4")); // 점검 시설 코드
				repLogVO.setRlIc(apply.get(i).get("cell_5")); // 점검주기
				repLogVO.setRlIt(apply.get(i).get("cell_1")); // 점검 제목

				repLogVO.setRlWriter(empVO.getEmpNo());

				repLogVO.setRlIr("WT");
				repLogVO.setRlIs("WT");
				service.createRepLog(repLogVO);
				cnt++;
			}
			resMap.put("res", "ok");
			resMap.put("msg", "일정 " + cnt + "개 등록");
		} catch (Exception e) {
			if (cnt > 0 ) {
				resMap.put("res", "ok");
				resMap.put("msg", "일정 " + cnt + "개 등록");
			} else {
				resMap.put("res", "error");
				resMap.put("msg", "등록 실패");
			}
		}

		redirectAttributes.addFlashAttribute("resMap", resMap);
		return "redirect:/infra/repLogList.do";
	}

}
