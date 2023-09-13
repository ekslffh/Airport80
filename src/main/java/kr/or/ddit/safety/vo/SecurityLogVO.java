package kr.or.ddit.safety.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "slogId")
public class SecurityLogVO {
	@NotBlank(groups= {UpdateGroup.class, DeleteGroup.class})
	private String slogId; //아이디 
	
	private String slogConfis; // 압수품 여부
	
	private String slogCa; // 카테고리(요청,비요청)
	private CommonCodeVO common; // 상태코드VO
	
	private String slogIssue; // 보안이슈 
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime slogPrcDt; // 처리일시 
	private String slogInh; //개선사항
	
	@NotBlank(groups = InsertGroup.class)
	private String slogTitle; // 제목
	private String slogContent; // 처리내용 
	
	@NotBlank(groups = InsertGroup.class)
	private String slogFc; // 위치정보
	private ZoneVO zone; // 구역VO
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime slogCrtTs; // 작성일시
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime slogUpdTs; // 수정일시
	private String slogWriter; // 작성자 
	
	private String slogSrId; // 보안접수아이디
}
