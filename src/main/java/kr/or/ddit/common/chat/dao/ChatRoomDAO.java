package kr.or.ddit.common.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.chat.vo.ChatRoomVO;

/**
 * 채팅방 관리용 퍼시스턴스 레이어
 * 직원은 채팅방을 생성할 수 있고 삭제처리할 수 있다.
 * 본인이 속해있는 채팅방들만 조회가 가능하다.
 */
@Mapper
public interface ChatRoomDAO {
	/**
	 * 특정 직원이 속한 채팅방 리스트 조회하기
	 * @param memId : 특정 직원 사번
	 * @return 없으면 size = 0 반환
	 */
	public List<ChatRoomVO> selectListByEmp(String empNo);
	
	/**
	 * 채팅방 아이디를 가지고 특정한 방의 정보 가져오기
	 * 이것을 가지고 현 채팅방에 속해있는 직원들 사번을 조회
	 */
	public ChatRoomVO selectRoomDetail(String chrId);
	
	/**
	 * 새로운 채팅방 생성
	 * @param charRoom
	 * @return 생성된 데이터 개수 > 0 : 성공
	 */
	public int insertChatRoom(ChatRoomVO charRoom);
	
	/**
	 * 채팅방 내 멤버가 전부 나가면 chrDel 속성 'Y'로 수정
	 * @return 삭제처리된 데이터 개수 > 0 : 성공
	 */
	public int deleteChatRoomById(String chrId);
}
