package kr.or.ddit.operate.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "vendId")
public class vendorVO {

//	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private String vrId;
	
	private String vendCtrId;
	private contractVO contract; // has one
	
//	@NotBlank 
	private String vendId;
	@NotBlank 
	private String vendNm;
	@NotBlank 
	private String vendOpHours;
	@NotBlank 
	private String vendClHours;
	@NotBlank 
	private String vendContact;
	@NotBlank 
	private String vendLoc;
	@NotBlank 
	private String vendMvp;
	private String vendDesc;
	@NotBlank 
	private String vendType;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate vendDt;
	private String vendStatus;
	private String vendImg;
	private String vendOwner;
	private String vendEndDt;
	
	private String vendFloor;
	private String ctrId;
	private String chEndDt;
	private String ctrStatus;
	private String zoneCtgr;
	private CommonCodeVO commoncode;
	
	private ZoneVO zone;

}
