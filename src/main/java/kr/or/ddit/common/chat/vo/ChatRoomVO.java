package kr.or.ddit.common.chat.vo;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "chrId")
public class ChatRoomVO implements Serializable {
	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private String chrId;
	@NotBlank
	private String chrNm;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime chrCrtTs;
	private String chrDel;
	@NotBlank
	private String chrEmp;
	
	private List<ChatRoomMemberVO> chatRoomMembers;
}
