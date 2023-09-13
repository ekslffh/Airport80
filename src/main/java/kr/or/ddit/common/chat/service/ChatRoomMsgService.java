package kr.or.ddit.common.chat.service;

import java.util.List;

import kr.or.ddit.common.chat.vo.ChatRoomMemberVO;
import kr.or.ddit.common.chat.vo.ChatRoomMsgVO;

/**
 * 특정 채팅방 메시지 관리용 비즈니스 로직 레이어
 */
public interface ChatRoomMsgService {
	/**
	 * 특정 채팅방의 메시지 리스트 가져오기
	 * @param chrId
	 * @return 없으면 size = 0 반환
	 */
	public List<ChatRoomMsgVO> retrieveListByChatRoom(String chrId);
	
	/**
	 * 특정 채팅방의 마지막 메시지 정보 가져오기
	 * @param chrId
	 * @return 없으면 null 반환
	 */
	public ChatRoomMsgVO retrieveLastMessageList(String chrId);
	
	/**
	 * 특정 멤버에 대해서 안읽은 메시지 개수 가져오기
	 * @param memId
	 * @return 메시지 개수
	 */
	public int cntUnreadListByMember(String memId);
	
	/**
	 * 특정 멤버, 특정 채팅방에 대해서 안읽은 메시지 개수 가져오기
	 * @param chatRoomMember : 특정 채팅방 아이디와 멤버 아이디 필요
	 * @return 메시지 개수
	 */
	public int cntUnreadListByMemberAndChat(ChatRoomMemberVO chatRoomMember);
	
	public List<ChatRoomMsgVO> retrieveUnreadListByMemberAndChat(ChatRoomMemberVO chatRoomMember);
	
	/**
	 * 채팅방에 채팅내용 작성하기
	 * @param chatRoomMsg
	 * @return 추가된 데이터 개수 > 0 : true
	 */
	public boolean createMessage(ChatRoomMsgVO chatRoomMsg);
	
	/**
	 * 채팅방에 채팅내용 삭제하기
	 * @param crmId : 채팅방 메시지 아이디
	 * @return 삭제된 데이터 개수 > 0 : true
	 */
	public boolean removeMessage(String crmId);
}
