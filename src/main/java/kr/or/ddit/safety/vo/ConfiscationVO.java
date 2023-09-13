package kr.or.ddit.safety.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
public class ConfiscationVO {

	private long rnum; // 게시판 넘버링

	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private String csId; // 압수품 ID
	
	private String csImg; // 압수품 이미지 id로 사용 
	
	@NotBlank
	private String csNm; // 압수품이름
	@NotBlank
	private String csCtgr; // 압수품품목
	private ConfiscationInfoVO confisInfo; // 반입불가물품VO
	
	private int csQtt; // 압수품수량
	
//	@DateTimeFormat(iso = ISO.DATE) LocalDateTime 이거 넣어주기 
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime csTs; // 압수일시
	
	private String csRsn; // 압수사유

	@NotBlank
	private String csLoc; // 압수장소
	private ZoneVO zone; // 구역VO

	private String csDispoMthd; // 처분방법
	private CommonCodeVO common; // 상태코드VO

	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate csDispoTs; // 폐기날짜
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime csCrtTs; // 압수품 등록일시
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime csUpdTs; // 압수품 수정일시

	private String slogId; // 보안일지 ID
	private SecurityLogVO security; // 보안일지VO 

	@NotBlank
	private String csWriter; // 작성자
	private EmployeeVO employee; // 직원VO

	@NotBlank
	private String csPno; // 압수자 여권번호
	@NotBlank
	private String csPsName; // 압수자 이름
	
	private String csDel; // 삭제여부 
	
	private String csDispoRsn; // 상태변경사유
	
	// 이미지 
	private MultipartFile[] flFiles;
	private String atchFileId;
	private AtchFileVO fileGroup;
	
}
