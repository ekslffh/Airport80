package kr.or.ddit.Infra.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "rrcId")
public class repairRecordVO {

	@NotBlank
	private String rrcId;
	@NotBlank
	private String rreCituation;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	@NotBlank
	private LocalDateTime rreTs;
	private String rreRsId;
}
