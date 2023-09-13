package kr.or.ddit.safety.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "zoneCd")
public class ZoneVO {
	@NotBlank
	private String zoneCd; //구역코드
	@NotBlank
	private String zoneNm; //구역이름
	@NotBlank
	private String zoneCtgr; // 구역종류
	private Integer zoneCapacity; //수용인원
	private String zoneDesc; // 구역설명
	@NotBlank
	private Integer zoneFloor; //층번호
	@NotBlank
	private String zoneLoc; //위치
	@NotBlank
	private String zoneStatus; //상태 
	
	List<ZoneCdnVO> cdnList;
}
