package kr.or.ddit.common.requestList.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.requestList.dao.RequestListDAO;
import kr.or.ddit.common.vo.RequestListVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class RequestListServiceImpl implements RequestListService {

	@Inject
	private RequestListDAO dao;
	
	//요청목록 전체조회 
	@Override
	public List<RequestListVO> retrieveAllReqList(PaginationInfo paging) {
		
		//전체갯수 출력 
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectRequestList(paging);
	}

	@Override
	public long countTotalReq(PaginationInfo paging) {
		return dao.selectTotalRecord(paging);
	}

	@Override
	public Map<String, Integer> getAllCnt(String empNo) {
		return dao.getAllCnt(empNo);
	}

	@Override
	public long getAllCount(String empNo) {
		return dao.allCount(empNo);
	}


}
