package kr.or.ddit.operate.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "flId")
public class flightLogVO {

	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private String flId;
	@NotBlank
	private String flTitle;
	@NotBlank
	private String flContent;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime flCrtTs;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime flUpdTs;
	@NotBlank
	private String flWriter;
	
	private EmployeeVO employee;
	
	private MultipartFile[] flFiles;
	
	private String atchFileId; //첨부파일 id 
	
	private AtchFileVO fileGroup;

}
