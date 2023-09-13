package kr.or.ddit.operate.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "bnNo")
public class bidNoticeVO {

	@NotNull(groups = {UpdateGroup.class, DeleteGroup.class})
	private Integer bnNo;

	private String bnTitle;

	private String bnContent;

	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate bnCrtTs;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate bnDeadline;

	@NotBlank
	private String bnEnterLoc;
	
	private String bnEmpNo;

	private String bnStartTime;
	private String bnEndTime;
	
	
	private Integer bnAmt;
	private String bnStatus;
	
	private String bnImg;
	

	private MultipartFile[] bnFiles;
	
	private String atchFileId;

	private AtchFileVO fileGroup;
	

}
