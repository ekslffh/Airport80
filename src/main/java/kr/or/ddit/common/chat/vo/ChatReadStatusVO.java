package kr.or.ddit.common.chat.vo;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"crsEmpNo", "crsMsgId"})
public class ChatReadStatusVO implements Serializable {
	@NotBlank
	private String crsEmpNo;
	@NotBlank
	private String crsMsgId;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime crsTs;
}
