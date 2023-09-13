package kr.or.ddit.common.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

@SuppressWarnings("serial")
public class AccountWrapper<T> extends User {
	private T realUser;
	private String accInfo;

	public AccountWrapper(AccountVO account, T realUser) {
		super(
			account.getAccId(),
			account.getAccPw(),
			!account.isAccDel(), 
			true, 
			true, 
			true, 
			AuthorityUtils.createAuthorityList(account.getAccAuth())
		);
		this.realUser = realUser;
		this.accInfo = account.getAccInfo();
	}
	
	public T getRealUser() {
		return realUser;
	}
	
	public String getAccInfo() {
		return accInfo;
	}
}
