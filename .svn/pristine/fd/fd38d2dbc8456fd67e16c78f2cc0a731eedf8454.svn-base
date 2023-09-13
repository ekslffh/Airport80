package kr.or.ddit.operate.busLog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.operate.busLog.dao.BusLogDAO;
import kr.or.ddit.operate.vo.busLogVO;
import kr.or.ddit.vo.PaginationInfo;

@Service
public class BusLogServiceImpl implements BusLogService{
	
	@Inject
	private BusLogDAO dao;

	@Override
	public boolean createBlog(busLogVO blog) {
		return dao.insertBlog(blog) > 0 ;
	}

	@Override
	public List<busLogVO> retrieveBlogList(PaginationInfo paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectBlogList(paging);
	}

	@Override
	public busLogVO retrieveBlog(String blogId) {
		return dao.selectBlog(blogId);
	}

	@Override
	public boolean modifyBlog(busLogVO blog) {
		return dao.updateBlog(blog) > 0 ;
	}

	@Override
	public boolean removeBlog(String blogId) {
		return dao.deleteBlog(blogId) > 0 ;
	}
	
	

}
