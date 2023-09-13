package kr.or.ddit.atch.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;

@Mapper
public interface AtchFileDAO {
	public AtchFileDetailVO selectAtchFileDetail(AtchFileDetailVO condition);
	public AtchFileVO selectAtchFileGroup(String atchFileId);
	public int insertAtchFileGroup(AtchFileVO atchFileGroup);
	public int updateAtchFileGroup(AtchFileVO atchFileGroup);
	public int deleteAtchFileGroup(String atchFileId);
	public int deleteAtchFileDetails(String atchFileId);
}
