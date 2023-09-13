package kr.or.ddit.operate.vo;

import javax.validation.constraints.NotBlank;

public class custParkingPayVO {

	@NotBlank
	private String clogId;
	@NotBlank
	private Integer cppAmt;
	@NotBlank
	private String cppTs;

}
