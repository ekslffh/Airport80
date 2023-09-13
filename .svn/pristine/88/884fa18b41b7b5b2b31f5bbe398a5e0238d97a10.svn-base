package kr.or.ddit.common.employee.dao;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.common.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class EmployeeDAOTest {
	
	@Inject
	private EmployeeDAO dao;
	
	@Test
	void testSelectEmp() {
		EmployeeVO empVO = dao.selectEmp("12010001");
		log.info("empVO객체 : {}", empVO);
	}

}
