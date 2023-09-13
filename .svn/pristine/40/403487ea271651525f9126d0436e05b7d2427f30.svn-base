
package kr.or.ddit.operate.contract.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.operate.vo.contractVO;

/**
 * 계약 (입점업체, 외주업체, 항공사) 관리
 */
@Mapper
public interface ContractDAO {
	public List<contractVO> selectList();
	public contractVO selectOne(String ctrId);
	public int insert(contractVO contract);
	public int update(contractVO contract);
}
