package kr.or.ddit.common.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "roleNm")
public class RoleVO implements Serializable {
	@NotBlank
	private String roleNm;
	private int roleLvl;
}
