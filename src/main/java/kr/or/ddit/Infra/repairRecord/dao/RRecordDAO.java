package kr.or.ddit.Infra.repairRecord.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.Infra.vo.repairRecordVO;

@Mapper
public interface RRecordDAO {

	public repairRecordVO selectRecord(String rsId);
	public int createRecord(repairRecordVO rec);
}
