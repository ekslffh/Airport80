
package kr.or.ddit.operate.vendor.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.operate.vo.vendorVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface VendorDAO {
	
	public List<vendorVO> selectVendorList(PaginationInfo paging);
	public List<vendorVO> selectVendorCos();
	public vendorVO selectVendor(String vendId);

	public long selectTotalRecord(PaginationInfo paging);
	
	public int insertVendor(vendorVO vendor);
	public int updateVendor(vendorVO vendor);
	public int updateVendStatus(vendorVO vendor);
	
	
	
}
