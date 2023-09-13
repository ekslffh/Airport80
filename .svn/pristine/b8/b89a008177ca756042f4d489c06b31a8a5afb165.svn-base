package kr.or.ddit.accounting.budget.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.vo.PaginationInfo;

public interface BudgetService {
	public long selectTotalRecord(PaginationInfo paging);
	
	public Map<String, BudgetVO> retrieveListByDeptAndYear(BudgetVO budget);
	
	public List<BudgetVO> getBudgetList(PaginationInfo paging);
	public BudgetVO getBudget(String budId);
	public boolean insertBudget(BudgetVO budget);
	public  boolean updateBudget(BudgetVO budget);
	public boolean deleteBudget(String budId);
	
	
	/*
	 * 특정 연도의 특정 부서 예산책정 데이터 삭제하기
	 * @param budget : 필요데이터 budYear, deptNo
	 * @return 1~4분기로 4개의 데이터가 지워져야 삭제 성공한것
	 */
	public boolean removeByYearAndDeptNo(BudgetVO budget);
}
