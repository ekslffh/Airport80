package kr.or.ddit.common.chat.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.chat.util.Chatbot;

@Controller
@RequestMapping("/chatbot")
public class ChatbotController {
	
	@Inject
	private Chatbot chatbot;
	
	@GetMapping
	public String getChatbot() {
		return "common/chat/temp/chatbot";
	}
	
	@GetMapping("/qna.do")
	public ResponseEntity<String> getAnswer(String question) {
        System.out.println("안녕하세요! Airport:80 공항의 챗봇 서비스입니다. 무엇을 도와드릴까요?");
        try {
        	String answer = chatbot.sendRequest(question);
        	System.out.println("응답: " + answer);
        	return ResponseEntity.ok()
        		.contentType(MediaType.parseMediaType("text/plain;charset=UTF-8"))
        		.body(answer);
        } catch (Exception e) {
        	return ResponseEntity.badRequest()
        		.contentType(MediaType.parseMediaType("text/plain;charset=UTF-8"))
        		.body(e.getMessage());
        }
	}
	
}
