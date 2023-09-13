package kr.or.ddit.common.vo;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.hr.vo.VacStatusVO;
import kr.or.ddit.hr.vo.VacationReqVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "empNo")
public class EmployeeVO implements Serializable {
	
	private String empNo;
	@NotBlank
	private String empNm;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate empBir;
	private String empGender;
	@NotBlank
	private String empEmail;
	private String empEmailDo;
	private String empEmailPass;
	private String empAddr;
	@NotBlank
	private String empContact;
	private String empStatus;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate empJoinDt;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate empResignDt;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate empCrtDt;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate empUpdDt;
	@NotBlank
	private String empDeptNo;
	
	private DepartmentVO department;
	private String empDetailAddr;
	private String empPost;
	@NotBlank
	private String empRoleNm;
	private String empCtrFile;
	@NotBlank
	private String empTeam;
	private String empAccnum;
	private String empAccbank;
	private String empAtchFile;
	@Mapper
	private VacStatusVO vacstatusVO;
	
	private MultipartFile[] empFiles;
	
	private String atchFileId;

	private AtchFileVO fileGroup;
}



