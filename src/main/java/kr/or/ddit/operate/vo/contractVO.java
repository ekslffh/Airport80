package kr.or.ddit.operate.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "ctrId")
public class contractVO implements Serializable {

	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private String ctrId;
	@NotBlank
	private String ctrStatus;
	private String ctrMemo;
	@NotBlank
	private String empNo;
	
	private EmployeeVO employee;
	
	private List<contractHistoryVO> contractHistoryList;

}
