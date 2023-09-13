package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="codeId")
public class CommonCodeVO {
	
	@NotBlank 
	private String codeId;
	@NotBlank 
	private String codeUpper;
	@NotBlank 
	private String codeNm;
	private Integer codeVal;
	private String codeCont;
	private String codeInfo;
	@NotBlank 
	private String codeAct; 
	
	// 승인된 각 직원 주차장 차량 수
	private int apprCount;
	
	private String codeNm1;
	private String codeNm2;

}
