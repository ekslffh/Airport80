package kr.or.ddit.Infra.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.safety.vo.FacilityVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="rlNo")
public class repairLogVO {
	private String rlNo;
	@NotBlank
	private LocalDate rlDt;
	@NotBlank
	private String rlSection;
	@NotBlank
	private String rlContent;
	private String rlCrtTs;
	private String rlUpdTs;
	private String rlRsId;
	@NotBlank
	private String rlWriter;
	private String rlImg;
	@NotBlank
	private String rlFc;
	private String rlIc;
	@NotBlank
	private String rlIr;
	@NotBlank
	private String rlIs;
	@NotBlank
	private String rlIt;
	private String rlReason;
	
	private CommonCodeVO common;// 상태코드vo
	private EmployeeVO employee;
	private ZoneVO zone;
	private FacilityVO facility;
	
	private int tCnt;
	private int sCnt;
	private int nCnt;
	private int wtCnt;
	
	private String repChart;
	private int repCharnm;
}
