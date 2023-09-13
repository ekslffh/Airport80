package kr.or.ddit.common.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.chat.vo.ChatRoomMemberVO;

/**
 * 채팅방멤버 관리용 퍼시스턴스 레이어
 * 특정 직원을 사번을 통해서 초대할 수 있고
 * 채팅방 내에서 나갈 수 있다.
 */
@Mapper
public interface ChatRoomMemberDAO {
	/**
	 * 특정 채팅방에 특정 멤버 초대하기
	 * @param chatRoomMember
	 * @return 추가된 데이터 개수 >= 초대한 멤버 수 : 성공
	 */
	public int insertChatRoomMember(List<ChatRoomMemberVO> chatRoomMembers);
	
	/**
	 * 속해있던 채팅방에서 나가기
	 * @param chatRoomMember :필수파라미터 = 채팅방아이디(chrId), 사번(empNo)
	 * @return 삭제된 데이터 개수 > 0 : 성공
	 */
	public int deleteChatRoomMember(ChatRoomMemberVO chatRoomMember);
}
