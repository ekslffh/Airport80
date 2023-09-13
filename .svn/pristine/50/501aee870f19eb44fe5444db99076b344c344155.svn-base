package kr.or.ddit.accounting.budget.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface BudgetDAO {
	public long selectTotalRecord(PaginationInfo paging);
	public List<BudgetVO> BudgetList(PaginationInfo paging);
	
	public BudgetVO getByDeptAndYearAndQuarter(BudgetVO budget);
	
	public BudgetVO getBudget(String budId);
	public int insertBudget(BudgetVO budget);
	public int updateBudget(BudgetVO budget);
	public int deleteBudget(String budId);
	
	/*
	 * 특정 연도의 특정 부서 예산책정 데이터 삭제하기
	 * @param budget : 필요데이터 budYear, deptNo
	 * @return 삭제된 데이터의 개수 반환
	 */
	public int deleteByYearAndDeptNo(BudgetVO budget);
}
