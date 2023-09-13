package kr.or.ddit.safety.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "srId")
public class SecurityReqVO {
	
	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private String srId; //요청글ID
	private String srSlogId; //보안일지ID
	
	private String srCa; //카테고리
	private CommonCodeVO common; //상태코드 VO
	
	@NotBlank(groups = InsertGroup.class)
	private String srLoc; //위치
	private ZoneVO zone; //구역VO
	
	@NotBlank(groups = InsertGroup.class)
	private String srContent; //내용
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime srTs; //요청등록일시 
	
	private String srStatus; //상태
	
	private String srReqMem; //요청자(작성자)
	private EmployeeVO employee;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime srPrcDt; // 요청처리일시
	private String srPrcCt; // 요청처리내용
	
	private String prosTime; // 처리 시간
	private int countReq;
	
	// 구역별 - 요청 종류별 목록
	private int countC1cro;
	private int countC1oth;
	private int countC1per;
	private int countC1art;
	
	private int countM1cro;
	private int countM1oth;
	private int countM1per;
	private int countM1art;
	
	private int countF1cro;
	private int countF1oth;
	private int countF1per;
	private int countF1art;
	
	private int countF2cro;
	private int countF2oth;
	private int countF2per;
	private int countF2art;
	
	private int countC2cro;
	private int countC2oth;
	private int countC2per;
	private int countC2art;
	
	private int countM2cro;
	private int countM2oth;
	private int countM2per;
	private int countM2art;
}
