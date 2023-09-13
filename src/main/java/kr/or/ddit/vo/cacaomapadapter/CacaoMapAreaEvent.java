package kr.or.ddit.vo.cacaomapadapter;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import kr.or.ddit.safety.vo.ZoneCdnVO;

public abstract class CacaoMapAreaEvent<T> {
	
	private T adaptee;
	public CacaoMapAreaEvent(T adaptee) {
		super();
		this.adaptee = adaptee;
	}
	
	public abstract String getName();
	public abstract Map[] getPath();
	
	public T getData() {
		return adaptee;
	}
	
	public Map<String, Object> getExtendedProps() {
		return Collections.singletonMap("data", getData());
	}
	
}
