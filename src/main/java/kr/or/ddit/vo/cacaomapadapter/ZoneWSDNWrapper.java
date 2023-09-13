package kr.or.ddit.vo.cacaomapadapter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.safety.vo.ZoneCdnVO;
import kr.or.ddit.safety.vo.ZoneVO;

public class ZoneWSDNWrapper extends CacaoMapAreaEvent<ZoneVO> {

	public ZoneWSDNWrapper(ZoneVO adaptee) {
		super(adaptee);
	}

	@Override
	public String getName() {
		return getData().getZoneCd();
	}

	@Override
	public Map[] getPath() {
	    Map<String, List<Map<String, Double>>> pathMap = new HashMap<>();
	    List<ZoneCdnVO> cdnList = getData().getCdnList();
	    
	    // cdnList를 stream으로 변환하여 pathMap에 데이터 추가
	    return cdnList.stream().map(cdn -> {
	        String zoneCd = cdn.getZoneCd();
	        double cdnLa = cdn.getCdnLa();
	        double cdnMa = cdn.getCdnMa();
	        
	        Map<String, Double> coordMap = new HashMap<>();
	        coordMap.put("la", cdnLa);
	        coordMap.put("ma", cdnMa);
	        return coordMap;
//	        pathMap.computeIfAbsent(zoneCd, k -> new ArrayList<>())
//	               .add(coordMap);
	    }).toArray(Map[]::new);
	    
	}
}
