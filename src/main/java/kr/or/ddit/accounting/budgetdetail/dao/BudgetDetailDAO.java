package kr.or.ddit.accounting.budgetdetail.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.accounting.budgetdetail.vo.budgetDetailVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface BudgetDetailDAO {
	
	public long selectTotalRecord(PaginationInfo paging);
	public List<budgetDetailVO> getAllBudgetDetailList(PaginationInfo paging);
	
	List<budgetDetailVO> getBudgetDetailById(String budId);
	budgetDetailVO getBudgetDetail(budgetDetailVO budgetDetail);
    public boolean insertBudgetDetail(budgetDetailVO budgetDetail);
    public boolean updateBudgetDetail(budgetDetailVO budgetDetail);
    public boolean deleteBudgetDetail(String bdId);
    
    /**
     * 연도와 부서번호 기준으로 전체 데이터 일괄삭제처리하기
     * @return 삭제된 데이터의 개수 리턴
     */
    public int deleteByYearAndDeptNo(BudgetVO budget);
}
