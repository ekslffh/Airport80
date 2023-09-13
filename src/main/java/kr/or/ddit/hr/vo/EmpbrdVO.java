package kr.or.ddit.hr.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="ebNo")
public class EmpbrdVO {

   private long rnum;
   @NotNull(groups = UpdateGroup.class)
   private Integer ebNo;
   @NotBlank 
   private String ebTitle;
   @NotBlank 
   private String ebContent;
   private String ebImg;
   @DateTimeFormat(iso = ISO.DATE)
   private LocalDate ebCrtDt;
   @DateTimeFormat(iso = ISO.DATE)
   private LocalDate ebUpdDt;
   private Integer ebVws;
   private String ebPub;
   @NotBlank 
   private String empNo;
   private String empNm;
   
   private EmployeeVO employee;
   
   private MultipartFile[] ebFiles;
   
   private String atchFileId;
   
   private AtchFileVO fileGroup;
}