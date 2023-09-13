package kr.or.ddit.accounting.accountcategory.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.accounting.accountcategory.dao.AccountCategoryDAO;
import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;

import kr.or.ddit.vo.PaginationInfo;

@Service
public class AccountCategoryServiceImpl implements AccountCategoryService {

	@Inject
	private AccountCategoryDAO dao;

	@Override
	public List<AccountCategoryVO> getAllAccountCategoriesList(PaginationInfo paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.getAllAccountCategoriesList(paging);
	}

	@Override
	public List<AccountCategoryVO> getAllAccountCategoriesList() {
		return dao.getAllAccountCategoriesListSimple();
	}

	@Override
	public AccountCategoryVO getAccountCategoryById(String acaId) {
		return dao.getAccountCategoryById(acaId);
	}

	@Override
	public boolean insertAccountCategory(AccountCategoryVO accountCategory) {
		return dao.insertAccountCategory(accountCategory);
	}

	@Override
	public int updateAccountCategory(AccountCategoryVO accountCategory) {
		return dao.updateAccountCategory(accountCategory);
	}

	@Override
	public int deleteMultipleAccountCategories(List<String> accountIds) {
		   return dao.deleteMultipleAccountCategories(accountIds);
	}
	@Override
	public int deleteAccountCategory(String acaId) {
		return dao.deleteAccountCategory(acaId);
	}




}
