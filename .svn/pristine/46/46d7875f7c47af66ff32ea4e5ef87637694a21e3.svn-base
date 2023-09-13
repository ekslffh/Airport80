package kr.or.ddit.common.chat.handler;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

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

import kr.or.ddit.common.chat.dao.ChatReadStatusDAO;
import kr.or.ddit.common.chat.dao.ChatRoomMsgDAO;
import kr.or.ddit.common.chat.service.ChatRoomService;
import kr.or.ddit.common.chat.vo.ChatReadStatusVO;
import kr.or.ddit.common.chat.vo.ChatRoomMemberVO;
import kr.or.ddit.common.chat.vo.ChatRoomMsgVO;
import kr.or.ddit.common.chat.vo.ChatRoomVO;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.operate.vo.AirlineVO;
import kr.or.ddit.operate.vo.vendorVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CustomSocketHandler extends TextWebSocketHandler {
	
	@Inject
	private ChatRoomService chatRoomService;
	
	@Inject
	private ChatRoomMsgDAO chatRoomMsgDao;
	
	@Inject
	private ChatReadStatusDAO chatReadStatusDao;
	
	// 로그인중인 개별유저
//	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	Map<String, List<WebSocketSession>> users = new ConcurrentHashMap<String, List<WebSocketSession>>();
	Map<String, List<String>> chatRoomInfoMap = new HashMap<String, List<String>>();
	
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, String> userInfo = getMemberId(session); // 접속한 유저의 http세션을 조회하여 유저정보를 얻는 함수
		String senderId = userInfo.get("memId");
//		if (senderId != null && !users.containsKey(senderId)) { // 로그인 값이 있는 경우만
//			log.info(senderId + " 연결됨");
//			users.put(senderId, session); // 로그인중 개별유저 저장
//		}
		if (senderId != null) {
			// 첫 연결 수립이라면 List<WebSocketSession> 생성해서 value에 넣어주기
			if (!users.containsKey(senderId)) {
				List<WebSocketSession> sessions = new ArrayList<>();
				users.put(senderId, sessions);
			}
			users.get(senderId).add(session);
			log.info("{} 사원이 {} 세션 연결하였습니다. 현재 세션 개수 : {}", userInfo.get("memName"), session, users.get(senderId).size());
		} else {
			log.info("{} 사원이 {} 세션 연결에 실패하였습니다. 현재 세션 개수 : {}", userInfo.get("memName"), session, users.get(senderId).size());
		}
	}

	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, String> userInfo = getMemberId(session); // 접속한 유저의 http세션을 조회하여 유저정보를 얻는 함수
		String senderId = userInfo.get("memId");
		String empNm = userInfo.get("memName");
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		// 송신자가 보낸내용들
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);
		
		String type = mapReceive.get("type");
		String msg = mapReceive.get("msg");
		
		if (msg == null) return;
		
		// 수신자에게 보낼 내용들
		Map<String, String> mapToSend = new HashMap<String, String>();
		
		String jsonStr = null;
		
        String chrId = mapReceive.get("bang_id");

		switch (type) {
		// 방에 처음 들어온 경우
		case "CHAT_ENTER":
			// 방아이디 기준으로 현재 접속 멤버수 +1 (현재 특정방에 몇명있는지?)
			
			// 방에 아무도 접속해 있지 않으면 새로 만들고 0 초기화
			if (!chatRoomInfoMap.containsKey(chrId)) {
				chatRoomInfoMap.put(chrId, new ArrayList<String>());
			} 
			// 들어올때마다 사원이 들어와있지 않으면 리스트에 추가해주기
//			chatRoomInfoMap.put(chrId, chatRoomInfoMap.get(chrId) + 1);
			List<String> currentEnterMemberList = chatRoomInfoMap.get(chrId);
			// 이미 들어와있으면 더이상 추가하지 않고 return 하기
			if (currentEnterMemberList.contains(senderId)) return;
			
			currentEnterMemberList.add(senderId);
			chatRoomInfoMap.put(chrId, currentEnterMemberList);
			
			log.info("방에 들어옴 현재 인원: {}", chatRoomInfoMap.get(chrId).size());
			break;
		// 방에서 나온 경우
		case "CHAT_OUT":
			// 방아이디 기준으로 현재 접속 멤버수 -1
			
			// 만약 아무도 없으면 그냥 return
			if (!chatRoomInfoMap.containsKey(chrId)) return;
			
			// 나갈때마다 1씩 빼주기
			chatRoomInfoMap.get(chrId).remove(senderId);
			
			log.info("방에서 나감 현재 인원: {}", chatRoomInfoMap.get(chrId).size());
			// 만약에 빼다가 0이하가 되면 map에서 제거
			if (chatRoomInfoMap.get(chrId).size() < 0) chatRoomInfoMap.remove(chrId);
			
			break;
		case "CHAT_REQ":
			mapToSend.put("type", "chat");
			// 같은 채팅방에 메세지 전송
			LocalDateTime now = LocalDateTime.now();
			// 초의 소수점을 없애기 위해 truncatedTo() 사용
	        LocalDateTime sendTime = now.truncatedTo(ChronoUnit.SECONDS);
	        // 보내는 값에 msg, bang_id 필요
	        
	        // 채팅방아이디를 가지고 채팅방 정보 가져오기
	        ChatRoomVO chatRoomInfo = chatRoomService.retrieveRoomDetail(chrId);
	        if (chatRoomInfo == null) return;
	        
	        mapToSend.put("bang_id", chrId);
			mapToSend.put("sender", senderId);
			mapToSend.put("senderName", empNm);
			mapToSend.put("sendTime", sendTime.toString());
			mapToSend.put("msg", mapReceive.get("msg"));
			
			// 메세지를 보냈을 때 현재 채팅방의 접속 멤버에 따라서 바로읽은 사람 체크해서 보내주기
			
			// 채팅방 전체 멤버수 가져오기
	        int allNum = chatRoomInfo.getChatRoomMembers().size();
	        // 현재 접속해있는 수 가져오기
	        
	        int curNum = 0;
	        // 접속해있는 멤버가 있다면 수 가져오기
	        if (chatRoomInfoMap.containsKey(chrId)) curNum = chatRoomInfoMap.get(chrId).size();
	        
	        // 안읽은 수는 전체 멤버수에서 접속해있는 사람수 빼기
	        int unReadCnt = allNum - curNum;
	        // 계산된 값 넣어주기 차후에 이 값을 가지고 옆에 안읽은 사람 개수 띄워줄거임
			mapToSend.put("unReadCnt", String.valueOf(allNum));
			
			jsonStr = objectMapper.writeValueAsString(mapToSend);
			
	        // 채팅방 소속 멤버들 중에 현재 접속되어 있는 사람들에게 실시간 메시지 전송 
	        for (ChatRoomMemberVO chatRoomMember : chatRoomInfo.getChatRoomMembers()) {
	        	String accId = chatRoomMember.getEmpNo();
	        	if (users.containsKey(accId)) {
	        		// 모든 웹소켓 세션에 전송보내기
	        		for (WebSocketSession targetSession : users.get(accId)) {
	        			targetSession.sendMessage(new TextMessage(jsonStr));
	        		}
	        	}
	        }
	        
	        // DB에 저장하기 
	        
			// chatRoomMsgVO 생성해서 저장하기
			// 필요정보 내용, 누가 보냈는지
			ChatRoomMsgVO chatRoomMsg = new ChatRoomMsgVO();
			chatRoomMsg.setCrmId(UUID.randomUUID().toString().substring(0, 30));
			chatRoomMsg.setCrmContent(msg);
			chatRoomMsg.setCrmCrtTs(sendTime);
			chatRoomMsg.setChrId(mapReceive.get("bang_id"));
			chatRoomMsg.setEmpNo(senderId);
			chatRoomMsgDao.insertMessage(chatRoomMsg);
			
			// 내가 작성한 내용 바로 읽음처리하기
			List<ChatReadStatusVO> readStatusList = new ArrayList<>();
			ChatReadStatusVO readStatus = new ChatReadStatusVO();
			readStatus.setCrsEmpNo(senderId);
			readStatus.setCrsMsgId(chatRoomMsg.getCrmId());
			readStatusList.add(readStatus);
			
			// 현재 채팅방에 있는 사람들도 바로 읽음처리
//			if (chatRoomInfoMap.containsKey(chrId)) {
//				for (String empNo : chatRoomInfoMap.get(chrId)) {
//					ChatReadStatusVO treadStatus = new ChatReadStatusVO();
//					treadStatus.setCrsEmpNo(empNo);
//					treadStatus.setCrsMsgId(chatRoomMsg.getCrmId());
//					readStatusList.add(treadStatus);
//				}
//			}
			
			chatReadStatusDao.insertChatReadStatuses(readStatusList);
			break;
		// 보안요청 도착시 보안부서 직원들에게만 알림 보내기
		case "SECURITY_REQ":
			mapToSend.put("type", "security");
			mapToSend.put("msg", "[보안요청]" + msg);
			jsonStr = objectMapper.writeValueAsString(mapToSend);
			for (Map.Entry<String, List<WebSocketSession>> entry : users.entrySet()) {
			    String memId = entry.getKey();
			    // 보안부서번호 : 1203
			    String deptNo = memId.substring(0, 4);
			    if (deptNo.equals("1203")) {
			    	// 모든 세션에 알림보내기?
			    	for (WebSocketSession targetSession : entry.getValue()) {
			    		targetSession.sendMessage(new TextMessage(jsonStr));
			    	}
			    }
			}
			break;
		// 수리요청 도착시 인프라부서 직원들에게만 알림 보내기
//		case "REPAIR_REQ":
//			mapToSend.put("type", "repair");
//			mapToSend.put("msg", "[수리요청]" + msg);
//			jsonStr = objectMapper.writeValueAsString(mapToSend);
//			for (Map.Entry<String, WebSocketSession> entry : users.entrySet()) {
//			    String memId = entry.getKey();
//			    // 인프라부서번호 : 1204
//			    String deptNo = memId.substring(0, 4);
//			    if (deptNo.equals("1204")) {
//				    WebSocketSession targetSession = entry.getValue();
//				    targetSession.sendMessage(new TextMessage(jsonStr));
//			    }
//			}
//			break;
		}
	}

	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, String> userInfo = getMemberId(session);
		String senderId = userInfo.get("memId");
		if(senderId != null) {	// 로그인 값이 있는 경우만
			log(senderId + " 연결 종료됨");
			if (users.get(senderId).remove(session)) {
				log.info("{} 세션 종료 성공 : ", session);
				// 만약 저장하고 있는 세션이 없으면 users에서 해당 아이디 삭제하기
				if (users.get(senderId).size() == 0) {
					users.remove(senderId);
					log.info("{} 모든 세션 종료 성공", senderId);
				}
			} else {
				log.info("{} 세션 종료 실패: ", session);
			}
		}
	}

	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	// 로그 메시지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

	// 웹소켓에서 유저정보 가져오기
	// 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private Map<String, String> getMemberId(WebSocketSession session) {
		
		Map<String, String> userInfo = new HashMap<>();
		
		SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = (Authentication) session.getPrincipal();

        // principal 객체에서 현재 로그인한 직원의 사번 찾기
 		AccountWrapper aw = (AccountWrapper<?>) authentication.getPrincipal();
 		String accInfo = aw.getAccInfo();
 		
 		String memId = null;
 		String memName = null;
 		if (accInfo.equals("AL")) {
			// 항공사계정
 			AirlineVO airLine = (AirlineVO) aw.getRealUser();
 			memId = airLine.getAlCd();
 			memName = airLine.getAlKnm();
		} else if (accInfo.equals("VD")) {
			// 입점업체계정
			vendorVO vendor = (vendorVO) aw.getRealUser();
			memId = vendor.getVendId();
			memName = vendor.getVendNm();
		} else {
			// 공항직원계정
			EmployeeVO employee = (EmployeeVO) aw.getRealUser();
			memId = employee.getEmpNo();
			memName = employee.getEmpNm();
		}
 		
 		userInfo.put("memId", memId);
 		userInfo.put("memName", memName);
 		
		return userInfo;
	}
}