package kr.or.ddit.map.service;

import java.util.List;

import kr.or.ddit.safety.vo.ZoneVO;

public interface MapService {

	public List<ZoneVO> retrieveZoneWithCDNList();
	
	public List<ZoneVO> retrieveZoneWithCDN(String zoneCd);
}
