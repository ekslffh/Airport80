package kr.or.ddit.atch.vo;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "atchFileId")
public class AtchFileVO {
	@NotBlank
	private String atchFileId;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime creatDt;
	private boolean useAt;
	
	@ToString.Exclude
	private List<AtchFileDetailVO> detailList; // has many
}
