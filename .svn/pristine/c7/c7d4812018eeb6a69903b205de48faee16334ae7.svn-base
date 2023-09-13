package kr.or.ddit.common.chat.service;

import java.util.List;

import kr.or.ddit.common.chat.vo.ChatRoomVO;
import kr.or.ddit.exception.PKNotFoundException;

/**
 * 채팅방 관리용 비즈니스 로직 레이어
 * 직원은 채팅방을 생성할 수 있고 삭제처리할 수 있다.
 * 본인이 속해있는 채팅방들만 조회가 가능하다.
 */
public interface ChatRoomService {
	/**
	 * 로그인한 직원의 사번 기준으로 채팅방 리스트 조회하기
	 * @param empNo
	 * @return 없으면 size 0 반환
	 */
	public List<ChatRoomVO> retrieveListByEmp(String empNo);
	
	/**
	 * 채팅방 아이디를 가지고 특정한 방의 정보 가져오기
	 * 이것을 가지고 현 채팅방에 속해있는 직원들 사번을 조회
	 * @throws PKNotFoundException : 해당하는 채팅방이 없으면 예외처리
	 */
	public ChatRoomVO retrieveRoomDetail(String chrId) throws PKNotFoundException;
	
	/**
	 * 채팅방 생성하기 
	 * @param chatRoom
	 * @return 추가된 데이터 수 > 1 : true 반환 (채팅방 생성데이터 최소 1 + 채팅방 생성자 멤버로 넣어주기 1 = 2)
	 */
	public boolean createChatRoom(ChatRoomVO chatRoom);
}
