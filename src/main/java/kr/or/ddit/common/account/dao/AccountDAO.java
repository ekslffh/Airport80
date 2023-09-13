package kr.or.ddit.common.account.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.common.vo.AccountVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface AccountDAO {

	public AccountVO selectAccountForAuth(String accId);
	
	// 삽입
	public int insertAccount(AccountVO account);
	
	// 상세 조회
	public AccountVO selectAccount(int accId);
	
	// 페이징
	public long selectTotalRecord(PaginationInfo paging);
	
	// 전체 조회
	public List<AccountVO> selectAccountList(PaginationInfo paging);
	
	// 수정
	public int updateAccount(AccountVO account);
	
	// 삭제
	public int deleteAccount(@Param("accId") AccountVO account);
}
