package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "apCd")
public class AirPortsVO {

	@NotBlank
	private String apCd;
	@NotBlank
	private String apLoc;
	@NotBlank
	private String apNm;

}
