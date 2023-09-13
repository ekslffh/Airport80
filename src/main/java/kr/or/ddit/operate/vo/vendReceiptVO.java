package kr.or.ddit.operate.vo;

import javax.validation.constraints.NotBlank;

public class vendReceiptVO {

	@NotBlank
	private String vrId;
	@NotBlank
	private Integer vrAmt;
	private String vrLastTs;

}
