package kr.or.ddit.hr.common.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CommonCodeVO;

@Mapper
public interface HrCommonDAO {
	
	List<CommonCodeVO> selectEpList();
	
	List<CommonCodeVO> selectRcList();

}
