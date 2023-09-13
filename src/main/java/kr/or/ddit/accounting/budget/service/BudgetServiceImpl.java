package kr.or.ddit.accounting.budget.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import kr.or.ddit.accounting.budget.dao.BudgetDAO;
import kr.or.ddit.accounting.budget.vo.BudgetVO;
import kr.or.ddit.vo.PaginationInfo;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BudgetServiceImpl implements BudgetService {
    
    private final BudgetDAO budgetDAO;
    
    @Override
    public long selectTotalRecord(PaginationInfo paging) {
        return budgetDAO.selectTotalRecord(paging);
    }

    @Override
    public List<BudgetVO> getBudgetList(PaginationInfo paging) {
    	long totalRecord = budgetDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
        return budgetDAO.BudgetList(paging);
    }

    @Override
    public BudgetVO getBudget(String budId) {
        return budgetDAO.getBudget(budId);
    }

    @Override
    public boolean insertBudget(BudgetVO budget) {
        return budgetDAO.insertBudget(budget) > 0;
    }

    @Override
    public boolean updateBudget(BudgetVO budget) {
        return budgetDAO.updateBudget(budget) > 0;
    }

    @Override
    public boolean deleteBudget(String budId) {
        return budgetDAO.deleteBudget(budId) > 0;
    }

	@Override
	public Map<String, BudgetVO> retrieveListByDeptAndYear(BudgetVO budget) {
		Map<String, BudgetVO> budgetMap = new HashMap<String, BudgetVO>();
		
		// 분기별로 가져와서 정보 넣어주기
		budget.setBudQuarter(1);
		budgetMap.put("oneq", budgetDAO.getByDeptAndYearAndQuarter(budget));
		
		budget.setBudQuarter(2);
		budgetMap.put("twoq", budgetDAO.getByDeptAndYearAndQuarter(budget));
		
		budget.setBudQuarter(3);
		budgetMap.put("threeq", budgetDAO.getByDeptAndYearAndQuarter(budget));
		
		budget.setBudQuarter(4);
		budgetMap.put("fourq", budgetDAO.getByDeptAndYearAndQuarter(budget));
		
		return budgetMap;
	}

	@Override
	public boolean removeByYearAndDeptNo(BudgetVO budget) {
		return budgetDAO.deleteByYearAndDeptNo(budget) >= 4;
	}
}
