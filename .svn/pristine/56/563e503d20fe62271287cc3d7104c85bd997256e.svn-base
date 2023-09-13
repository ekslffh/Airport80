package kr.or.ddit.operate.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "cnbNo")
public class CustNoticeBrdVO {

   private long rnum;
   @NotNull(groups = UpdateGroup.class)
   private Integer cnbNo;
   @NotBlank
   private String cnbTitle;

   private String cnbContent;
   @DateTimeFormat(iso = ISO.DATE)
   private LocalDate cnbCrtTs;
   @DateTimeFormat(iso = ISO.DATE)
   private LocalDate cnbUptTs;
   private Integer cnbVws;
   private String cnbType;
   private String cnbImg;
   @DateTimeFormat(iso = ISO.DATE)
   private LocalDate cnbStartDt;
   @DateTimeFormat(iso = ISO.DATE)
   private LocalDate cnbEndDt;
   @NotBlank
   private String cnbWriter;

   private MultipartFile[] cnbFiles;

   private String atchFileId;

   private AtchFileVO fileGroup;

}