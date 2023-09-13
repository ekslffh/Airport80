package kr.or.ddit.hr.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="crNo")
public class conferenceRoomVO {
	@NotBlank
	private Integer crNo;
	@NotBlank 
	private String crNm;
	@NotBlank 
	private String crLoc;
	@NotBlank 
	private Integer crCapacity;
}
