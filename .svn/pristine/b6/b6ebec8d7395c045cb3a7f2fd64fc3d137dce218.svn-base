package kr.or.ddit.common.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.chat.vo.ChatReadStatusVO;

/**
 * 채팅방 조회여부 관리용 퍼시스턴스 레이어
 */
@Mapper
public interface ChatReadStatusDAO {
	/**
	 * 메시지 리스트 특정 멤버에 대해서 전부 읽음처리하기
	 * @param chatReadStatusVOs
	 * @return 추가된 데이터 개수 (> 0 : 성공)
	 */
	public int insertChatReadStatuses(List<ChatReadStatusVO> chatReadStatusVOs);
}
