package kr.or.ddit.Infra.supplier.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.Infra.vo.supplierVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaginationInfo;



public interface SupplierService {

	public List<supplierVO> retrieveOcList(PaginationInfo paging);
	
	public supplierVO selectoneRetrieve(String sprId);
	
	public ServiceResult createSupplier(supplierVO supplier);
	
	public ServiceResult modifySupplier(supplierVO supplier);
	
	public List<supplierVO> retrieveCcList(PaginationInfo paging);
	
	public supplierVO selectCCRetrieve(String sprId);
	

}
