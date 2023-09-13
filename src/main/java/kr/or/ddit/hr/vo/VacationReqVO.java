package kr.or.ddit.hr.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="vrId")
public class VacationReqVO {
	
	@NotBlank // 아이디
	private String vrId;
	@DateTimeFormat(iso = ISO.DATE) // 시작일시
	private LocalDate vrStartTs;
	@DateTimeFormat(iso = ISO.DATE) // 종료일시
	private LocalDate vrEndTs;
	// 신청일자
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate vrReqDt;
	// 승인여부
	private String vrStatus;
	// 승인일자
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate vrAppDt;
	// 유형
	private String vrType;
	// 사유
	private String vrRsn;
	// 직원번호
	private String vrEmpNo;
	private String EmpNm;
	// 근태 아이디
	private String vrAttId;
	private String vrRejRsn;
	private String vrPeriod;
}
