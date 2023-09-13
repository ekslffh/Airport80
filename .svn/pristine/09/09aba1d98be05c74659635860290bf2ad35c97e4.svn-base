package kr.or.ddit.accounting.budgetdetail.vo;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"budId", "acaId"})
public class budgetDetailVO implements Serializable {

    private long rnum;

    @NotBlank(groups = {DeleteGroup.class})
    private String bdId;

    private String budId;

    @NotBlank
    private String acaId;
    private AccountCategoryVO category;
    
    private String acaNm;

    @Min(10000)
    @NotNull(groups = {UpdateGroup.class, InsertGroup.class})
    private Long bdAmt;
   
    private long budAmt;

    @DateTimeFormat(iso = ISO.DATE_TIME)
    private LocalDateTime bdCrtTs;
    @DateTimeFormat(iso = ISO.DATE_TIME)
    private String bdUpdTs;
    
    private BudgetVO budget;
}
