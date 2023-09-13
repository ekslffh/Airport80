package kr.or.ddit.hr.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="elEmp")
public class LeaveEmpVO {

	@NotBlank //사용연도 
	private Integer elYear;
	@NotBlank // 계정 아이디 사번
	private String elEmp;
	@NotBlank // 보유 연가
	private Integer elHaveAl;

	private Integer elUseSk;
	private Integer elUsePd;
	private Integer elUseAl;
	private Integer elUseUp;
	private Integer elUsePl;
	private Integer elUseFe;
	
	private String vrId;
	private String empNm;
}
