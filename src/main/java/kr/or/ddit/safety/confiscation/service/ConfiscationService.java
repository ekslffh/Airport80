package kr.or.ddit.safety.confiscation.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.safety.vo.ConfiscationVO;
import kr.or.ddit.vo.PaginationInfo;

public interface ConfiscationService {
	
	//압수품 리스트 총개수
	public long countTotal(PaginationInfo paging);
	
	//압수품폐기 리스트 총갯수
	public long disCountTotal(PaginationInfo paging);
	
	// 등록
	public ServiceResult createConfiscation(ConfiscationVO confis);
	
	// 전체조회
	public List<ConfiscationVO> retrieveConfisList(PaginationInfo paging);
	
	// 상세조회
	public ConfiscationVO retrieveConfiscation(String csId);
	
	// 수정
	public ServiceResult modifyConfiscation(ConfiscationVO confis);
	
	// 삭제
	public ServiceResult removeConfiscation(String csId);
	
	// 상태변경
	public ServiceResult modifyconfisMthd(ConfiscationVO confis);
	
	// 압수품 폐기등록
	public ServiceResult modifyconfisDisposal(ConfiscationVO confis);
	
	// 압수품(폐기) 전체조회
	public List<ConfiscationVO> retrieveDisposal(PaginationInfo paging);
	
	// 압수품(폐기) 상세조회
	public ConfiscationVO retriveDisposalOne(String csId);
	
	// 압수품(폐기) 수정
	public ServiceResult modifyDisposalImg(ConfiscationVO confis);
	
	
}
