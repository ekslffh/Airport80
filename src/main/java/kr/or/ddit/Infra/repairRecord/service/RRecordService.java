package kr.or.ddit.Infra.repairRecord.service;

import kr.or.ddit.Infra.vo.repairRecordVO;
import kr.or.ddit.enumpkg.ServiceResult;

public interface RRecordService {

	public repairRecordVO retrieveRecordOne(String rsId);
	
	public ServiceResult insertRecordOne(repairRecordVO rec);
}
