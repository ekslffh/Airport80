package kr.or.ddit.common.chat.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.chat.dao.ChatRoomMemberDAO;
import kr.or.ddit.common.chat.vo.ChatRoomMemberVO;

@Service
public class ChatRoomMemberServiceImpl implements ChatRoomMemberService {

	@Inject
	private ChatRoomMemberDAO chatRoomMemberDao;

	@Override
	public boolean createChatRoomMember(List<ChatRoomMemberVO> chatRoomMembers) {
		return chatRoomMemberDao.insertChatRoomMember(chatRoomMembers) >= chatRoomMembers.size();
	}

	@Override
	public boolean removeChatRoomMember(ChatRoomMemberVO chatRoomMember) {
		return chatRoomMemberDao.deleteChatRoomMember(chatRoomMember) > 0;
	}
	
}
