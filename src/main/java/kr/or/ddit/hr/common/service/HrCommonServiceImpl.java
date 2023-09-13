package kr.or.ddit.hr.common.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.hr.common.dao.HrCommonDAO;
import kr.or.ddit.vo.CommonCodeVO;

@Service
public class HrCommonServiceImpl implements HrCommonService {

	@Inject
	private HrCommonDAO dao;
	
	@Override
	public List<CommonCodeVO> retrieveEpList() {
		return dao.selectEpList();
	}

	@Override
	public List<CommonCodeVO> retrieveRcList() {
		return dao.selectRcList();
	}

}
