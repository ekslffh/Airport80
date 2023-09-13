package kr.or.ddit.operate.custNoticeBrd.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.operate.vo.CustNoticeBrdVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public interface CustNoticeBrdService {
	
	public boolean createCnb(CustNoticeBrdVO cnb);
	
	public List<CustNoticeBrdVO> retrieveCnbList(PaginationInfo paging);
	
	public CustNoticeBrdVO retrieveCnb(int cnbNo);
	
	public boolean modifyCnb(CustNoticeBrdVO cnb);
	
	public boolean removeCnb(int cnbNo);
	
	public void increaseViews(int cnbVws);

}
