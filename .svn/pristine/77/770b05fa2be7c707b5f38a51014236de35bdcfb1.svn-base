package kr.or.ddit.common.vo;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "scheId")
public class ScheduleVO implements Serializable {

	@NotBlank
	private String scheId;
	@NotBlank
	private String scheTitle;
	private String scheContent;
	private String scheLoc;
	@NotBlank
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate scheStartDt;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate scheEndDt;
	@NotBlank
	private String scheTarget;
	@NotBlank
	private String scheWriter;

}
