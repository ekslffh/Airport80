package kr.or.ddit.operate.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

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
@EqualsAndHashCode(of = "chId")
public class contractHistoryVO implements Serializable {

	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private String chId;
	@NotNull
	private Integer chAmt;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate chStartDt;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate chEndDt;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime chCrtTs;
	@NotBlank
	private String ctrId;
	private String chDoc;
	private MultipartFile[] chFiles;
	private AtchFileVO fileGroup;

}
