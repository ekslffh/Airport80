package kr.or.ddit.operate.lostItem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CommonCodeVO;

@Mapper
public interface CommonDAO {
	
	List<CommonCodeVO> selectCommonList();
	
	List<CommonCodeVO> selectStatusList();

}
