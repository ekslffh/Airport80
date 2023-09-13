package kr.or.ddit.accounting.salary.controller;


import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.accounting.salary.service.SalaryService;
import kr.or.ddit.accounting.salary.vo.SalaryVO;

import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.hr.attendance.service.AttendanceService;
import kr.or.ddit.validate.UpdateGroup;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SalaryController {

    private final SalaryService salaryService;
    private final AttendanceService attService; // 한달초과근무 구하기 위한 서비스
    /**
     * 급여정보
     * @param model
     * @param authentication
     * @return
     */
    @RequestMapping("/accounting/salary/salaryList.do")
    public String getTotalList(
            Model model,
            Authentication authentication
    		) {	
    	
    	AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
		String loginEmpNo = empVO.getEmpNo();
    	
    	List<SalaryVO> salList = salaryService.getAllSalList();
    	model.addAttribute("salList",salList);
    	model.addAttribute("loginEmpNo",loginEmpNo);
		return "accounting/salary/salaryList";
    }
    /**
     * 직원별 급여 파라미터 유뮤에 따라 다른 동작
     * @param empNo
     * @param model
     * @param authentication
     * @return
     */
    @RequestMapping("/accounting/salary/salaryEmpListSal.do")
    public String getTotalList(
            @RequestParam(required = false) String empNo,
            Model model
    ) {
        if (empNo == null) { 
            List<SalaryVO> salList = salaryService.getAllSalList();
            model.addAttribute("salList", salList);
            return "accounting/salary/salaryList";

        } else {
            List<SalaryVO> empSalList = salaryService.getEmpSalList(empNo);
            model.addAttribute("empSalList", empSalList);
            return "accounting/salary/ex/salaryEmpListEx";
        }
    }
    
    /**
     * 직원정보
     * @param model
     * @param authentication
     * @return
     */
    @GetMapping("/accounting/salary/salaryEmpList.do")
    public String salaryEmpList(
            Model model,
            Authentication authentication
    ) {

        AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
        EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
        String loginEmpNo = empVO.getEmpNo();

        List<EmployeeVO> empList = salaryService.getAllEmpList();
        List<EmployeeVO> filteredEmpList = new ArrayList<>(); // 새로운 리스트 생성

        for (EmployeeVO emp : empList) {
            if (emp.getEmpResignDt() == null) { // 퇴직일이 null 인 경우에만 추가 // 재직중인 직원
                filteredEmpList.add(emp);
            }
        }

        model.addAttribute("empList", filteredEmpList);
        model.addAttribute("loginEmpNo", loginEmpNo);
        return "accounting/salary/salaryEmpList";
    }
    
    /**
     * 상세보기
     * @param salId
     * @param model
     * @return
     */
    @RequestMapping("/accounting/salary/salaryDetail.do")
    public String getDetail(
    		@RequestParam String salId,
            Model model
    		) {	
    	SalaryVO salaryVO = salaryService.getSalary(salId);
  
    	int sucess = salaryService.updateIns(salaryVO);
    	if(sucess>0) {
    	
    		model.addAttribute("salary",salaryVO);
    		return "accounting/salary/ex/salaryDetailEx";
    	}else {
    		model.addAttribute("message","상세조회실패");
    		return "redirect:/accounting/salary/salaryDetail.do?salId="+salaryVO.getSalId();
    	}
    }

    /**
     * 엑셀
     * @param response
     * @param salId
     * @param model
     * @throws IOException
     */
    @RequestMapping("/accounting/salary/downloadSalaryExcel")
    public void downloadSalaryExcel(
            HttpServletResponse response,
            @RequestParam String salId,
            Model model
    ) throws IOException {
        SalaryVO salaryVO = salaryService.getSalary(salId);
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("급여명세서");

        CellStyle centerAlignmentStyle = workbook.createCellStyle();
        centerAlignmentStyle.setAlignment(HorizontalAlignment.CENTER); 		//가로 중앙
        centerAlignmentStyle.setVerticalAlignment(VerticalAlignment.CENTER); // 세로 중앙
        
        // Create header row
        Row headerRow = sheet.createRow(0);
        String[] headerTitles = {
            "급여번호", "등록 일자", "사원 번호", "입사 일자", "사원 이름", "부서 이름", "직급",
            "급여 관리자 이름", "급여 지급 상태", "급여 지급 일자", "급여 기본", "급여 보너스",
            "급여 추가", "급여 초과근무", "급여 총액", "급여 실지급액", "급여 메모",
            "급여 계좌 번호", "급여 계좌 은행", "건강보험", "국민연금", "고용보험",
            "산재보험", "회사부담보험료"
        };
        for (int i = 0; i < headerTitles.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headerTitles[i]);
            
            // Apply center alignment
            cell.setCellStyle(centerAlignmentStyle);
            
            // Apply background color
            CellStyle headerStyle = workbook.createCellStyle();
            headerStyle.cloneStyleFrom(centerAlignmentStyle); // Inherit alignment properties
            headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex()); // Set background color
            headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND); // Set fill pattern
            cell.setCellStyle(headerStyle);
            
            sheet.setColumnWidth(i, sheet.getColumnWidth(i) * 2); // Double the width
        }
        headerRow.setHeightInPoints(headerRow.getHeightInPoints() * 2); // Double the height

        // Populate data row
        Row dataRow = sheet.createRow(1);
        Cell[] dataCells = new Cell[headerTitles.length];
        for (int i = 0; i < dataCells.length; i++) {
            dataCells[i] = dataRow.createCell(i);
            dataCells[i].setCellStyle(centerAlignmentStyle);
        }
        dataCells[0].setCellValue(salaryVO.getSalId());
        dataCells[1].setCellValue(salaryVO.getSalCrtTs());
        dataCells[2].setCellValue(salaryVO.getEmp().getEmpNo());
        dataCells[3].setCellValue(salaryVO.getEmp().getEmpJoinDt().toString());
        dataCells[4].setCellValue(salaryVO.getEmp().getEmpNm());
        dataCells[5].setCellValue(salaryVO.getDeptNm());
        dataCells[6].setCellValue(salaryVO.getEmp().getEmpRoleNm());
        dataCells[7].setCellValue(salaryVO.getSalEmpNm());
        dataCells[8].setCellValue(salaryVO.getSalPayDt() == null ? "미지급" : "지급");
        dataCells[9].setCellValue(salaryVO.getSalPayDt() != null ? salaryVO.getSalPayDt().toString() : "미지급");
        dataCells[10].setCellValue(salaryVO.getSalBasic());
        dataCells[11].setCellValue(salaryVO.getSalBns());
        dataCells[12].setCellValue(salaryVO.getSalExtr());
        dataCells[13].setCellValue(salaryVO.getSalOvertime());
        dataCells[14].setCellValue(salaryVO.getSalTotal());
        dataCells[15].setCellValue(salaryVO.getSalTotal());
        dataCells[16].setCellValue(salaryVO.getSalMemo());
        dataCells[17].setCellValue(salaryVO.getSalAccNum());
        dataCells[18].setCellValue(salaryVO.getSalAccBank());
        dataCells[19].setCellValue(salaryVO.getSalHIns());
        dataCells[20].setCellValue(salaryVO.getSalNPen());
        dataCells[21].setCellValue(salaryVO.getSalEmpIns());
        dataCells[22].setCellValue(salaryVO.getSalWorkIns());
        dataCells[23].setCellValue(salaryVO.getSalInsCompany());
        dataRow.setHeightInPoints(dataRow.getHeightInPoints() * 2); // 높이를 두 배로

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        // 파일 이름을 지정할 때 사원 이름과 등록 일자를 조합하여 생성
        String encodedFileName = URLEncoder.encode(
            salaryVO.getEmp().getEmpNm() + "_" + salaryVO.getSalCrtTs().substring(0, 7) + "월_급여명세서.xlsx",
            "UTF-8"
        );
        // 파일 이름에 있는 공백을 언더스코어로 치환
        encodedFileName = encodedFileName.replaceAll(" ", "_");
        response.setHeader("Content-Disposition", "attachment; filename=" + encodedFileName);

        workbook.write(response.getOutputStream());
        workbook.close();
    }
    
    /**
     * 상태업데이트
     * @param salId
     * @param model
     * @return
     */
    @GetMapping("/accounting/salary/salaryStatusUpdate.do")
    public String salaryStatusUpdate(
    		@RequestParam(required = false) String salId,
            Model model
    		) {	
    	   if( salId==null ||salId.equals(null)) {
    	    List<SalaryVO> salaryList = salaryService.getAllSalList();
    		model.addAttribute("salaryList",salaryList);
    		return "accounting/salary/ex/salaryStatusUpdate";
    		
    	   }else {
    		 SalaryVO salaryVO = salaryService.getSalary(salId);
       		model.addAttribute("salaryVO",salaryVO);
       		return "accounting/salary/ex/salaryStatusUpdate";
    	   }
    }
    
    
    @PostMapping("/accounting/salary/salaryStatusUpdate.do")
    public String salaryStatusUpdatePost(
			@Validated(UpdateGroup.class) @ModelAttribute("salaryVO") SalaryVO salaryVO,
            Errors errors,
            Model model
    		) {	
    	int sucess = salaryService.updateSal(salaryVO);
    	
    	if(errors.hasErrors()) {
    		model.addAttribute("message","업데이트 실패");
    		System.out.println("에러"+errors.getAllErrors());
    		return "redirect:/accounting/salary/salaryList.do";
    	}
    	
    	if(sucess>0) {
    		model.addAttribute("message","업데이트 성공");
    		model.addAttribute("salId",salaryVO.getSalId());
    	}else {
    		model.addAttribute("message","업데이트 실패");
    	}
    	return "redirect:/accounting/salary/salaryList.do";
    }
    
    @PostMapping("/accounting/salary/salaryStatusUpdateAll.do")
    public String salaryStatusUpdateAllPost(
            @RequestParam("salMemo") String salMemo,
            Model model
    ) {
        List<SalaryVO> salaryList = salaryService.getAllSalList();
        int successCount = 0;
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // 타임스탬프 형식에 맞게 포맷팅 패턴 설정

        // 지급 생성일이 당월인 직원
        List<SalaryVO> currentMonthSalaries = salaryList.stream()
            .filter(salary -> {
                String salaryTimestampStr = salary.getSalCrtTs(); // SalaryVO에 타임스탬프 필드명에 맞게 수정해야 합니다.
                LocalDateTime salaryTimestamp = LocalDateTime.parse(salaryTimestampStr, formatter);       
                LocalDateTime currentDateTime = LocalDateTime.now();
                Month currentMonth = currentDateTime.getMonth();
                
                return salaryTimestamp.getMonth() == currentMonth;
            })
            .collect(Collectors.toList());
        
        

        for (SalaryVO salary : currentMonthSalaries) {
            salary.setSalMemo(salMemo);
            int success = salaryService.updateSal(salary);
            if (success > 0) {
                successCount++;
            }
        }

        if (successCount >= 1) {
            model.addAttribute("message", "전체 업데이트 성공");
        } else {
            model.addAttribute("message", "전체 업데이트 실패");
        }

        return "redirect:/accounting/salary/salaryList.do";
    }

    
    
    /**
     * 인서트
     * @param model
     * @return
     */
   
    @GetMapping("/accounting/salary/salaryInsert.do")
    public String showCalculateSalaryForm() {
        return "accounting/salary/ex/salaryInsert"; // 계산 폼을 보여주는 JSP 페이지로 이동
    }
    @PostMapping("/accounting/salary/salaryInsert.do")
    public String salaryInsert(
        Model model,
        Authentication authentication,
        @RequestParam String extrString,
        @RequestParam String basicBaseString,
        @RequestParam String BnsString
    ) {
        AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
        EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
        String loginEmpNo = empVO.getEmpNo();
        String loginEmpNm = empVO.getEmpNm();

        extrString = extrString.replace(",", ""); // 반점 제거
        int extr = Integer.parseInt(extrString); // 정수로 변환

        basicBaseString = basicBaseString.replace(",", ""); // 반점 제거
        int basicBase = Integer.parseInt(basicBaseString); // 정수로 변환

        BnsString = BnsString.replace(",", ""); // 
        int Bns = Integer.parseInt(BnsString); // 정수로 변환

        double hInsPercent = 3.545;    // 건강보험 퍼센트
        double nPenPercent = 4.5;    // 국민연금 퍼센트
        double empInsPercent = 0.9;  // 고용보험 퍼센트
        double workInsPercent = 1.0; // 산재보험 퍼센트

        List<EmployeeVO> empVOList = salaryService.getAllEmpList();

        // 퇴사일이 없는 직원. 재직중인 직원만
        List<EmployeeVO> employees = empVOList.stream()
            .filter(emp -> emp.getEmpResignDt() == null)
            .collect(Collectors.toList());

        // 현재 월과 연도를 가져옵니다.
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
        String currentMonthYear = currentDate.format(formatter);

        for (EmployeeVO emp : employees) {
            String empNo = emp.getEmpNo();
            List<SalaryVO> empSalaryList = salaryService.selectEmp(empNo); // 직원당 급여수령 리스트
            boolean alreadyCalculated = false; // 이미 현재 월에 급여가 산정되었는지 확인하는 플래그

            for (SalaryVO empSalary : empSalaryList) {
                String crtDt = empSalary.getSalCrtTs(); // 급여 산정일
                System.out.println("SalaryController 396줄 시스아웃" + crtDt);

                if (crtDt.startsWith(currentMonthYear)) {
                    alreadyCalculated = true;
                    break; // 이미 산정된 경우 플래그를 설정하고 루프를 종료합니다.
                }
            }

            if (!alreadyCalculated) {
                double mul = 0;
                String role = emp.getEmpRoleNm();
                switch (role) {
                    case "인턴":
                        mul = 0.9;
                        break;
                    case "사원":
                        mul = 1.0;
                        break;
                    case "주임":
                    case "대리":
                        mul = 1.2;
                        break;
                    case "과장":
                        mul = 2;
                        break;
                    case "차장":
                        mul = 3;
                        break;
                    case "부장":
                        mul = 4;
                        break;
                    case "부사장":
                        mul = 7;
                        break;
                    case "사장":
                        mul = 13;
                        break;
                    default:
                        mul = 1.0;
                        break;
                }

                int basic = (int) (basicBase * mul);
                int basicTimePay = basic/209;
                long OverTime = 209;
                try {
                    Long workMonthCount = attService.selectCountWorkMonth(emp.getEmpNo());
                    if (workMonthCount != null) {
                        OverTime = workMonthCount%8; 
                    }
                } catch (Exception e) {
                	OverTime = 0;                  
                }
                // OverTime이 0 미만인 경우 0으로 설정  40시간 기준 월간근로시간 - 직원당 월근무시간 
                OverTime=(long) (OverTime*basicTimePay*1.5);
              
                long total = basic + extr + Bns + OverTime;

                // 4대보험 직원이 반절, 회사가 반절 부담
                int hIns = (int) (total * (hInsPercent / 100));
                int nPen = (int) (total * (nPenPercent / 100));
                int empIns = (int) (total * (empInsPercent / 100));
                int workIns = (int) (total * (workInsPercent / 100));

                SalaryVO salary = new SalaryVO();
                salary.setSalHIns(hIns);  // 건강
                salary.setSalNPen(nPen);   // 국민
                salary.setSalEmpIns(empIns); // 고용
                salary.setSalWorkIns(workIns);// 산재
                salary.setSalInsCompany(hIns + nPen + empIns + workIns); // 회사가 부담할 보험료

                salary.setSalBasic(basic);
                salary.setSalExtr(extr);
                salary.setSalBns(Bns);
                salary.setSalOvertime(OverTime);
                salary.setSalTotal(total);

                // 나머지 필드들도 설정
                salary.setEmpEmpNo(empNo);
                salary.setSalEmpNo(loginEmpNo);
                salary.setSalEmpNm(loginEmpNm);
                salary.setSalAccNum(Long.parseLong(emp.getEmpAccnum()));
                salary.setSalAccBank(emp.getEmpAccbank());

                salaryService.insertSal(salary);
            }
        }

        return "redirect:/accounting/salary/salaryList.do";
    }
    
    

    /**
     * 퇴직금
     * @param model
     * @param authentication
     * @return
     */
    @GetMapping("/accounting/salary/salarySeverancePay.do")
    public String salarySeverancePay(
            Model model,
            Authentication authentication
    ) {    
        AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
        EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
        String loginEmpNo = empVO.getEmpNo();

        List<EmployeeVO> empList = salaryService.getAllEmpList();
        List<EmployeeVO> filteredEmpList = new ArrayList<>();

        List<SalaryVO> empVo = new ArrayList<>(); // empVo 리스트를 초기화

        for (EmployeeVO emp : empList) {
            LocalDate hireDate = emp.getEmpJoinDt(); // 입사일
            LocalDate resignDate = emp.getEmpResignDt(); // 퇴사일
            List<SalaryVO> empVoEx = salaryService.selectEmp(emp.getEmpNo());
            empVo.addAll(empVoEx); // addAll 메서드를 사용해 새로운 요소를 리스트에 추가
            if (hireDate != null && resignDate != null) {
                Period period = Period.between(hireDate, resignDate);
                if (period.getYears() >= 1) {
                    filteredEmpList.add(emp); // 입사일과 퇴사일의 차이가 1년 이상인 경우에만 리스트에 추가
                }
            }
        }
        
        model.addAttribute("salary", empVo);
        model.addAttribute("empList", filteredEmpList);
        model.addAttribute("loginEmpNo", loginEmpNo);

        return "accounting/salary/salarySeverancePay";
    }

   
    @RequestMapping("/accounting/salary/salarySeverancePayEx.do")
    public String salarySeverancePayEx(
            @RequestParam(required = true) String empNo,
            Model model
    ) {
            List<SalaryVO> empVo = salaryService.selectEmp(empNo);
            model.addAttribute("salary", empVo);
            return "accounting/salary/ex/salarySeverancePayEx";

    }

}