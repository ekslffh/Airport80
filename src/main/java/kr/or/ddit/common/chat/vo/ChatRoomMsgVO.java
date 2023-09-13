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
@EqualsAndHashCode(of = "crmId")
public class ChatRoomMsgVO implements Serializable {
	@NotBlank
	private String crmId;
	@NotBlank
	private String crmContent;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime crmCrtTs;
	@NotBlank
	private String chrId;
	@NotBlank
	private String empNo;
	
	private EmployeeVO employee;
	
	private long unreadCnt;
}
