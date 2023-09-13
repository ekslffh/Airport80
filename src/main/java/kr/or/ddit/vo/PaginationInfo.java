package kr.or.ddit.vo;

import java.text.MessageFormat;
import java.util.List;

import kr.or.ddit.Infra.vo.rncScheduleVO;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * 페이징 처리와 관련된 모든 속성을 가진 객체
 *
 */
@Data
@NoArgsConstructor
public class PaginationInfo<T> {
	
	
   public PaginationInfo(int screenSize, long blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}
   
   public PaginationInfo(PaginationInfo paging) {
	   this.screenSize = paging.getScreenSize();
	   this.blockSize = paging.getBlockSize();
	   this.simpleCondition = paging.getSimpleCondition();
	   this.setCurrentPage(paging.getCurrentPage());
   }
   
   private String reqWriter;//본인

   private long totalRecord; // DB 조회
   private int screenSize = 10;
   private long blockSize = 5;
   
   private long totalPage; // 연산1
   private long currentPage; // request parameter
   
   private long startRow; // 연산2
   private long endRow; // 연산3
   
   private long startPage; // 연산4
   private long endPage; // 연산5
   
   private SimpleCondition simpleCondition;
   
   private List<T> dataList;
   
   public void setSimpleCondition(SimpleCondition simpleCondition) {
	   this.simpleCondition = simpleCondition;
   }
   
   
   public void setTotalRecord(long totalRecord) {
      this.totalRecord = totalRecord;
      this.totalPage = (totalRecord + screenSize-1) / screenSize; 
   }
   
   public void setCurrentPage(long currentPage) {
      this.currentPage = currentPage;
                                      
      this.endRow = currentPage * screenSize;
      this.startRow = endRow - (screenSize - 1);
      
      this.endPage = ((currentPage + blockSize - 1) / blockSize) * blockSize;                                                
      this.startPage = endPage - (blockSize - 1);
   }
   
    String htmlPattern = "<li class=''page-item''><a class='page-link' href=''javascript:fn_paging({0});'' data-page=''{0}''>{1}</a></li>";
	String htmlPatternActive = "<li class=''page-item active''><a class='page-link' href=''javascript:fn_paging({0});'' data-page=''{0}''>{1}</a></li>";
	
	public String getPagingHTML() {
		StringBuilder html = new StringBuilder();
		html.append("<ul class='pagination'>");
		
		if (startPage > 1) {
			html.append(
				MessageFormat.format(htmlPattern, startPage - 1, "이전")
			);
		}
		
		endPage = endPage > totalPage ? totalPage : endPage;
		
		for(long page = startPage; page <= endPage; page++) {
			html.append(
				MessageFormat.format(
					(page == currentPage) ? htmlPatternActive : htmlPattern
				, page, page)
			);
		}
		
		if (endPage < totalPage) {
			html.append(
				MessageFormat.format(htmlPattern, endPage + 1, "다음")
			);
		}
		
		html.append("</ul>");
		return html.toString();
	}

	public void setReqWriter(String reqWriter) {
		this.reqWriter = reqWriter;
	}


}