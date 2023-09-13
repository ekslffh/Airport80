package kr.or.ddit.operate.contract.service;

import java.util.List;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.operate.vo.contractHistoryVO;

/**
 * 계약 상세 내역 관리
 */
public interface ContractHistoryService {
	
	/**
	 * 조회시에 해당 계약에 대한 상세 내역들도 한번에 가져옴
	 * @return
	 */
	public List<contractHistoryVO> retrieveList();
	/**
	 * 계약 상세 내역 하나 가져오기
	 * @param chId
	 * @return
	 * @throws PKNotFoundException 없는 경우 예외발생
	 */
	public contractHistoryVO retrieveOne(String chId) throws PKNotFoundException;
	public boolean create(contractHistoryVO ch);
	public boolean modify(contractHistoryVO ch);
	public boolean remove(String chId);
}
