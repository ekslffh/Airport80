package kr.or.ddit.safety.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "fcCd")
public class FacilityVO {
	@NotBlank
	private String fcCd; // 시설코드
	@NotBlank
	private String zoneCd; //구역코드
	@NotBlank
	private String fcNm;//시설이름
	@NotBlank
	private String fcCtgr; // 시설종류
	@NotBlank
	private String fcStatus;// 시설상태
	private String fcDesc;// 시설설명
	@NotBlank
	private String fcCrtTs;//시설 등록일시
	private String fcImg;//시설 이미지 
	private String fcEndHours;// 시설 운영마감시간
	private String fcStartHours; // 시설 운영시작시간
	
	private ZoneVO zone;
}
