package kr.or.ddit.hr.eplStatus.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.hr.vo.EplstatusVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface EplstatusDAO {
	public int insertEplstatus(EplstatusVO epl);
	
	public long selectTotalRecord(PaginationInfo paging);
	public List<EplstatusVO> selectEplList(PaginationInfo paging);
	
	public EplstatusVO selectEplstatus(String eplId);
	
	public int updateEplstatus(EplstatusVO epl);
	
	public EplstatusVO checkEpl(String empNo);
	
	public int updateEplAll(EplstatusVO epl);
}
