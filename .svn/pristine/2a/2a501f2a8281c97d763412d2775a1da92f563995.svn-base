
package kr.or.ddit.safety.prohibitedPerson.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.safety.prohibitedPerson.dao.ProhibitedPersonDAO;
import kr.or.ddit.safety.vo.ProhibitedPersonVO;

@Service
public class ProhibitedPersonServiceImpl implements ProhibitedPersonService {

	@Inject
	private ProhibitedPersonDAO dao;
	
	@Override
	public int createPPerson(ProhibitedPersonVO proPerson) {
		return dao.insertPPerson(proPerson);
	}

	@Override
	public List<ProhibitedPersonVO> retrieveEnterPersonList() {
		return dao.selectEnterPersonList();
	}
	
	@Override
	public List<ProhibitedPersonVO> retrieveExitPersonList() {
		return dao.selectExitPersonList();
	}
	

	@Override
	public ProhibitedPersonVO retrievePPerson(String pno) {
		return dao.selectPPerson(pno);
	}

	@Override
	public int modifyPPerson(ProhibitedPersonVO PPerson) {
		return dao.updatePPerson(PPerson);
	}

	@Override
	public int removePPerson(String pno) {
		return dao.deletePPerson(pno);
	}

}
