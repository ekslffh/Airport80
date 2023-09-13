package kr.or.ddit.operate.bidApplication.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.operate.vo.bidApplicationVO;
import kr.or.ddit.operate.vo.bidNoticeVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public interface BidApplService {
	
	public boolean createBa(bidApplicationVO ba);
	
	public List<bidApplicationVO> retrieveBaList(PaginationInfo paging);
	
	public bidApplicationVO retrieveBa(String baId);
	
	public boolean modifyBa(bidApplicationVO ba);
	
	public boolean removeBa(String baId);
	
	public boolean modifyBaStatus(bidApplicationVO ba);
	
	public List<bidApplicationVO> retrieveNoBaList(int bnNo);
	

}
