package kr.or.ddit.accounting.budgetreq.vo;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.accounting.vendorpayment.vo.VendorPaymentVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "bgRId")
public class BudgetReqVO {
	private long rnum;
	
	@NotBlank(groups = { UpdateGroup.class, DeleteGroup.class })
	private String bgRId;
	@NotNull(groups = InsertGroup.class)
	private String bgRUseTs;
	@NotNull(groups = InsertGroup.class)
	@Min(value = 10000, groups = InsertGroup.class)
	private long bgRAmt;
	@NotBlank(groups = InsertGroup.class)
	private String bgRRsn;
	@NotBlank(groups = UpdateGroup.class)
	private String bgRStatus;
	private String bgRTs;
	private String bgRResRsn;
	
	private String bgRResTs;
	@NotBlank(groups = InsertGroup.class)
	private String empEmpNo;
	
	@NotBlank(groups = UpdateGroup.class)
	private String salEmpNo;
	@NotBlank(groups = InsertGroup.class)
	private String acaId;
	
	private String acaNm;
	private String empEmpNm;
	private String salEmpNm;
}
