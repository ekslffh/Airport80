package kr.or.ddit.map.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.operate.lostItem.dao.ZoneDAO;
import kr.or.ddit.safety.vo.ZoneVO;

@Service
public class MapServiceImpl implements MapService {

	@Inject
	private ZoneDAO dao;
	
	@Override
	public List<ZoneVO> retrieveZoneWithCDNList() {
		return dao.selectZoneWithCdnList();
	}

	@Override
	public List<ZoneVO> retrieveZoneWithCDN(String zoneCd) {
		return dao.selectZoneWithCdn(zoneCd);
	}
	
}
