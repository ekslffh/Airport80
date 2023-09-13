package kr.or.ddit.common.chat.service;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.chat.dao.ChatRoomDAO;
import kr.or.ddit.common.chat.dao.ChatRoomMemberDAO;
import kr.or.ddit.common.chat.vo.ChatRoomMemberVO;
import kr.or.ddit.common.chat.vo.ChatRoomVO;
import kr.or.ddit.exception.PKNotFoundException;

@Service
public class ChatRoomServiceImpl implements ChatRoomService {

	@Inject
	private ChatRoomDAO chatRoomDao;
	
	@Inject
	private ChatRoomMemberDAO chatRoomMemberDao;
	
	@Override
	public List<ChatRoomVO> retrieveListByEmp(String empNo) {
		return chatRoomDao.selectListByEmp(empNo);
	}

	@Override
	public boolean createChatRoom(ChatRoomVO chatRoom) {
		// 채팅방 생성시에 채팅방 생성하고
		// 현재 생성한 사용자를 ChatRoomMember 테이블에도 데이터 추가
		String chatRoomId = UUID.randomUUID().toString();
		String empNo = chatRoom.getChrEmp();
		chatRoom.setChrId(chatRoomId);
		
		// 채팅방 생성
		int cnt = chatRoomDao.insertChatRoom(chatRoom);
		
		// 채팅방에 멤버 추가하기
		ChatRoomMemberVO chatRoomMemberVO = new ChatRoomMemberVO();
		chatRoomMemberVO.setChrId(chatRoomId);
		chatRoomMemberVO.setEmpNo(empNo);
		
		List<ChatRoomMemberVO> chatRoomMemList = new ArrayList<>();
		chatRoomMemList.add(chatRoomMemberVO);
		cnt += chatRoomMemberDao.insertChatRoomMember(chatRoomMemList);
		
		return cnt > 1;
	}

	@Override
	public ChatRoomVO retrieveRoomDetail(String chrId) {
		ChatRoomVO chatRoom = chatRoomDao.selectRoomDetail(chrId);
		if (chatRoom == null) throw new PKNotFoundException(MessageFormat.format("해당하는 채팅방 없음 : {0}", chrId));
		return chatRoom;
	}

}
