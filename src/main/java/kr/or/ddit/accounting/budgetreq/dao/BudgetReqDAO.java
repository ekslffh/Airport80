package kr.or.ddit.accounting.budgetreq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.accounting.budgetreq.vo.BudgetReqVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface BudgetReqDAO {

	
	public long selectTotalRecord(PaginationInfo paging);
	
	public List<BudgetReqVO> getAllBudgetReqList(PaginationInfo paging);
	public List<BudgetReqVO> getAllBudgetReqListDAO();
	public List<BudgetReqVO> getDeptBudgetReqListDAO(String deptNo);
	public BudgetReqVO getBudgetReq(String bgRId);
	public int insertBudgetReqDAO(BudgetReqVO BudgetReq);
	public int updateBudgetReqDAO(BudgetReqVO BudgetReq);
	public int deleteBudgetReqDAO(String bgRId);
	
	//수정폼 입력값
	public BudgetReqVO selectBudUdForm(String bgRId);
	

	
}
