package kr.or.ddit.common.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.chat.vo.ChatRoomMemberVO;
import kr.or.ddit.common.chat.vo.ChatRoomMsgVO;

/**
 * 특정 채팅방의 메시지 관리용 퍼시스턴스 레이어
 * 채팅방에 속해있는 직원들은 해당 채팅방의 내용을 시간대로 별로 확인할 수 있다.
 * 채팅방에 속해있는 멤버들은 해당 채팅방에 글을 작성할 수 있다.
 * 채팅방에 속해있는 멤버들은 본인이 작성한 채팅글을 삭제할 수 있다.
 */
@Mapper
public interface ChatRoomMsgDAO {
	/**
	 * 특정 채팅방의 메시지 리스트 가져오기
	 * @param chrId
	 * @return 없으면 size = 0 반환
	 */
	public List<ChatRoomMsgVO> selectListByChatRoom(String chrId);
	
	/**
	 * 특정 채팅방의 마지막 메시지 정보 가져오기
	 * @param chrId
	 * @return 없으면 null 반환
	 */
	public ChatRoomMsgVO selectLastMessageList(String chrId);
	
	/**
	 * 특정 멤버에 대해서 안읽은 메시지 개수 가져오기
	 * @param memId
	 * @return 메시지 개수
	 */
	public int countUnreadListByMember(String memId);
	
	/**
	 * 특정 멤버, 특정 채팅방에 대해서 안읽은 메시지 개수 가져오기
	 * @param chatRoomMember : 특정 채팅방 아이디와 멤버 아이디 필요
	 * @return 메시지 개수
	 */
	public int countUnreadListByMemberAndChat(ChatRoomMemberVO chatRoomMember);
	
	public List<ChatRoomMsgVO> selectUnreadListByMemberAndChat(ChatRoomMemberVO chatRoomMember);
	
	/**
	 * 채팅방에 채팅내용 작성하기
	 * @param chatRoomMsg
	 * @return 추가된 데이터 개수 > 0 : 성공
	 */
	public int insertMessage(ChatRoomMsgVO chatRoomMsg);
	
	/**
	 * 채팅방에 채팅내용 삭제하기
	 * @param crmId : 채팅방 메시지 아이디
	 * @return 삭제된 데이터 개수 > 0 : 성공
	 */
	public int deleteMessage(String crmId);
}
