package kr.or.ddit.accounting.budgetdetail.service;

import java.util.List;

import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.accounting.budgetdetail.vo.budgetDetailVO;
import kr.or.ddit.vo.PaginationInfo;

public interface BudgetDetailService {
	
	public long selectTotalRecord(PaginationInfo paging);
	public List<budgetDetailVO> getAllBudgetDetailList(PaginationInfo paging);
	
    List<budgetDetailVO> getBudgetDetailById(String bdId);
    budgetDetailVO getBudgetDetail(budgetDetailVO budgetDetail);
    public boolean insertBudgetDetail(budgetDetailVO budgetDetail);
    public boolean updateBudgetDetail(budgetDetailVO budgetDetail);
    public boolean deleteBudgetDetail(String bdId);
    
    /**
     * 연도와 부서번호 기준으로 전체 데이터 일괄삭제처리하기
     * @return 삭제된 데이터의 개수 우선 1개이상 지워지면 성공
     */
    public boolean removeByYearAndDeptNo(BudgetVO budget);
}
