package kr.or.ddit.common.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "accId")
public class AccountVO implements Serializable {
	@NotBlank
	private String accId;
	@NotBlank
	private String accPw;
	@NotBlank
	private String accInfo;
	@NotBlank
	private Integer accCount;
	@NotBlank
	private String accLock;
	private boolean accDel;
	@NotBlank
	private String accAuth;
}
