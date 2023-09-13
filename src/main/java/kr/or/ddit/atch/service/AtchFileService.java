package kr.or.ddit.atch.service;

import java.io.IOException;

import org.springframework.core.io.Resource;

import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;

public interface AtchFileService {
	public AtchFileDetailVO retrieveAtchFileDetail(AtchFileDetailVO condition);
	
	/**
	 * 새로운 파일 그룹 생성 및 저장
	 * @param fildGoup
	 * @param saveRes 2진 데이터 저장 위치
	 * @throws IOException TODO
	 */
	public void createAtchFileGroup(AtchFileVO fileGroup, Resource saveRes) throws IOException;
	
	/**
	 * 파일 그룹 삭제
	 * @param atchFileId
	 * @param saveRes 삭제할 파일의 2진 데이터 저장 위치
	 * @return
	 * @throws IOException 
	 */
	public boolean removeAtchFileGroup(String atchFileId, Resource saveRes) throws IOException;
}
