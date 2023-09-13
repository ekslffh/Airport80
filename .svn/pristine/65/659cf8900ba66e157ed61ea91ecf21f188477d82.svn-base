package kr.or.ddit.operate.contract.service;

import java.util.List;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.operate.vo.contractVO;

/**
 * 계약 (입점업체, 외주업체, 항공사) 관리
 */
public interface ContractService {
	public List<contractVO> retrieveList();
	/**
	 * 특정 계약정보 가져오기
	 * @param ctrId
	 * @return 계약정보
	 * @throws PKNotFoundException : 존재하지 않는 경우 예외발생
	 */
	public contractVO retrieveOne(String ctrId) throws PKNotFoundException;
	public boolean create(contractVO contract);
	public boolean modify(contractVO contract);
}
