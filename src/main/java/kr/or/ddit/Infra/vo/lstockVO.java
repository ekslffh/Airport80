package kr.or.ddit.Infra.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "lstGu")
public class lstockVO {

	@NotBlank
	private Integer lstId;
	@NotBlank
	private String lstGu;
	@NotBlank
	private String lstNm;
}
