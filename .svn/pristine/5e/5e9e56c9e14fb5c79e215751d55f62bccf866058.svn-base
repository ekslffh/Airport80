package kr.or.ddit.common.chat.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.chat.service.ChatRoomMemberService;
import kr.or.ddit.common.chat.service.ChatRoomMsgService;
import kr.or.ddit.common.chat.service.ChatRoomService;
import kr.or.ddit.common.chat.vo.ChatRoomMemberVO;
import kr.or.ddit.common.chat.vo.ChatRoomMsgVO;
import kr.or.ddit.common.chat.vo.ChatRoomVO;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.validate.InsertGroup;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@Inject
	private ChatRoomService chatRoomService;

	@Inject
	private ChatRoomMemberService chatRoomMemberService;

	@Inject
	private ChatRoomMsgService chatRoomMsgService;

	// 특정 직원 사번에 대한 채팅방 리스트 조회하기
	@GetMapping("/roomlist.do")
	public String getChatRooms(Authentication authentication, Model model) {
		// principal 객체에서 현재 로그인한 직원의 사번 찾기
		AccountWrapper wrapper = (AccountWrapper<?>) authentication.getPrincipal();
		EmployeeVO employee = (EmployeeVO) wrapper.getRealUser();
		String empNo = employee.getEmpNo();

		// 1. 사번기준으로 채팅목록 불러오기
		List<ChatRoomVO> chatRoomList = chatRoomService.retrieveListByEmp(empNo);

		// 2. 사번기준으로 채팅방들의 마지막 메시지만 뽑아오기
		// 3. 사번, 채팅방 기준 각각의 안읽은 메시지 개수 가져오기
		// 특정직원의 각 채팅방별로 안읽은 메시지개수 가져와 map에 저장
		Map<String, Integer> unRdMap = new HashedMap();
		// 특정직원의 각 채팅방별로 마지막 메시지정보 가져와 map에 저장
		Map<String, ChatRoomMsgVO> msgMap = new HashedMap();
		for (ChatRoomVO crv : chatRoomList) {
			ChatRoomMemberVO crmv = new ChatRoomMemberVO();
			crmv.setChrId(crv.getChrId());
			crmv.setEmpNo(empNo);
			int cnt = chatRoomMsgService.cntUnreadListByMemberAndChat(crmv);
			if (cnt != 0)
				unRdMap.put(crv.getChrId(), cnt);

			ChatRoomMsgVO msgVO = chatRoomMsgService.retrieveLastMessageList(crv.getChrId());
			msgMap.put(crv.getChrId(), msgVO);
		}

		// model에 저장하기
		model.addAttribute("chatRoomList", chatRoomList);
		model.addAttribute("unRdMap", unRdMap);
		model.addAttribute("msgMap", msgMap);

		// 채팅리스트 뷰로 이동하기
		return "common/chat/temp/chatList";
	}

	// 특정 직원 사번에 대한 채팅방 리스트 조회하기
	@GetMapping(value = "/roomlist2.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<?> getChatRoomsToJson(Authentication authentication, Model model) {
		/**
		 * ! 채팅방목록을 보여주기 위해 필요한 정보 1. 현재 속해있는 채팅방 목록 2. 각 채팅방별로 마지막 메시지 정보 3. 각 채팅방별로
		 * 안읽은 메시지 개수
		 */
		Map<String, Object> result = new HashedMap();

		try {
			// 1. 사번기준으로 채팅목록 불러오기
			// 1-1. 로그인한 사용자 기준으로 사번 꺼내오기
			AccountWrapper wrapper = (AccountWrapper<?>) authentication.getPrincipal();
			EmployeeVO employee = (EmployeeVO) wrapper.getRealUser();
			String empNo = employee.getEmpNo();
			// 1-2. 사번기준으로 채팅방목록 가져오기
			List<ChatRoomVO>
			chatRoomList = chatRoomService.retrieveListByEmp(empNo);

			// 2. 사번기준으로 채팅방들의 마지막 메시지만 뽑아오기
			// 2-1. 특정직원의 각 채팅방별로 마지막 메시지정보 가져와 map에 저장
			Map<String, ChatRoomMsgVO> msgMap = new HashedMap();
			// 3. 사번, 채팅방 기준 각각의 안읽은 메시지 개수 가져오기
			// 3-1. 특정직원의 각 채팅방별로 안읽은 메시지개수 가져와 map에 저장
			Map<String, Integer> unRdMap = new HashedMap();

			// 가져온 채팅방목록을 돌면서 작업 수행
			for (ChatRoomVO crv : chatRoomList) {
				// 2-2. 채팅방 아이디를 가지고 마지막 메시지를 가져오는 작업
				ChatRoomMsgVO msgVO = chatRoomMsgService.retrieveLastMessageList(crv.getChrId());
				msgMap.put(crv.getChrId(), msgVO);

				// 3-2. 채팅방아이디와 사번을 기준으로 특정 직원에 대해서 특정 채팅방에 안읽은 메시지 개수 가져오기
				ChatRoomMemberVO crmv = new ChatRoomMemberVO();
				crmv.setChrId(crv.getChrId());
				crmv.setEmpNo(empNo);
				int cnt = chatRoomMsgService.cntUnreadListByMemberAndChat(crmv);
				// 3-3. 가져온 값이 0이 아니라면 넣어주기 (다 읽었으면 unRdMap에는 값이 안들어감)
				if (cnt != 0)
					unRdMap.put(crv.getChrId(), cnt);
			}

			// map에 담아서 보내주기
			result.put("chatRoomList", chatRoomList);
			result.put("unRdMap", unRdMap);
			result.put("msgMap", msgMap);
		} catch (Exception e) {
			// 오류발생시 에러메시지 map에 담아주기
			result.put("errMsg", e.getMessage());
			return ResponseEntity.badRequest().body(result);
		}

		// 정상적으로 수행되었을 경우
		return ResponseEntity.ok().body(result);
	}

	// 특정 직원 사번에 대한 채팅방 리스트 조회하기
	@GetMapping(value = "/roomlist3.do")
	public String getChatRoomsFinal(Authentication authentication, Model model) {
		/**
		 * ! 채팅방목록을 보여주기 위해 필요한 정보 1. 현재 속해있는 채팅방 목록 2. 각 채팅방별로 마지막 메시지 정보 3. 각 채팅방별로
		 * 안읽은 메시지 개수
		 */
		String viewName = null;
		// 1. 사번기준으로 채팅목록 불러오기
		// 1-1. 로그인한 사용자 기준으로 사번 꺼내오기
		AccountWrapper wrapper = (AccountWrapper<?>) authentication.getPrincipal();
		EmployeeVO employee = (EmployeeVO) wrapper.getRealUser();
		String empNo = employee.getEmpNo();
		// 1-2. 사번기준으로 채팅방목록 가져오기
		List<ChatRoomVO> chatRoomList = chatRoomService.retrieveListByEmp(empNo);

		// 2. 사번기준으로 채팅방들의 마지막 메시지만 뽑아오기
		// 2-1. 특정직원의 각 채팅방별로 마지막 메시지정보 가져와 map에 저장
		Map<String, ChatRoomMsgVO> msgMap = new HashedMap();
		// 3. 사번, 채팅방 기준 각각의 안읽은 메시지 개수 가져오기
		// 3-1. 특정직원의 각 채팅방별로 안읽은 메시지개수 가져와 map에 저장
		Map<String, Integer> unRdMap = new HashedMap();

		// 가져온 채팅방목록을 돌면서 작업 수행
		for (ChatRoomVO crv : chatRoomList) {
			// 2-2. 채팅방 아이디를 가지고 마지막 메시지를 가져오는 작업
			ChatRoomMsgVO msgVO = chatRoomMsgService.retrieveLastMessageList(crv.getChrId());
			msgMap.put(crv.getChrId(), msgVO);

			// 3-2. 채팅방아이디와 사번을 기준으로 특정 직원에 대해서 특정 채팅방에 안읽은 메시지 개수 가져오기
			ChatRoomMemberVO crmv = new ChatRoomMemberVO();
			crmv.setChrId(crv.getChrId());
			crmv.setEmpNo(empNo);
			int cnt = chatRoomMsgService.cntUnreadListByMemberAndChat(crmv);
			// 3-3. 가져온 값이 0이 아니라면 넣어주기 (다 읽었으면 unRdMap에는 값이 안들어감)
			if (cnt != 0)
				unRdMap.put(crv.getChrId(), cnt);
		}

		// map에 담아서 보내주기
		model.addAttribute("chatRoomList", chatRoomList);
		model.addAttribute("unRdMap", unRdMap);
		model.addAttribute("msgMap", msgMap);

		// 정상적으로 수행되었을 경우
		viewName = "common/chat/temp/newChatList";
		
		return viewName;
	}

	@GetMapping("/chatMain.do")
	public String getChatMainPage() {
		return "common/chat/temp/chatMain";
	}

	// 채팅방 생성하기
	@PostMapping(value = "/roominsert.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map makeChatRoom(@Validated(InsertGroup.class) ChatRoomVO chatRoom, Errors errors) {
		Map<String, String> map = new HashedMap();

		boolean success = chatRoomService.createChatRoom(chatRoom);
		if (success) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
			map.put("error", "채팅방 생성에 실패하였습니다.");
		}
		return map;
	}

	@PostMapping(value = "/memberinsert.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map addMember(@RequestBody List<ChatRoomMemberVO> chatRoomMembers) {
		Map<String, String> map = new HashedMap();

		boolean success = chatRoomMemberService.createChatRoomMember(chatRoomMembers);
		if (success) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
			map.put("error", "채팅방 멤버추가에 실패하였습니다.");
		}
		return map;
	}

	@PostMapping(value = "/memberdelete.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map deleteMember(@RequestBody ChatRoomMemberVO chatRoomMember) {
		Map<String, String> map = new HashedMap();

		boolean success = chatRoomMemberService.removeChatRoomMember(chatRoomMember);
		if (success) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
			map.put("error", "채팅방 멤버추가에 실패하였습니다.");
		}
		return map;
	}

	@GetMapping(value = "/countMsg", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map countUnreadMsg(Authentication authentication) {
		Map<String, Integer> map = new HashedMap();
		String id = authentication.getName();
		int cnt = chatRoomMsgService.cntUnreadListByMember(id);
		map.put("totalCnt", cnt);
		return map;
	}

}
