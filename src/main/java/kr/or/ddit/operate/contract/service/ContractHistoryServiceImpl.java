package kr.or.ddit.operate.contract.service;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.operate.contract.dao.ContractDAO;
import kr.or.ddit.operate.contract.dao.ContractHistoryDAO;
import kr.or.ddit.operate.vo.contractHistoryVO;
import kr.or.ddit.operate.vo.contractVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ContractHistoryServiceImpl implements ContractHistoryService {

	private final ContractDAO contractDao;
	
	private final ContractHistoryDAO contractHistoryDao;

	private final AtchFileService atchService;

	@Value("#{appInfo.chAtchPath}")
	private Resource atchPath;

	@Override
	public List<contractHistoryVO> retrieveList() {
		return contractHistoryDao.selectList();
	}

	@Override
	public contractHistoryVO retrieveOne(String chId) {
		contractHistoryVO contHistory = contractHistoryDao.selctOne(chId);
		if (contHistory == null)
			throw new PKNotFoundException(MessageFormat.format("해당하는 상세내역 없음 {0}", chId));
		return contHistory;
	}

	private void processAtchFileGroup(contractHistoryVO contractHistory) {
		MultipartFile[] chFiles = contractHistory.getChFiles();
		if (chFiles == null)
			return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for (MultipartFile chFile : chFiles) {
			if (chFile.isEmpty())
				continue;
			detailList.add(new AtchFileDetailVO(chFile));
		}
		if (detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);
			// 1. 첨부파일의 메타 데이터 저장
			// 2. 첨부파일의 2진 데이터 저장
			try {
				if (StringUtils.isNotBlank(contractHistory.getChDoc())) {
					// 운항일지 수정인경우 첨부파일 데이터 전부 삭제하고 다시 생성
					atchService.removeAtchFileGroup(contractHistory.getChDoc(), atchPath);
				}
				// 운항일지 작성
				fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
				atchService.createAtchFileGroup(fileGroup, atchPath);
				contractHistory.setChDoc(fileGroup.getAtchFileId());
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}

	@Override
	public boolean create(contractHistoryVO ch) {
		processAtchFileGroup(ch);
		// 해당하는 계약정보 가져오기
		contractVO contract = contractDao.selectOne(ch.getCtrId());
		if (contract == null) throw new PKNotFoundException(MessageFormat.format("해당하는 계약정보가 없습니다. {0}", ch.getCtrId()));
		// 첫 계약 작성이라면 계약상태를 계약완료로 변경("V02")
		if (contract.getContractHistoryList() == null) {
			contract.setCtrStatus("V02");
		} else {
			// 두번째 계약이라면 계약상태를 계약연장으로 변경("V03")
			contract.setCtrStatus("V03");
		}
		int cnt = contractDao.update(contract);
		cnt += contractHistoryDao.insert(ch);
		return cnt > 1;
	}

	@Override
	public boolean modify(contractHistoryVO ch) {
		processAtchFileGroup(ch);
		return contractHistoryDao.update(ch) > 0;
	}

	@Override
	public boolean remove(String chId) {
		contractHistoryVO contractHistory = contractHistoryDao.selctOne(chId);
		boolean success = true;
		if (contractHistory.getChDoc() != null) {
			try {
				success = atchService.removeAtchFileGroup(contractHistory.getChDoc(), atchPath);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		if (success) {
			return contractHistoryDao.delete(chId) > 0;
		}
		return false;
	}

}
