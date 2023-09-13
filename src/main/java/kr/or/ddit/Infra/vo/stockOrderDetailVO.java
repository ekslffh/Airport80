package kr.or.ddit.Infra.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"soId", "stId2"})
public class stockOrderDetailVO implements Serializable {

	@NotBlank
	private String soId; // 발주아이디
	
	@NotBlank
	private String stId2; // 재고아이디
	
	private stockVO stock;
	
	@NotNull
	private int soCnt; // 재고수량
	
	private stockOrderVO stockOrder;
	
}
