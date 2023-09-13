package kr.or.ddit.operate.vendor.service;

import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.account.dao.AccountDAO;
import kr.or.ddit.common.vo.AccountVO;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import kr.or.ddit.operate.contract.dao.ContractDAO;
import kr.or.ddit.operate.vendor.dao.VendorDAO;
import kr.or.ddit.operate.vo.contractVO;
import kr.or.ddit.operate.vo.vendorVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class VendorServiceImpl implements VendorService {
	
	@Inject
	private VendorDAO vendorDAO;
	
	@Inject
	private AccountDAO accountDAO;
	
	@Inject ContractDAO contractDAO;

	@Override
	public List<vendorVO> selectVendorList(PaginationInfo paging) {
		long totalRecord = vendorDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		
		return vendorDAO.selectVendorList(paging);
	}

	@Override
	public vendorVO selectVendor(String vendId) {
		return vendorDAO.selectVendor(vendId);
	}

	@Override
	public boolean createVendor(vendorVO vendor) {
		AccountVO av = new AccountVO();
		contractVO cv = new contractVO();

		// 현재 사용자의 Authentication 객체 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// 현재 사용자의 이름(username) 가져오기
		String empNo = authentication.getName();
		
		Random random = new Random();

        // 0부터 9999 사이의 난수 생성 (4자리 숫자)
        int ctrIdNo = random.nextInt(100);

        // 생성된 난수 출력 (4자리로 표시하기 위해 문자열로 변환)
        String ctrId = String.format("%02d", ctrIdNo);
        System.out.println("ctrId : " + "12"+ctrId);
        
		// 계약생성
	    cv.setEmpNo(empNo);
	    cv.setCtrId("12" + ctrId);
  		cv.setCtrStatus("V00");
  		cv.setCtrMemo(vendor.getVendType());
		int cnt = contractDAO.insert(cv);
		
		// 업체생성
		vendor.setVendCtrId(cv.getCtrId());
		cnt += vendorDAO.insertVendor(vendor);
		
		// 계정생성
		av.setAccInfo("VD");
		av.setAccAuth("ROLE_COMP");
		av.setAccId(vendor.getVendId());
		av.setAccPw(vendor.getVendId());
		cnt += accountDAO.insertAccount(av);

		return cnt > 2;
	}

	@Override
	public boolean modifyVendor(vendorVO vendor) {
		return vendorDAO.updateVendor(vendor) > 0;
	}

	@Override
	public boolean modifyVendStatus(vendorVO vendor) {
		return vendorDAO.updateVendStatus(vendor) > 0;
	}

	@Override
	public List<vendorVO> selectVendorCos() {
		return vendorDAO.selectVendorCos();
	}
	


}
