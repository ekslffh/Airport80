package kr.or.ddit.view;

import java.io.File;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.MessageFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.atch.vo.AtchFileDetailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AtchDownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		AtchFileDetailVO atchFile = (AtchFileDetailVO) model.get("atchFile");
		log.info("전달된 모델 : {}", atchFile);
		
		File readFile = new File(atchFile.getFiCours());
		response.setContentLengthLong(atchFile.getFiSize());
//		Content-Disposition: "inline[attatchment];filename=\"{0}\"";
		String filename = URLEncoder.encode(atchFile.getFiOriginNm(), "UTF-8");
		String contentDisposition = MessageFormat.format("attatchment;filename=\"{0}\"", filename);
		
		response.setHeader("Content-Disposition", contentDisposition);
		response.setContentType("application/octet-stream");
		try (
			OutputStream os = response.getOutputStream();	
		) {
			FileUtils.copyFile(readFile, os);
		}
	}

}
