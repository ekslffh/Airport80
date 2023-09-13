package kr.or.ddit.safety.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "ciNo")
public class ConfiscationInfoVO {
	@NotNull(groups = UpdateGroup.class)
	private int ciNo;
	@NotBlank
	private String ciGubun;
	@NotBlank
	private String ciCarryBan;
	@NotBlank
	private String ciCabin;
	@NotBlank
	private String ciTrust;
}
