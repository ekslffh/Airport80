package kr.or.ddit.accounting.accounting.vo;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"accBudId", "accAcaId"})
public class AccountingVO implements Serializable {
	
	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private String accId;
	
	private String accBudId;				// 예산_아이디
	
	@NotBlank
	private String accAcaId;				// 회계종류_아이디
	private AccountCategoryVO category;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
//    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private LocalDateTime accUseTs;				// 회계내역_사용일시
    public void setAccUseTs(LocalDateTime accUseTs) {
    	// DateTimeFormatter를 사용하여 LocalDateTime을 다른 형식으로 포맷
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String formattedDateTime = accUseTs.format(outputFormatter);

        // formattedDateTime을 필요한 곳에 사용하거나 저장
        this.accUseTs = accUseTs; // 또는 다른 필드에 할당
	}
	
	@NotBlank
	private String accType;					// 회계내역_유형 (수입/지출)
	
	@NotNull
	private Integer accAmt;					// 회계내역_금액
	
	private String accMemo;					// 회계내역_메모
	
	private String accDel;					// 회계내역_삭제여부
	
	private String accStatus;				// 회계내역_상태
	
	private String accResRson;				// 회계내역_응답사유
	
	private String accImg;					// 회계내역_영수증
	private MultipartFile[] accFiles;
	private AtchFileVO fileGroup;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime accCrtTs;				// 회계내역_생성일시
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime accUpdTs;				// 회계내역_수정일시
	
	@NotBlank
	private String accWriter;				// 회계내역_작성자
	private EmployeeVO writer;
	
	private String accLeader;				// 회계내역_부서장사번
	private EmployeeVO leader;
	
}
