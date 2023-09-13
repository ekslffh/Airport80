package kr.or.ddit.Infra.stock.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.Infra.vo.lstockVO;
import kr.or.ddit.common.vo.DepartmentVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.vo.CommonCodeVO;

@Mapper
public interface OthersDAO {
	
	public List<ZoneVO> selectZoneList();
	public List<lstockVO> selectlstockList();
	public List<CommonCodeVO> selectCommonList();
	public List<CommonCodeVO> selectCcCommonList();
	/**
	 * 전체 부서 리스트 조회하기
	 */
	public List<DepartmentVO> selectDeptList();
	
	public List<ZoneVO> selectAllZoneList();
	
	public List<CommonCodeVO> selectRncList();
}
