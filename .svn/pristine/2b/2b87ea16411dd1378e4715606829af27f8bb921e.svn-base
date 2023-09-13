package kr.or.ddit.accounting.budgetreq.service;

import java.util.List;

import kr.or.ddit.accounting.budgetreq.vo.BudgetReqVO;
import kr.or.ddit.vo.PaginationInfo;

public interface BudgetReqService {

	public List<BudgetReqVO> getAllBudgetReqList(PaginationInfo paging);
	public List<BudgetReqVO> getAllBudgetReqListDAO();
	public List<BudgetReqVO> getDeptBudgetReqListDAO(String deptNo);
	
	public BudgetReqVO getBudgetReq(String bgRId);
	public int insertBudgetReq(BudgetReqVO BudgetReq);
	public int updateBudgetReq(BudgetReqVO BudgetReq);
	public int deleteBudgetReq(String bgRId);
	
	//수정폼 입력값
	public BudgetReqVO retrieveBudUdForm(String bdRid);

}
