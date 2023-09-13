package kr.or.ddit.hr.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.vo.CommonCodeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(of="eplId")
public class EplstatusVO {
   
   private long rnum;
   private String eplId;
   @NotBlank 
   private String esCarNo;
   @NotBlank 
   private String esCarModel;
   private String esStatus;
   private LocalDate esCrtDt;
   @NotBlank
   private String eplCd;
   private String empNo;
   private String empNm;
   private String eplReason;
   
   private CommonCodeVO commoncode;
}