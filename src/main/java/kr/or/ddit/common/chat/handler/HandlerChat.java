package kr.or.ddit.common.chat.handler;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.common.chat.dao.ChatRoomMsgDAO;
import kr.or.ddit.common.chat.vo.ChatRoomMsgVO;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.operate.vo.AirlineVO;
import kr.or.ddit.operate.vo.vendorVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class HandlerChat extends TextWebSocketHandler {
	// (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) -
	// (<"bang_id", 방ID>, <"session", 세션>) 형태
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getMemberId(session); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		if (senderId != null) { // 로그인 값이 있는 경우만
			log.info(senderId + " 연결 됨");
//			sessionList.put(senderId, session); // 로그인중 개별유저 저장
		}
	}
	
	@Inject
	private ChatRoomMsgDAO chatRoomMsgDao;
	
	// 클라이언트가 서버로 메세지 전송 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		super.handleTextMessage(session, message);

		// JSON --> Map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);

		SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = (Authentication) session.getPrincipal();

     // principal 객체에서 현재 로그인한 직원의 사번 찾기
 		AccountWrapper wrapper = (AccountWrapper<?>) authentication.getPrincipal();
 		EmployeeVO employee = (EmployeeVO) wrapper.getRealUser();
 		String empNm = employee.getEmpNm();
 		String empNo = employee.getEmpNo();
		
		switch (mapReceive.get("cmd")) {

		// CLIENT 입장
		case "CMD_ENTER":
			// 세션 리스트에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bang_id", mapReceive.get("bang_id"));
			map.put("session", session);
			sessionList.add(map);

			// 같은 채팅방에 입장 메세지 전송
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String bang_id = (String) mapSessionList.get("bang_id");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				if (bang_id.equals(mapReceive.get("bang_id"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("bang_id", bang_id);
					mapToSend.put("cmd", "CMD_ENTER");
					mapToSend.put("msg", empNm + "님이 입장 했습니다.");

					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			break;
		
		// CLIENT 메세지
		case "CMD_MSG_SEND":
			// 같은 채팅방에 메세지 전송
			LocalDateTime now = LocalDateTime.now();
			// 초의 소수점을 없애기 위해 truncatedTo() 사용
	        LocalDateTime sendTime = now.truncatedTo(ChronoUnit.SECONDS);
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String bang_id = (String) mapSessionList.get("bang_id");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				if (bang_id.equals(mapReceive.get("bang_id"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("bang_id", bang_id);
					mapToSend.put("cmd", "CMD_MSG_SEND");
					mapToSend.put("msg", empNm + " : " + mapReceive.get("msg") + " [" + sendTime + "]");
					
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			// chatRoomMsgVO 생성해서 저장하기
			// 필요정보 내용, 누가 보냈는지
			ChatRoomMsgVO chatRoomMsg = new ChatRoomMsgVO();
			chatRoomMsg.setCrmId(UUID.randomUUID().toString().substring(0, 30));
			chatRoomMsg.setCrmContent(mapReceive.get("msg"));
			chatRoomMsg.setCrmCrtTs(sendTime);
			chatRoomMsg.setChrId(mapReceive.get("bang_id"));
			chatRoomMsg.setEmpNo(empNo);
			chatRoomMsgDao.insertMessage(chatRoomMsg);
			break;
		}
	}

	// 클라이언트가 연결을 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		super.afterConnectionClosed(session, status);

		ObjectMapper objectMapper = new ObjectMapper();
		String now_bang_id = "";

		// 사용자 세션을 리스트에서 제거
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> map = sessionList.get(i);
			String bang_id = (String) map.get("bang_id");
			WebSocketSession sess = (WebSocketSession) map.get("session");

			if (session.equals(sess)) {
				now_bang_id = bang_id;
				sessionList.remove(map);
				break;
			}
		}

		// 같은 채팅방에 퇴장 메세지 전송
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> mapSessionList = sessionList.get(i);
			String bang_id = (String) mapSessionList.get("bang_id");
			WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

			if (bang_id.equals(now_bang_id)) {
				Map<String, String> mapToSend = new HashMap<String, String>();
				mapToSend.put("bang_id", bang_id);
				mapToSend.put("cmd", "CMD_EXIT");
				mapToSend.put("msg", session.getId() + "님이 퇴장 했습니다.");

				String jsonStr = objectMapper.writeValueAsString(mapToSend);
				sess.sendMessage(new TextMessage(jsonStr));
			}
		}
	}
	
	// 웹소켓에 id 가져오기
	// 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String getMemberId(WebSocketSession session) {
		SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = (Authentication) session.getPrincipal();

        // principal 객체에서 현재 로그인한 직원의 사번 찾기
 		AccountWrapper aw = (AccountWrapper<?>) authentication.getPrincipal();
 		String accInfo = aw.getAccInfo();
 		
 		String memId = null;
 		if (accInfo.equals("AL")) {
			// 항공사계정
 			AirlineVO airLine = (AirlineVO) aw.getRealUser();
 			memId = airLine.getAlCd();
		} else if (accInfo.equals("VD")) {
			// 입점업체계정
			vendorVO vendor = (vendorVO) aw.getRealUser();
			memId = vendor.getVendId();
		} else {
			// 공항직원계정
			EmployeeVO employee = (EmployeeVO) aw.getRealUser();
			memId = employee.getEmpNo();
		}
 		
		return memId == null ? null : memId;
	}
}