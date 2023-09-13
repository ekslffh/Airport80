package kr.or.ddit.accounting.accounting.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "month")
public class AmountMonthVO {
	private String month;
	private String income;
	private String expense;
}
