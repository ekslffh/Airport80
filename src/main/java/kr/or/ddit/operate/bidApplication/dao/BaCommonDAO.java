package kr.or.ddit.operate.bidApplication.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CommonCodeVO;

@Mapper
public interface BaCommonDAO {
	
	List<CommonCodeVO> selectBaStuList();
}
