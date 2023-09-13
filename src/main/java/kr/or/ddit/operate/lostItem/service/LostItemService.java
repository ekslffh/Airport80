package kr.or.ddit.operate.lostItem.service;

import java.util.List;


import kr.or.ddit.operate.enumpkg.ServiceResult;
import kr.or.ddit.operate.vo.LostItemVO;
import kr.or.ddit.vo.PaginationInfo;

public interface LostItemService {
	
	public ServiceResult createLi(LostItemVO lostItem);
	
	public List<LostItemVO> retrieveLiList(PaginationInfo paging);
	
	public LostItemVO retrieveLi(String liId);
	
	public ServiceResult modifyLi(LostItemVO lostItem);
	
	public ServiceResult modifyLiStatus(LostItemVO lostItem);



}
