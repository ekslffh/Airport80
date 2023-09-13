package kr.or.ddit.hr.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="attCd")
public class AttendanceVO {
	
	@NotBlank 
	private String attCd;
	@NotBlank 
	private String attId;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate attDt;
	private String attInTime;
	private String attOutTime;
	private Integer attWorkHours;
	private String attMemo;
	@NotBlank 
	private String attEmpNo;
	
}
