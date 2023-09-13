package kr.or.ddit.Infra.supplier.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.Infra.supplier.dao.SupplierDAO;
import kr.or.ddit.Infra.vo.supplierVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class SupplierServiceImpl implements SupplierService {

	@Inject
	private SupplierDAO dao;
	
	@Override
	public List<supplierVO> retrieveOcList(PaginationInfo paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.allOcList(paging);
	}

	@Override
	public supplierVO selectoneRetrieve(String sprId) {
		supplierVO supplier = dao.selectOne(sprId);
		return supplier;
	}

	@Override
	public ServiceResult createSupplier(supplierVO supplier) {
		return dao.insertSupplier(supplier) > 0? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifySupplier(supplierVO supplier) {
		return dao.updateSupplier(supplier) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<supplierVO> retrieveCcList(PaginationInfo paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.allCcList(paging);
	}

	@Override
	public supplierVO selectCCRetrieve(String sprId) {
		supplierVO supplier = dao.selectCc(sprId);
		return supplier;
	}



	

}
