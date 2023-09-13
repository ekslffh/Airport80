package kr.or.ddit.Infra.rncReq.service;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.Infra.rncReq.dao.rncDAO;
import kr.or.ddit.Infra.stock.dao.StockDAO;
import kr.or.ddit.Infra.vo.rncReqVO;
import kr.or.ddit.Infra.vo.stockVO;
import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class rncServiceImpl implements rncService {

	@Inject
	private rncDAO dao;
	
	@Inject
	private AtchFileService atchService;
	

	@Inject
	private StockDAO stockDAO;
	@Value("#{appInfo.ifAtchPath}")

	private Resource atchPath;
	
	@Override
	public boolean createRncReq(rncReqVO rncVO) {
		processAtchFileGroup(rncVO);
		return dao.insertRncReq(rncVO) > 0;
	}

	private void processAtchFileGroup(rncReqVO rnc) {
		MultipartFile[] rncFiles = rnc.getFlFiles();
		if (rncFiles == null) return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for (MultipartFile rncFile : rncFiles) {
			if (rncFile.isEmpty()) continue;
			detailList.add(new AtchFileDetailVO(rncFile));
		}
		if (detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);
			// 1. 첨부파일의 메타 데이터 저장
			// 2. 첨부파일의 2진 데이터 저장
			try {
				if (StringUtils.isNotBlank(rnc.getAtchFileId())) {
					atchService.removeAtchFileGroup(rnc.getAtchFileId(), atchPath);
				}
				fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
				atchService.createAtchFileGroup(fileGroup, atchPath);
//				rnc.setAtchFileId(fileGroup.getAtchFileId());
				rnc.setRrImg(fileGroup.getAtchFileId());
				fileGroup.setAtchFileId(rnc.getAtchFileId());
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}

	//유지보수 요청 조회
	@Override
	public List<rncReqVO> retrieveRReqList(PaginationInfo paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectRReqList(paging);
	}
	
	//청소 요청 조회
		@Override
		public List<rncReqVO> retrieveCReqList(PaginationInfo paging) {
			long totalRecord = dao.selectTotalRecordtoREC(paging);
			paging.setTotalRecord(totalRecord);
			return dao.selectCReqList(paging);
		}
	
	// 상세조회
		@Override
		public rncReqVO retrieveRncReq(String rrId) {
			rncReqVO rncReq = dao.selectRncReq(rrId);
			
			if(rncReq == null) {
				throw new PKNotFoundException(MessageFormat.format("{0} 요청 없음", rrId));
			}
			return rncReq;
		}

		@Override
		public ServiceResult modifyRncReq(rncReqVO rncReq) {
			return dao.updateRncReq(rncReq) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}

		@Override
		public List<rncReqVO> wtRepLogList(PaginationInfo paging) {
			long totalRecord = dao.selectTotalRecord(paging);
			paging.setTotalRecord(totalRecord);
			return dao.selectedWtRncReq(paging);
		}

		@Override
		public List<rncReqVO> pgRepLogList(PaginationInfo paging) {
			long totalRecord = dao.selectTotalRecord(paging);
			paging.setTotalRecord(totalRecord);
			return  dao.selectedPgRncReq(paging);
		}

		@Override
		public List<rncReqVO> dlRepLogList(PaginationInfo paging) {
			long totalRecord = dao.selectTotalRecord(paging);
			paging.setTotalRecord(totalRecord);
			return dao.selectedDlRncReq(paging);
		}

		@Override
		public List<rncReqVO> woRepLogList(PaginationInfo paging) {
			long totalRecord = dao.selectTotalRecord(paging);
			paging.setTotalRecord(totalRecord);
			return  dao.selectedWoRncReq(paging);
		}

		@Override
		public List<rncReqVO> pcRepLogList(PaginationInfo paging) {
			long totalRecord = dao.selectTotalRecord(paging);
			paging.setTotalRecord(totalRecord);
			return  dao.selectedPcRncReq(paging);
		}

		@Override
		public List<rncReqVO> cpRepLogList(PaginationInfo paging) {
			long totalRecord = dao.selectTotalRecord(paging);
			paging.setTotalRecord(totalRecord);
			return  dao.selectedCpRncReq(paging);
		}

		@Override
		public List<rncReqVO> cwtReqLogList(PaginationInfo paging) {
			long totalRecord = dao.selectTotalRecordtoREC(paging);
			paging.setTotalRecord(totalRecord);
			return dao.selectedCwtRncReq(paging);
		}

		@Override
		public List<rncReqVO> ccpReqLogList(PaginationInfo paging) {
			long totalRecord = dao.selectTotalRecordtoREC(paging);
			paging.setTotalRecord(totalRecord);
			return dao.selectedCcpRncReq(paging);
		}

		//수정폼 입력값 
		@Override
		public rncReqVO retrieveRncUdpForm(String rrId) {
			return dao.selectRncUdtForm(rrId);
		}
		
		// 'WT'로 상태 업데이트 
		@Override
		public ServiceResult updateSttsWT(String rsId) {
			return dao.modifySttsWt(rsId)>0 ? ServiceResult.OK : ServiceResult.FAIL;
		}
		
		//'PG'로 상태 업데이트
		@Override
		public ServiceResult updateSttsPG(String rsId) {
			return dao.modifySttsPg(rsId)>0? ServiceResult.OK : ServiceResult.FAIL;
		}
		//'WO'로 상태 업데이트
		@Override
		public ServiceResult updateSttsDL(String rsId) {
			return dao.modifySttsDl(rsId)>0? ServiceResult.OK : ServiceResult.FAIL;
		}

		@Override
		public ServiceResult CupdateSttsWT(String rsId) {
			return dao.CmodifySttsWt(rsId) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}

		
}
