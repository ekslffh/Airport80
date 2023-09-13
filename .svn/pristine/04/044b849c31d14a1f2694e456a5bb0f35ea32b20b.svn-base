package kr.or.ddit.safety.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "ppPno")
public class ProhibitedPersonVO {
	@NotBlank
	private String ppPno;
	private String ppNm;
	private String ppRes;
	@DateTimeFormat(iso=ISO.DATE)
	private LocalDate ppPer;
	private String ppWw;
}
