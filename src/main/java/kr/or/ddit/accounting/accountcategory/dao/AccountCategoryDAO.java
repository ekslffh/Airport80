package kr.or.ddit.accounting.accountcategory.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface AccountCategoryDAO {
	
	public long selectTotalRecord(PaginationInfo paging);
	public List<AccountCategoryVO> getAllAccountCategoriesList(PaginationInfo paging);
	public List<AccountCategoryVO> getAllAccountCategoriesListSimple();
    
	public AccountCategoryVO getAccountCategoryById(String acaId);
	public boolean insertAccountCategory(AccountCategoryVO accountCategory);
	public int updateAccountCategory(AccountCategoryVO accountCategory);
	public int deleteAccountCategory(String acaId);
	public int deleteMultipleAccountCategories(List<String> accountIds);
}
