package kr.or.ddit.Infra.rncSchedule.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.Infra.rncSchedule.dao.rncScheduleDAO;
import kr.or.ddit.Infra.stock.dao.StockDAO;
import kr.or.ddit.Infra.vo.repairLogVO;
import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.Infra.vo.rncScheduleVO;
import kr.or.ddit.Infra.vo.stockUseDetailVO;
import kr.or.ddit.Infra.vo.stockUseVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class rncScheduleServcieImpl implements rncScheduleService {

	@Inject
	private rncScheduleDAO dao;
	
	@Inject
	private StockDAO stockDAO;
	//유지보수 일정등록
	@Override
	public boolean createRncSchedule(rncScheduleVO rncSchedule) {
		int count = dao.insertRncSchedule(rncSchedule);
		return count > 0;
	}
	//청소 일정등록
	@Override
	public boolean createRecSchedule(rncScheduleVO rncSchedule) {
		int count = dao.insertRecSchedule(rncSchedule);
		return count > 0;
	}
	// 청소 일정조회
	@Override
	public List<rncScheduleVO> retrieveRecScheduleList(PaginationInfo paging) {
		return dao.selectRecScheduleList(paging);
	}
//	 유지보수 일정조회 
	@Override
	public List<rncScheduleVO> retrieveScheduleList(PaginationInfo paging) {
		return dao.selectScheduleList(paging);
	}
	@Override
	public List<rncScheduleVO> retrieveScheduleList() {
		return dao.selectScheduleListNP();
	}
	@Override
	public boolean sttsUpdate(rncReqVO rncReq) {
		int count  = dao.updateStts(rncReq);
		return count > 0;
	}
	@Override
	public boolean sttsUpdateRL(repairLogVO repLog) {
		int count  = dao.updateSttsRL(repLog);
		return count > 0;
	}
	@Override
	public rncScheduleVO selectSchedule(String rsId) {
		
		return dao.selectScheduleOne(rsId);
	}
	@Override
	public List<stockVO> retrieveStockList(String stNm) {
		return stockDAO.selectStockListToReq(stNm);
	}
	
	@Override
	public ServiceResult updateRncSchedule(rncScheduleVO rncSchedule) {
		return dao.modifyRncSchedule(rncSchedule) > 0? ServiceResult.OK : ServiceResult.FAIL;
	}
	@Override
	public ServiceResult insertStockUseDetail(stockUseDetailVO stockUse) {
		return dao.insertStockUseList(stockUse) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	@Override
	public rncScheduleVO selectOneRsSuId(String rsId) {
		return dao.selectRsSuId(rsId);
	}
	@Override
	public ServiceResult insertStockUse(stockUseVO stockUseVO) {
		
		return dao.createSuId(stockUseVO) > 0? ServiceResult.OK : ServiceResult.FAIL;
	}
	@Override
	public ServiceResult modifyStockCnt(stockVO stockVO) {
		return dao.updateStockCnt(stockVO)> 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	@Override
	public ServiceResult modifySttsPC(String rsId) {
		return dao.updateSttsPC(rsId) > 0? ServiceResult.OK : ServiceResult.FAIL;
	}
	@Override
	public List<rncScheduleVO> retrieveScheduleWt(PaginationInfo paging) {
		long totalRecord = dao.selectTotalWt(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectScheduleWt(paging);
	}
	@Override
	public List<rncScheduleVO> retrieveSchedulePg(PaginationInfo paging) {
		long totalRecord = dao.selectTotalPg(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectSchedulePg(paging);
	}
	@Override
	public List<rncScheduleVO> retrieveScheduleDl(PaginationInfo paging) {
		long totalRecord = dao.selectTotalDl(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectScheduleDl(paging);
	}
	@Override
	public List<rncScheduleVO> retrieveScheduleDlNP() {
		return dao.selectScheduleDlNP();
	}
	@Override
	public List<rncScheduleVO> retrieveScheduleWo(PaginationInfo paging) {
		long totalRecord = dao.selectTotalWo(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectScheduleWo(paging);
	}
	@Override
	public List<rncScheduleVO> retrieveSchedulePc(PaginationInfo paging) {
		long totalRecord = dao.selectTotalPc(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectSchedulePc(paging);
	}
	@Override
	public rncScheduleVO selectSttsToRnc(String rsId) {
		return dao.searchSttsToRnc(rsId);
	}
	@Override
	public repairLogVO selectSttsToRep(String rsId) {
		return dao.searchSttsToRep(rsId);
	}
	@Override
	public List<rncScheduleVO> cRetrieveScheduleWt(PaginationInfo paging) {
		long totalRecord = dao.CselectTotalWt(paging);
		paging.setTotalRecord(totalRecord);
		return dao.CselectScheduleWt(paging);
	}
	@Override
	public List<rncScheduleVO> cRetrieveSchedulePg(PaginationInfo paging) {
		long totalRecord = dao.CselectTotalPg(paging);
		paging.setTotalRecord(totalRecord);
		return dao.CselectSchedulePg(paging);
	}
	@Override
	public List<rncScheduleVO> cRetrieveSchedulePc(PaginationInfo paging) {
		long totalRecord = dao.CselectTotalPc(paging);
		paging.setTotalRecord(totalRecord);
		return dao.CselectSchedulePc(paging);
	}
}

