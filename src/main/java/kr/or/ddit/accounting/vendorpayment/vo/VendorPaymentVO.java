package kr.or.ddit.accounting.vendorpayment.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class VendorPaymentVO {
	@NotBlank private String vpId;
	@NotBlank private Integer vpAmt;
	 private String vpDesc;
	@NotBlank private String vpStatus;
	 private String vpMethd;
	 private String vpPayTs;
	@NotBlank private String vpCrtTs;
	@NotBlank private String vpAccId;
	@NotBlank private String vpEmp;
}
