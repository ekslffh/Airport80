package kr.or.ddit.Infra.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "stId")
public class stockVO {

	
	private String stId;
	@NotBlank
	private String stNm;
	@NotBlank
	private String stCtgr;
	@NotNull
	private int stPrice;
	@NotBlank
	private String stUnit;
	@NotBlank
	private String stLoc;
	@NotNull
	private int stQuantity;
	private String stStatus;
	private String stDesc;
	private LocalDate stCrtDt;
	private String stSprId;
	
	
	private CommonCodeVO commonCode;

	private supplierVO supplier;
}
