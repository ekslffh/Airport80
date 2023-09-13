package kr.or.ddit.common.chat.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.chat.dao.ChatRoomMsgDAO;
import kr.or.ddit.common.chat.vo.ChatRoomMemberVO;
import kr.or.ddit.common.chat.vo.ChatRoomMsgVO;

@Service
public class ChatRoomMsgServiceImpl implements ChatRoomMsgService {

	@Inject
	private ChatRoomMsgDAO chatRoomMsgDAO;
	
	@Override
	public List<ChatRoomMsgVO> retrieveListByChatRoom(String chrId) {
		return chatRoomMsgDAO.selectListByChatRoom(chrId);
	}
	
	@Override
	public ChatRoomMsgVO retrieveLastMessageList(String chrId) {
		return chatRoomMsgDAO.selectLastMessageList(chrId);
	}

	@Override
	public boolean createMessage(ChatRoomMsgVO chatRoomMsg) {
		return chatRoomMsgDAO.insertMessage(chatRoomMsg) > 0;
	}

	@Override
	public boolean removeMessage(String crmId) {
		return chatRoomMsgDAO.deleteMessage(crmId) > 0;
	}

	@Override
	public int cntUnreadListByMember(String memId) {
		return chatRoomMsgDAO.countUnreadListByMember(memId);
	}

	@Override
	public int cntUnreadListByMemberAndChat(ChatRoomMemberVO chatRoomMember) {
		return chatRoomMsgDAO.countUnreadListByMemberAndChat(chatRoomMember);
	}

	@Override
	public List<ChatRoomMsgVO> retrieveUnreadListByMemberAndChat(ChatRoomMemberVO chatRoomMember) {
		return chatRoomMsgDAO.selectUnreadListByMemberAndChat(chatRoomMember);
	}

}
