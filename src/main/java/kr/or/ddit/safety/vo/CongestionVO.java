package kr.or.ddit.safety.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "cgId")
public class CongestionVO {
	@NotBlank
	private String cgId;
	@NotBlank
	private Integer cgPer;
	@NotBlank
	private String cgStatus;
	@NotBlank
	private String cgTs;
	private String cgZone;
}
