package kr.or.ddit.hr.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="caNo")
public class crAppVO {
	@NotBlank
	private Integer caNo;
	@NotBlank 
	private String caStartTs;
	@NotBlank 
	private String caEndTs;
	@NotBlank 
	private String caAppTs;
	private String caStatus;
	private String caApprTs;
	@NotBlank 
	private Integer crNo;
	@NotBlank 
	private String caAppEmp;
	private String caApprEmp;
}
