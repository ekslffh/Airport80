package kr.or.ddit.common.vo;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "deptNo")
public class DepartmentVO implements Serializable {
	@NotBlank
	private String deptNo;
	@NotBlank
	private String deptNm;
	@NotBlank
	private String deptLoc;
	private String deptDesc;
	@NotBlank
	private LocalDate deptCrtDt;
	private String deptMnger;
}
