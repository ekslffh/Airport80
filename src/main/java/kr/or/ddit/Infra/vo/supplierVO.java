package kr.or.ddit.Infra.vo;



import javax.validation.constraints.NotBlank;

import kr.or.ddit.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "sprId")
public class supplierVO {

	private String sprNum;

	private String sprId;
	@NotBlank
	private String sprType;
	@NotBlank
	private String sprNm;
	@NotBlank
	private String sprContact;
	@NotBlank
	private String sprAddr;
	@NotBlank
	private String sprEmail;
	private String sprDesc;
	@NotBlank
	private String sprStatus;
	private String ctrId;
	@NotBlank
	private String sprGu;
	
	private CommonCodeVO commonCode;
}
