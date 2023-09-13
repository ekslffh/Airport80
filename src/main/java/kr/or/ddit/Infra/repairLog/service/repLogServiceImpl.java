package kr.or.ddit.Infra.repairLog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import kr.or.ddit.Infra.repairLog.dao.repLogDAO;
import kr.or.ddit.Infra.vo.repairLogVO;
import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class repLogServiceImpl implements repLogService {

	@Inject
	private repLogDAO repLogDAO;
	
	@Inject
	private AtchFileService atchService;
	
	@Value("#{appInfo.repLogAtchPath}")
	private Resource atchPath;
	
	@Override
	public int createRepLog(repairLogVO repLogVO) {
		return repLogDAO.insertRepLog(repLogVO);
	}

	@Override
	public List<repairLogVO> retrieveRepLogList(PaginationInfo paging) {
		long totalRecord = repLogDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return repLogDAO.selectRepLogList(paging);
	}
	
	@Override
	public List<repairLogVO> monthNnRepLogList(PaginationInfo paging) {
		long totalRecord = repLogDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return repLogDAO.selectMNRepLogList(paging);
	}

	@Override
	public List<repairLogVO> monthWtRepLogList(PaginationInfo paging) {
		long totalRecord = repLogDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return repLogDAO.selectMWRepLogList(paging);
	}

	@Override
	public repairLogVO retrieveRepLog(String rlNo) {
		return repLogDAO.selectRepLog(rlNo);
	}

	public repairLogVO countRepLog(String month) {
		return repLogDAO.monthRepLog(month);
	}

	@Override
	public int updateRepairLogStatus(repairLogVO repVO) {
		return repLogDAO.updateLogStatus(repVO);
	}

	@Override
	public List<repairLogVO> getRepCharts(String rlFc) {
		return repLogDAO.getRepChart(rlFc);
	}

	
	
}
