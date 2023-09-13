package kr.or.ddit.operate.contract.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.operate.vo.contractHistoryVO;

/**
 * 계약 상세 내역 관리
 */
@Mapper
public interface ContractHistoryDAO {
	public List<contractHistoryVO> selectList();
	public contractHistoryVO selctOne(String chId);
	public int insert(contractHistoryVO ch);
	public int update(contractHistoryVO ch);
	public int delete(String chId);
}
