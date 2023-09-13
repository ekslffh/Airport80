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
@EqualsAndHashCode(of = "baId")
public class bidApplicationVO {

	@NotNull(groups = {UpdateGroup.class, DeleteGroup.class})
	private String baId;
	private Integer baBnNo;
	@NotBlank
	private String baCoNm;

	@NotBlank
	private String baEmail;
	private String baEmailDo;
	
	@NotBlank
	private String baContact;
	@NotBlank
	private String baAmt;
	private String baReqSpace;
	@NotBlank
	private String baStatus;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate baCrtTs;


	private Integer bnNo;
	private String bnEmpNo;
	
	private String baStartTime;
	private String baEndTime;
	
	@NotNull
	private Integer baPassword;
	private String baImg;
	
	
	
	private MultipartFile[] baFiles;
	
	private String atchFileId;
	
	private AtchFileVO fileGroup;
	
}