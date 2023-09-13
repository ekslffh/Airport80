package kr.or.ddit.Infra.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "rrId")
public class rncReqVO {

	@NotBlank(groups = {UpdateGroup.class})
	private String rrId;//수리요청ID
	@NotBlank(groups = {InsertGroup.class})
	private String rrLoc; //위치
	@NotBlank(groups = {InsertGroup.class})
	private String rrContent;// 내용
	private String rrImg; //첨부파일
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime rrOccurTs;//발생일시
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime rrTs; //요청일시
	private String rrRsId; // 수리일정아이디
	private String rrAcc; //요청자
	private String rrStts; //상태 
	private String rrType; //유형
	private rncScheduleVO rncSchedule;
	
	private CommonCodeVO common;// 상태코드vo
	private EmployeeVO employee;
	private ZoneVO zone;
	private repairLogVO repair;
	
	private MultipartFile[] flFiles;
	 // multipartfile 이건 하나밖에 못받아 그래서 뒤에 []배열. 
	private String atchFileId;
	
	private AtchFileVO fileGroup; // has a 관계
}
