package kr.or.ddit.accounting.accounting.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.accounting.accountcategory.vo.AccountCategoryVO;
import kr.or.ddit.accounting.accounting.vo.AccountingVO;
import kr.or.ddit.accounting.accounting.vo.AmountCategoryVO;
import kr.or.ddit.accounting.accounting.vo.AmountMonthVO;
import kr.or.ddit.accounting.budget.vo.BudgetVO;

/**
 * 회계내역 관리용 퍼시스턴스 레이어
 */
@Mapper
public interface AccountingDAO {
	/**
	 * 전체 회계 내역 가져오기 : 회계부서에서만 조회가능
	 * @return 전체 회계 내역 리스트, 없으면 size 0인 리스트 반환
	 */
	public List<AccountingVO> selectList(BudgetVO budget);
	/**
	 * 직원별 회계 내역 가져오기 : 일반직원은 자신이 적은 회계내역만 조회가능
	 * @param accWriter : 작성자
	 * @return 특정 직원이 작성한 회계내역 리스트, 없으면 size 0인 리스트 반환
	 */
	public List<AccountingVO> selectListByEmp(String accWriter);
	/**
	 * 부서별 회계 내역 가져오기 
	 * 	: 각 부서의 ROLE_ADMIN 권한을 가지고 있는 직원은 해당부서 전체 회계내역 조회가능
	 * @param deptNo : 부서번호
	 * @return 부서별 회계내역 리스트, 없으면 size 0인 리스트 반환
	 */
	public List<AccountingVO> selectListByDept(BudgetVO budget);
	/**
	 * 특정 회계 내역 가져오기
	 * @param accId : 가져올 회계내역 아이디
	 * @return 없으면 null 반환
	 */
	public AccountingVO selectOne(String accId);
	
//	-- 특정 분기 카테고리별 합산 금액 보기
	public List<AmountCategoryVO> getAmountByCategoryAndQrt(BudgetVO budget);
//	-- 월별 합산 금액 보기
	public List<AmountMonthVO> getAmountByMonth(BudgetVO budget);

	/**
	 * 회계 내역 작성하기
	 * @param accounting : 추가할 회계내역 정보
	 * @return 추가된 내역개수 > 0 성공
	 */
	public int insert(AccountingVO accounting);
	/**
	 * 회계 내역 수정하기
	 * @param accounting : 수정할 회계내역 정보
	 * @return 수정된 내역개수 > 0 성공
	 */
	public int update(AccountingVO accounting);
	/**
	 * 회계 내역 삭제하기
	 * @param accounting : 삭제할 회계내역 아이디
	 * @return 삭제된 내역개수 > 0 성공
	 */
	public int delete(String accId);
}
