package kr.or.ddit.operate.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "blogId")
public class busLogVO {

	@NotNull(groups = UpdateGroup.class)
	private String blogId;
	@NotBlank
	private String blogTitle;
	@NotBlank
	private String blogContent;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate blogCrtTs;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate blogUpdTs;

	private String blogDel;
	@NotBlank
	private String blogWriter;

}
