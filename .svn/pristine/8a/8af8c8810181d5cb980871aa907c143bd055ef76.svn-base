package kr.or.ddit.safety.confiscationInfo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.safety.confiscationInfo.dao.ConfiscationInfoDAO;
import kr.or.ddit.safety.vo.ConfiscationInfoVO;
import kr.or.ddit.safety.vo.LiquidVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class ConfiscationInfoServiceImpl implements ConfiscationInfoService {

	@Inject
	private ConfiscationInfoDAO dao;
	
	@Override
	public List<ConfiscationInfoVO> retrieveConfisInfoList(PaginationInfo paging) {
		
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectConfisInfoList(paging);
	}
	
	// 액체물 전체조회
	public List<LiquidVO> retrieveLiquidList(){
		return dao.selectLiquidList();
	}

	// 등록
	@Override
	public int createConfisInfo(ConfiscationInfoVO confisInfo) {
		return dao.insertConfisInfo(confisInfo);
	}

	// 상세조회
	@Override
	public ConfiscationInfoVO retrieveConfisInfo(int ciNo) {
		return dao.selectConfisInfo(ciNo);
	}

	// 수정
	@Override
	public int modifyConfisInfo(ConfiscationInfoVO confisInfo) {
		return dao.updateConfisInfo(confisInfo);
	}

	// 삭제
	@Override
	public int removeConfisInfo(int ciNo) {
		return dao.deleteConfisInfo(ciNo);
	}

}
