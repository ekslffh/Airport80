package kr.or.ddit.operate.busLog.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.operate.vo.busLogVO;
import kr.or.ddit.vo.PaginationInfo;


public interface BusLogService {
	
	public boolean createBlog(busLogVO blog);
	
	public List<busLogVO> retrieveBlogList(PaginationInfo paging);
	
	public busLogVO retrieveBlog(String blogId);
	
	public boolean modifyBlog(busLogVO blog);
	
	public boolean removeBlog(String blogId);

}
