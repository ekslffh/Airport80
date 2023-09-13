package kr.or.ddit.Infra.vo;


import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "soId")
public class stockOrderVO {

	@NotBlank(groups = UpdateGroup.class)
	private String soId;
	
	@NotBlank(groups = UpdateGroup.class)
	private String soStatus;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
//	@DateTimeFormat(iso = ISO.DATE)
	private LocalDateTime soTs;
	
	private String soMemo;
	
	
	@NotNull
	private int soAmount;
	
	@NotBlank(groups = UpdateGroup.class)
	private String soEmpNo;
	
	@NotBlank(groups = UpdateGroup.class)
	private String vpId;
	
	@NotBlank(groups = UpdateGroup.class)
	private String sprId;
	
	private CommonCodeVO commoncode;
	
	private List<stockOrderDetailVO> stockOrderDetail;
	
	private supplierVO supplier;
	
	private EmployeeVO employee;
	
	private stockOrderDetailVO soDetail;
}
