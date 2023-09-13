package kr.or.ddit.accounting.budgetreq.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.accounting.budgetreq.dao.BudgetReqDAO;
import kr.or.ddit.accounting.budgetreq.vo.BudgetReqVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class BudgetReqServiceImpl implements BudgetReqService {

    @Inject
    private BudgetReqDAO dao;

    @Override
    public List<BudgetReqVO> getAllBudgetReqList(PaginationInfo paging) {
        long totalRecord = dao.selectTotalRecord(paging);
        paging.setTotalRecord(totalRecord);
        return dao.getAllBudgetReqList(paging);
    }
    @Override
    public List<BudgetReqVO> getAllBudgetReqListDAO() {
        return dao.getAllBudgetReqListDAO();
    }
    
    @Override
	public List<BudgetReqVO> getDeptBudgetReqListDAO(String deptNo) {
		   return dao.getDeptBudgetReqListDAO(deptNo);
	}
	

    @Override
    public BudgetReqVO getBudgetReq(String bgRId) {
        return dao.getBudgetReq(bgRId);
    }

    @Override
    public int insertBudgetReq(BudgetReqVO budgetReq) {
        // 새로운 예산 요청 정보를 생성하여 DAO에 전달
    	int insertedRows = dao.insertBudgetReqDAO(budgetReq);
        return insertedRows;
    }

    @Override
    public int updateBudgetReq(BudgetReqVO budgetReq) {
        return dao.updateBudgetReqDAO(budgetReq);
    }

    @Override
    public int deleteBudgetReq(String bgRId) {
        return dao.deleteBudgetReqDAO(bgRId);
    }
    
    //수정폼 입력값
	@Override
	public BudgetReqVO retrieveBudUdForm(String bgRId) {
		return dao.selectBudUdForm(bgRId);
	}
    
	
	
}
