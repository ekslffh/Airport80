package kr.or.ddit.common.account.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import kr.or.ddit.common.vo.AccountVO;
import kr.or.ddit.vo.PaginationInfo;

public interface AccountService extends UserDetailsService {
	
	public List<AccountVO> retrieveAccountList(PaginationInfo paging);
	public AccountVO retrieveAccount(int accId);
	
	public boolean createAccount(AccountVO account);
	public boolean modifyAccount(AccountVO account);
	public boolean removeAccount(AccountVO account);
}
