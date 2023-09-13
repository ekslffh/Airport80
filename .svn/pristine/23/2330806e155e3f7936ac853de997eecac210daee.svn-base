package kr.or.ddit.operate.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.apache.ibatis.type.MappedJdbcTypes;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.vo.AtchFileVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "liId")
public class LostItemVO {

	
	private String liId;
	private String liImg;
	private String liNm;
	@NotBlank
	private String liCtgr;
	@NotBlank
	private String liLoc;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate liFndTs;
	
	@NotBlank
	private String liStatus;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)	
	private LocalDateTime liRetTs;
	
	private String liPsNm;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate liCrtTs;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime liUpdTs;
	
	
	
	private MultipartFile[] liFiles;
	
	private String atchFileId;

	private AtchFileVO fileGroup;
		

}
