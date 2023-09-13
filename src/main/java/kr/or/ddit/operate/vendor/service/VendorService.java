package kr.or.ddit.operate.vendor.service;

import java.util.List;

import kr.or.ddit.operate.vo.vendorVO;
import kr.or.ddit.vo.PaginationInfo;

public interface VendorService {

	public List<vendorVO> selectVendorList(PaginationInfo paging);
	public vendorVO selectVendor(String vendId);
	
	public boolean createVendor(vendorVO vendor);
	public boolean modifyVendor(vendorVO vendor);
	public boolean modifyVendStatus(vendorVO vendor);
	public List<vendorVO> selectVendorCos();
	
}
