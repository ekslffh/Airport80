package kr.or.ddit.Infra.supplier.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.Infra.vo.supplierVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface SupplierDAO {

	// orderCompany
	public List<supplierVO> allOcList(PaginationInfo paging);
	public int insertSupplier(supplierVO supplier);
	public int updateSupplier(supplierVO supplier);
	public supplierVO selectOne(String sprId);
	
	
	// constructionCompany
	public List<supplierVO> allCcList(PaginationInfo paging);
	public supplierVO selectCc(String sprId);

	
	// common
	public long selectTotalRecord(PaginationInfo paging);
	
	// other
	public List<supplierVO> selectSupplier();
	public List<supplierVO> selectSupplierById();

}
