package kr.or.ddit.Infra.repairRecord.service;

import java.text.MessageFormat;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.Infra.repairRecord.dao.RRecordDAO;
import kr.or.ddit.Infra.vo.repairRecordVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.PKNotFoundException;

@Service
public class RRecordServiceImpl implements RRecordService {

	@Inject
	private RRecordDAO dao;

	@Override
	public repairRecordVO retrieveRecordOne(String rsId) {
		repairRecordVO rec = dao.selectRecord(rsId);
		
		if(rec == null) {
			throw new PKNotFoundException(MessageFormat.format("{0} 처리이력 없음", rsId));
		}
		return rec;
	}

	@Override
	public ServiceResult insertRecordOne(repairRecordVO rec) {
		return dao.createRecord(rec) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	
	
}
