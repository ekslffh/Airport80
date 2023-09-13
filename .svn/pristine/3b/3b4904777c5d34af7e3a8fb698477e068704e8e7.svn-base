package kr.or.ddit.operate.busLog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.operate.vo.busLogVO;
import kr.or.ddit.vo.PaginationInfo;

@Mapper
public interface BusLogDAO {
	
	public int insertBlog(busLogVO blog);
	
	public long selectTotalRecord(PaginationInfo paging);
	
	public List<busLogVO> selectBlogList(PaginationInfo paging);
	
	public busLogVO selectBlog(String blogId);
	
	public int updateBlog(busLogVO blog);
	
	public int deleteBlog(String blogId);

}
