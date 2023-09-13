package kr.or.ddit.accounting.accounting.service;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.accounting.accounting.dao.AccountingDAO;
import kr.or.ddit.accounting.accounting.vo.AccountingVO;
import kr.or.ddit.accounting.accounting.vo.AmountCategoryVO;
import kr.or.ddit.accounting.accounting.vo.AmountMonthVO;
import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.exception.PKNotFoundException;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AccountingServiceImpl implements AccountingService {

	private final AccountingDAO accountingDao;
	
	private final AtchFileService atchService;
	
	@Value("#{appInfo.accAtchPath}")
	private Resource atchPath;
	
	@Override
	public List<AccountingVO> retrieveList(BudgetVO budget) {
		return accountingDao.selectList(budget);
	}

	@Override
	public List<AccountingVO> retrieveListByEmp(String accWriter) {
		return accountingDao.selectListByEmp(accWriter);
	}

	@Override
	public List<AccountingVO> retrieveListByDept(BudgetVO budget) {
		return accountingDao.selectListByDept(budget);
	}

	@Override
	public AccountingVO retrieveOne(String accId) throws PKNotFoundException {
		AccountingVO accounting = accountingDao.selectOne(accId);
		if (accounting == null) throw new PKNotFoundException(MessageFormat.format("{0} 해당하는 회계내역 없음.", accId));
		return accounting; 
	}

	private void processAtchFileGroup(AccountingVO accounting) {
		MultipartFile[] accFiles = accounting.getAccFiles();
		if (accFiles == null) return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for (MultipartFile accFile : accFiles) {
			if (accFile.isEmpty()) continue;
			detailList.add(new AtchFileDetailVO(accFile));
		}
		if (detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);
			// 1. 첨부파일의 메타 데이터 저장
			// 2. 첨부파일의 2진 데이터 저장
			try {
				if (StringUtils.isNotBlank(accounting.getAccImg())) {
					// 운항일지 수정인경우 첨부파일 데이터 전부 삭제하고 다시 생성
					atchService.removeAtchFileGroup(accounting.getAccImg(), atchPath);
				}
				// 운항일지 작성
				fileGroup.setAtchFileId(UUID.randomUUID().toString().substring(0, 20));
				atchService.createAtchFileGroup(fileGroup, atchPath);
				accounting.setAccImg(fileGroup.getAtchFileId());
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	@Override
	public boolean create(AccountingVO accounting) {
		processAtchFileGroup(accounting);
		return accountingDao.insert(accounting) > 0;
	}

	@Override
	public boolean modify(AccountingVO accounting) {
		processAtchFileGroup(accounting);
		return accountingDao.update(accounting) > 0;
	}

	@Override
	public boolean remove(String accId) {
		AccountingVO accounting = accountingDao.selectOne(accId);
		boolean success = true;
		if (accounting.getAccImg() != null) {
			try {
				success = atchService.removeAtchFileGroup(accounting.getAccImg(), atchPath);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		if (success) {
			return accountingDao.delete(accId) > 0;
		}
		return false;
	}

	@Override
	public Map<String, List<String>> getAmountByCategoryAndQrt(BudgetVO budget) {
		Map<String, List<String>> result = new HashedMap<String, List<String>>();
		result.put("lables", new ArrayList<String>());
		result.put("values", new ArrayList<String>());
		List<AmountCategoryVO> amountCategories = accountingDao.getAmountByCategoryAndQrt(budget);
		for (int i = 0; i < amountCategories.size(); i++) {
			if (i > 4) break;
			AmountCategoryVO amountCtgr = amountCategories.get(i);
			result.get("lables").add(amountCtgr.getName());
			result.get("values").add(amountCtgr.getAmt().toString());
		}
		return result;
	}

	@Override
	public List<AmountMonthVO> getAmountByMonth(BudgetVO budget) {
		return accountingDao.getAmountByMonth(budget);
	}

}
