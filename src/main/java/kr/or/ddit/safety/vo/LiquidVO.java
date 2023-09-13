package kr.or.ddit.safety.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LiquidVO {

	@NotBlank
	private String liquid;
	@NotBlank
	private String liquidKind;

}
