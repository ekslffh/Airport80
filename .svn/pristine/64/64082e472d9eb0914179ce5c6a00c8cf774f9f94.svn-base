package kr.or.ddit.atch.vo;

import java.util.UUID;

import javax.validation.constraints.NotBlank;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of = {"atchFileId", "fileSn"})
public class AtchFileDetailVO {
	private MultipartFile uploadFile;

	public AtchFileDetailVO(MultipartFile uploadFile) {
		super();
		this.uploadFile = uploadFile;

		this.fiOriginNm = uploadFile.getOriginalFilename();
		this.fiExtsn = FilenameUtils.getExtension(fiOriginNm);
		this.fiSize = uploadFile.getSize();
		this.fiMime = uploadFile.getContentType();

		this.fiNm = UUID.randomUUID().toString();
	}

	@NotBlank
	private String atchFileId;
	@NotBlank
	private int fiSn;
	@NotBlank
	private String fiCours;
	@NotBlank
	private String fiNm;
	@NotBlank
	private String fiOriginNm;
	@NotBlank
	private String fiExtsn;
	private long fiSize;
	private String fiMime;
	private String fiDel;
}
