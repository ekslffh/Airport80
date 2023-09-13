package kr.or.ddit.operate.contract.service;

import java.text.MessageFormat;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.operate.contract.dao.ContractDAO;
import kr.or.ddit.operate.vo.contractVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ContractServiceImpl implements ContractService {

	private final ContractDAO contractDao;
	
	@Override
	public List<contractVO> retrieveList() {
		return contractDao.selectList();
	}

	@Override
	public contractVO retrieveOne(String ctrId) {
		contractVO contract = contractDao.selectOne(ctrId);
		if (contract == null) throw new PKNotFoundException(MessageFormat.format("해당하는 계약내용 없음 {0}", ctrId));
		return contract;
	}

	@Override
	public boolean create(contractVO contract) {
		return contractDao.insert(contract) > 0;
	}

	@Override
	public boolean modify(contractVO contract) {
		return contractDao.update(contract) > 0;
	}

}
