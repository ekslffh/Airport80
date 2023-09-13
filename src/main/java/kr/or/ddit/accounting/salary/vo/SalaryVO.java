package kr.or.ddit.accounting.salary.vo;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "salId")
public class SalaryVO {
	@NotBlank(groups = {DeleteGroup.class })
	private String salId;
	@NotBlank(groups = InsertGroup.class)
	private Integer salBasic; // 기본급
	private Integer salBns;  //보너스
	private Integer salExtr;  //상여
	private long salOvertime; // 초과근무
	private long salTotal; // 급여총금액
	private String salMemo; // 메모,사유
	private String salPayDt; // 지급일
	
	private String salCrtTs; // 등록일
	@NotBlank(groups = InsertGroup.class)
	private String empEmpNo; // 급여지급받는직원
	@NotBlank(groups = InsertGroup.class)
	private String salEmpNo; // 급여관리자
	@NotBlank(groups = InsertGroup.class)
	private String salEmpNm; // 급여관리자 이름
	@NotBlank(groups = InsertGroup.class)
	private long salAccNum; // 계좌번호
	@NotBlank(groups = InsertGroup.class)
	private String salAccBank; // 은행

	//4대보험
	private Integer salHIns;    //건강
	private Integer salNPen;    //국민
	private Integer salEmpIns;  //고용
	private Integer salWorkIns; //산재
	private Integer salInsCompany; //회사부담보험료
	

	private EmployeeVO emp; // has a
	private String deptNm; // 부서명

}
