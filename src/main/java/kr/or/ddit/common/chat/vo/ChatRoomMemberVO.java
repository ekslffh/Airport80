package kr.or.ddit.common.chat.vo;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.common.vo.EmployeeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"chrId", "empNo"})
public class ChatRoomMemberVO implements Serializable {
	@NotBlank
	private String chrId;
	@NotBlank
	private String empNo;
	private EmployeeVO employee;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime chmPtcTs;
}
