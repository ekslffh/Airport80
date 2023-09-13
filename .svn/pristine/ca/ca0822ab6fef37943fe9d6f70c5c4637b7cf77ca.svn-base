package kr.or.ddit.accounting.budget.vo;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.accounting.budgetdetail.vo.budgetDetailVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "budId")
public class BudgetVO {
	
	private long rnum;
	
	@NotBlank(groups = {UpdateGroup.class,DeleteGroup.class})
	private String budId;
	
	private Integer budYear;

	@NotNull(groups = InsertGroup.class)
	private long budAmt;

	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDate budCrtDt;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDate budUpdDt;
	
	@NotBlank
	private String deptNo;
	
	private List<budgetDetailVO> detailList;
	
	private Integer budQuarter;
	
	// 사용 예산액
	private long usedAmt;
}
