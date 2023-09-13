package kr.or.ddit.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

/**
 * 단순 키워드 검색
 */
@Data
public class SimpleCondition {
	private String searchType;
	private String searchWord;
	
	private int tab = 0;
	private int ctab  = 0;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate startDate;//시작 날짜
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate endDate;//종료날짜
	private String reqCtgr;//부서이름(필터링)
	
	private String secReqStatus; //보안지원요청 상태
	private String rncReqStatus1; //수리청소요청 상태
	private String rncReqStatus2; //수리청소요청 상태2
	private String budReqStatus; //추가예산요청 상태 
}


