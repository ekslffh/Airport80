package kr.or.ddit.map.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.map.service.MapService;
import kr.or.ddit.safety.vo.ZoneVO;
import kr.or.ddit.vo.cacaomapadapter.CacaoMapAreaEvent;
import kr.or.ddit.vo.cacaomapadapter.ZoneWSDNWrapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MapZoneController {
	
	private final MapService mapService;
	
	@RequestMapping(value = "/zone/zoneAreaList.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<CacaoMapAreaEvent<ZoneVO>> ZoneAreaList() {
		
		List<ZoneVO> zoneWCdnList = mapService.retrieveZoneWithCDNList();
		
		return zoneWCdnList.stream().map(ZoneWSDNWrapper::new).collect(Collectors.toList());
	}
	
	@RequestMapping(value = "/zone/zoneArea.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<CacaoMapAreaEvent<ZoneVO>> ZoneArea(
			@RequestParam("zoneCd") String zoneCd
			) {
		
		List<ZoneVO> zoneWCdn = mapService.retrieveZoneWithCDN(zoneCd);
		
		return zoneWCdn.stream().map(ZoneWSDNWrapper::new).collect(Collectors.toList());
	}
	
}
