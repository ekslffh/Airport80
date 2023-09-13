package kr.or.ddit.common.vo;

import java.time.LocalDateTime;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.vo.PaginationInfo;
import lombok.Data;

@Data
public class RequestListVO {
	
	private long rnum; //게시판 넘버링
	
	private String reqId; //요청ID
	private String reqCtgr; //요청구분
	private String reqCont; //요청내용
	private String reqFloor; //층
	private String reqLo; //위치/금액
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime reqTs; //요청일시
	private String reqWriter; //요청자
	private String reqStatus; // 요청상태 
	
//	private PaginationInfo<T> pagination;

}
