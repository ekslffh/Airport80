package kr.or.ddit.operate.custNoticeBrd.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/operate/cnbNoticeBrd/uploadImage.do")
public class CnbUploadImageController {
	
	@Value("#{appInfo.imagePath}")
	private String imagePathUrl;
//	@Value("${appInfo.imagePath}")
//	private Resource imageRes;
	
	@Value("#{appInfo.imagePath}")
	private Resource permPath;
	
	/**
	 * <a href="https://ckeditor.com/docs/ckeditor4/latest/guide/dev_file_upload.html">CKeditor 문서</a> 참고
	 * @param upload
	 * @param req
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> uploadHandler(@RequestPart("upload") MultipartFile upload, HttpServletRequest req) throws IllegalStateException, IOException {
		Map<String, Object> result = new HashMap<>();
		if(!upload.isEmpty()) {
			String savename = UUID.randomUUID().toString();
			File saveFile = new File(permPath.getFile(), savename);
			upload.transferTo(saveFile);
			
			String url = req.getContextPath() + imagePathUrl + "/" +savename;
			result.put("url", url);
			result.put("fileName", upload.getOriginalFilename());
			result.put("uploaded", 1);
		}else {
			result.put("uploaded", 0);
			result.put("error", Collections.singletonMap("message", "업로드된 파일이 없음."));
		}
		return result;
	}
}























