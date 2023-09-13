package kr.or.ddit.Infra.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.validation.annotation.Validated;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "rsId")
public class rncScheduleVO {

	@NotBlank(groups= {UpdateGroup.class})
	private String rsId;
	private String rsDiv;
	private String rsZone;
	private String rsFc;
	private String rsType;
	@NotBlank(groups= {UpdateGroup.class})
	private String rsTitle;
	private String rsContent;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime rsStartTs;//시작일시
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime rsEndTs;//종료일시
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime rsCrtTs;//생성일시
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime rsUpdTs;//수정일시
	private String rsEmpNo;
	private String rsSuId;//재고사용id
	private String rsRrId;//유지보수접수ID
	private String rdCodeNm;
	private String rtCodeNm;
	private String rsCodeNm;
	
	private ZoneVO zone;
	private CommonCodeVO common;
	private rncReqVO rncReq;
	private EmployeeVO employee;
	private String rrId;
	private stockVO stockVO;
	private stockUseVO stockUse;
	private stockUseDetailVO stockUseDetail;
	
	private long daysPassed;
	private String rrStts;
	private long totalDaysPassed;
}
