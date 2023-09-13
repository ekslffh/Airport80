package kr.or.ddit.operate.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= "alCd")
public class AirlineVO {

	@NotBlank 
	private String alCd;
	@NotBlank 
	private String alKnm;
	@NotBlank 
	private String alEnm;
	@NotBlank 
	private String alCountry;
	@NotBlank 
	private String alCounCd;
	private String alFlag;
	private String alScale;
	private String alWeb;
	private String alDesc;
	private String alHead;
	private LocalDate alUpdDt;
	private String alVrId;
	private String alStatus;
	private LocalDate alEndDt;
	
	private int alOn;
	private int alOff;
	private int alStop;
}

