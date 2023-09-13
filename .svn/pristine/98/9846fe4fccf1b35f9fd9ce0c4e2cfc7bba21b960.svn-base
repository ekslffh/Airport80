package kr.or.ddit.accounting.budgetdetail.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.accounting.budgetdetail.dao.BudgetDetailDAO;
import kr.or.ddit.accounting.budgetdetail.vo.budgetDetailVO;
import kr.or.ddit.vo.PaginationInfo;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BudgetDetailServiceImpl implements BudgetDetailService {

    private final BudgetDetailDAO dao;

    @Override
    public long selectTotalRecord(PaginationInfo paging) {
        return dao.selectTotalRecord(paging);
    }

    @Override
    public List<budgetDetailVO> getAllBudgetDetailList(PaginationInfo paging) {
        long totalRecord = dao.selectTotalRecord(paging);
        paging.setTotalRecord(totalRecord);
        return dao.getAllBudgetDetailList(paging);
    }

    @Override
    public  List<budgetDetailVO> getBudgetDetailById(String bdId) {
        return dao.getBudgetDetailById(bdId);
    }

    @Override
    public boolean insertBudgetDetail(budgetDetailVO budgetDetail) {
       return dao.insertBudgetDetail(budgetDetail);
    }

    @Override
    public boolean updateBudgetDetail(budgetDetailVO budgetDetail) {
    	return dao.updateBudgetDetail(budgetDetail);
    }

    @Override
    public boolean deleteBudgetDetail(String bdId) {
       return dao.deleteBudgetDetail(bdId);
    }

	@Override
	public budgetDetailVO getBudgetDetail(budgetDetailVO budgetDetail) {
		 return dao.getBudgetDetail(budgetDetail);
	}

	@Override
	public boolean removeByYearAndDeptNo(BudgetVO budget) {
		return dao.deleteByYearAndDeptNo(budget) > 0;
	}

}
