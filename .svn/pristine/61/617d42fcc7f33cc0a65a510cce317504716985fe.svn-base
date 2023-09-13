package kr.or.ddit.common.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import kr.or.ddit.common.chat.dao.ChatReadStatusDAO;
import kr.or.ddit.common.chat.service.ChatRoomMsgService;
import kr.or.ddit.common.chat.service.ChatRoomService;
import kr.or.ddit.common.chat.vo.ChatReadStatusVO;
import kr.or.ddit.common.chat.vo.ChatRoomMemberVO;
import kr.or.ddit.common.chat.vo.ChatRoomMsgVO;
import kr.or.ddit.common.chat.vo.ChatRoomVO;
import kr.or.ddit.common.employee.service.EmpService;
import kr.or.ddit.common.vo.EmployeeVO;

@Controller
public class ControllerView {
	
	@Inject
	private ChatRoomMsgService chatRoomMsgService;
	
	@Inject
	private EmpService empService;
	
	@Inject
	private ChatRoomService chatRoomService;
	
	@Inject
	private ChatReadStatusDAO chatReadStatusDao;
	
	@GetMapping("/chat.do")
	public String view_chat (
			String bang_id
			, Model model
			, Authentication authentication
	) throws Exception {
		
		// 해당 채팅방 전부 읽음 처리
		// 특정 채팅방에 안읽은 메시지 가져오기
		ChatRoomMemberVO crm = new ChatRoomMemberVO();
		crm.setChrId(bang_id);
		crm.setEmpNo(authentication.getName());
		
		List<ChatRoomMsgVO> messageList = chatRoomMsgService.retrieveUnreadListByMemberAndChat(crm);
		List<ChatReadStatusVO> readStatusList = new ArrayList<>();
		for (ChatRoomMsgVO msg : messageList) {
			ChatReadStatusVO readStatus = new ChatReadStatusVO();
			readStatus.setCrsEmpNo(authentication.getName());
			readStatus.setCrsMsgId(msg.getCrmId());
			readStatusList.add(readStatus);
		}
		
		if (readStatusList.size() != 0) {
			int cnt = chatReadStatusDao.insertChatReadStatuses(readStatusList);
		}
		
		List<ChatRoomMsgVO> msgList = chatRoomMsgService.retrieveListByChatRoom(bang_id);
		model.addAttribute("msgList", msgList);
		
		// 전체 직원리스트 가져오는 것
		List<EmployeeVO> empList = empService.retrieveAllNoPaging();
		// 이미 초대되어 있는 직원들 사번만 추가로 가져와서 중복초대못하는 로직 구현해야 함.
		// 특정한 채팅방의 정보 가져오면 된다. 
		ChatRoomVO chatRoom = chatRoomService.retrieveRoomDetail(bang_id);
		
		model.addAttribute("empList", empList);
		model.addAttribute("chatRoom", chatRoom);
		
		return "common/chat/temp/chatRoom";
	}
	
	@GetMapping(value = "/chat2.do", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> view_chat2(
			String bang_id
			, Model model
			, Authentication authentication
	) {
		Map<String, Object> result = new HashedMap<String, Object>();
		
		try {
			// 해당 채팅방 전부 읽음 처리
			// 특정 채팅방에 안읽은 메시지 가져와서
			ChatRoomMemberVO crm = new ChatRoomMemberVO();
			crm.setChrId(bang_id);
			crm.setEmpNo(authentication.getName());
			
			List<ChatRoomMsgVO> messageList = chatRoomMsgService.retrieveUnreadListByMemberAndChat(crm);
			List<ChatReadStatusVO> readStatusList = new ArrayList<>();
			for (ChatRoomMsgVO msg : messageList) {
				ChatReadStatusVO readStatus = new ChatReadStatusVO();
				readStatus.setCrsEmpNo(authentication.getName());
				readStatus.setCrsMsgId(msg.getCrmId());
				readStatusList.add(readStatus);
			}
			
			// 전부 읽음처리
			if (readStatusList.size() != 0) {
				int cnt = chatReadStatusDao.insertChatReadStatuses(readStatusList);
			}
			
			// 전체 메시지 리스트 가져오기
			List<ChatRoomMsgVO> msgList = chatRoomMsgService.retrieveListByChatRoom(bang_id);
			
			// 전체 직원리스트 가져오는 것
			List<EmployeeVO> empList = empService.retrieveAllNoPaging();
			// 이미 초대되어 있는 직원들 사번만 추가로 가져와서 중복초대못하는 로직 구현해야 함.
			// 특정한 채팅방의 정보 가져오면 된다. 
			ChatRoomVO chatRoom = chatRoomService.retrieveRoomDetail(bang_id);
			
			// map에 저장하기
			result.put("msgList", msgList);	// 특정채팅방의 전체 메시지
			result.put("empList", empList); // 모든 직원리스트 (초대할때 필요함)
			result.put("chatRoom", chatRoom); // 채팅방 정보 (이름, 채팅방 멤버정보...)
			
		} catch (Exception e) {
			// 오류 발생시 에러메시지에 담아서 보내주기
			result.put("errMsg", e.getMessage());
			return ResponseEntity.badRequest().body(result);
		}
		
		// 정상적으로 수행되었을 경우
		return ResponseEntity.ok(result);
	}
	
	@GetMapping("/chat3.do")
	public String getChatRoomDetail(
			String bang_id
			, Model model
			, Authentication authentication
	) throws JsonProcessingException {
		
		String viewName = "";
		
		// 해당 채팅방 전부 읽음 처리
		// 특정 채팅방에 안읽은 메시지 가져와서
		ChatRoomMemberVO crm = new ChatRoomMemberVO();
		crm.setChrId(bang_id);
		crm.setEmpNo(authentication.getName());
		
		List<ChatRoomMsgVO> messageList = chatRoomMsgService.retrieveUnreadListByMemberAndChat(crm);
		List<ChatReadStatusVO> readStatusList = new ArrayList<>();
		for (ChatRoomMsgVO msg : messageList) {
			ChatReadStatusVO readStatus = new ChatReadStatusVO();
			readStatus.setCrsEmpNo(authentication.getName());
			readStatus.setCrsMsgId(msg.getCrmId());
			readStatusList.add(readStatus);
		}
		
		// 전부 읽음처리
		if (readStatusList.size() != 0) {
			int cnt = chatReadStatusDao.insertChatReadStatuses(readStatusList);
		}
		
		// 전체 메시지 리스트 가져오기
		List<ChatRoomMsgVO> msgList = chatRoomMsgService.retrieveListByChatRoom(bang_id);
		
		// 전체 직원리스트 가져오는 것
		List<EmployeeVO> empList = empService.retrieveAllNoPaging();
		// 이미 초대되어 있는 직원들 사번만 추가로 가져와서 중복초대못하는 로직 구현해야 함.
		// 특정한 채팅방의 정보 가져오면 된다. 
		ChatRoomVO chatRoom = chatRoomService.retrieveRoomDetail(bang_id);
		
		model.addAttribute("msgList", msgList); // 특정채팅방의 전체 메시지
		model.addAttribute("empList", empList); // 모든 직원리스트 (초대할때 필요함)
		model.addAttribute("chatRoom", chatRoom); // 채팅방 정보 (이름, 채팅방 멤버정보...)
		
		// 4-2. json형식으로도 보내줘서 그래프 그릴 예정
		// Java 객체를 JSON 문자열로 변환합니다.
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.registerModule(new JavaTimeModule());
		objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
		
		String msgListToJson = objectMapper.writeValueAsString(msgList);
		String empListToJson = objectMapper.writeValueAsString(empList);
		String chatRoomToJson = objectMapper.writeValueAsString(chatRoom);

		model.addAttribute("msgListToJson", msgListToJson);
		model.addAttribute("empListToJson", empListToJson);
		model.addAttribute("chatRoomToJson", chatRoomToJson);

		// 정상적으로 수행되었을 경우
		viewName = "common/chat/temp/newChatRoom";

		return viewName;
	}
	
	@GetMapping(value = "/msgInfo", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<ChatRoomMsgVO> getMsgInfo(String bang_id) {
		// 전체 메시지 리스트 가져오기
		List<ChatRoomMsgVO> msgList = chatRoomMsgService.retrieveListByChatRoom(bang_id);
		return msgList;
	}
}
