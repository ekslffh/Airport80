package kr.or.ddit.hr.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="wsId")
public class workScheVO {

	@NotBlank 
	private String wsId;
	private Integer wsTn;
	@NotBlank 
	private String wsTime;
	@NotBlank 
	private Integer wsYear;
	@NotBlank 
	private Integer wsMonth;
	@NotBlank 
	private Integer wsWeek;
	@NotBlank 
	private String wsDeptNo;
}
