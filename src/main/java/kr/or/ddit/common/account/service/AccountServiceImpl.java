package kr.or.ddit.common.account.service;

import java.text.MessageFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.account.dao.AccountDAO;
import kr.or.ddit.common.employee.dao.EmployeeDAO;
import kr.or.ddit.common.vo.AccountVO;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class AccountServiceImpl implements AccountService {

	@Inject
	private AccountDAO accountDAO;
	
	@Inject
	private EmployeeDAO employeeDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		AccountVO account = accountDAO.selectAccountForAuth(username);
		if (account == null) {
			throw new UsernameNotFoundException(MessageFormat.format("{0} 사용자 없음", username));
		}
		// employee 정보 가져오기
//		if (account.getAccInfo().equals("EMP")) { // (직원)
			EmployeeVO empVO = employeeDAO.selectEmp(username);
			return new AccountWrapper<EmployeeVO>(account, empVO);
//		} else if (account.getAccInfo().equals("AL")) { // (항공사)
			
//		} else { // VD(입점업체)
			
//		}
	}

	// 전체 조회
	@Override
	public List<AccountVO> retrieveAccountList(PaginationInfo paging) {
		long totalRecord = accountDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		
		return accountDAO.selectAccountList(paging);
	}
	
	// 상세 조회
	@Override
	public AccountVO retrieveAccount(int accId) {
		return accountDAO.selectAccount(accId);
	}

	// 생성
	@Override
	public boolean createAccount(AccountVO account) {
		return accountDAO.insertAccount(account) > 0;
	}

	// 수정
	@Override
	public boolean modifyAccount(AccountVO account) {
		return accountDAO.updateAccount(account) > 0;
	}

	// 삭제
	@Override
	public boolean removeAccount(AccountVO account) {
		return accountDAO.deleteAccount(account) > 0;
	}

}
