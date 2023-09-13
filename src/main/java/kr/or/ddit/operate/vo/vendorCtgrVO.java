package kr.or.ddit.operate.vo;

import javax.validation.constraints.NotBlank;

public class vendorCtgrVO {

	@NotBlank
	private String vcCd;
	@NotBlank
	private String vcNm;
}
