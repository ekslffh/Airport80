package kr.or.ddit.safety.confiscation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.safety.vo.ConfiscationInfoVO;
import kr.or.ddit.safety.vo.SecurityLogVO;
import kr.or.ddit.safety.vo.SecurityReqVO;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.vo.CommonCodeVO;


@Mapper
public interface OtherDAO {
	
	public List<ConfiscationInfoVO> selectConfisInfoList();
	public List<ZoneVO> selectZoneList();
	public List<SecurityLogVO> selectSecurityList();
	public List<CommonCodeVO> selectSecaList();
	
	public List<ZoneVO> selectAllZoneList();
	
	//보안일지에서 보안접수내역 조회
	public List<SecurityReqVO> selectSecReqList();
	
}
