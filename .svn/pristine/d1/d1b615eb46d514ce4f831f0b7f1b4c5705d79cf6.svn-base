package kr.or.ddit.accounting.accountcategory.vo;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "acaId")
public class AccountCategoryVO implements Serializable {
	private long rnum;
	
	@NotBlank(groups = {UpdateGroup.class,DeleteGroup.class})
	private String acaId; 
	
	@NotBlank(groups = InsertGroup.class)
	private String acaNm;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDate acaCrtDt;
	
	@NotBlank(groups = InsertGroup.class)
	private String acaInfo;
	
	private String acaDel;
}
