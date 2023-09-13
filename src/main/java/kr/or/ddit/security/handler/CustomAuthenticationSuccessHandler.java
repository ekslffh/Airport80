package kr.or.ddit.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
//		MemberVOWrapper principle = (MemberVOWrapper) authentication.getPrincipal();
//		MemberVO realUser = principle.getRealUser();
		
//		log.info(" {} 로그인 한 이후에 동작하는 핸들러", realUser.getMemName());
		
		// principal 객체를 가져와서 계정정보 읽기 (직원: EMP, 항공사: AL, 입점업체: VD)
		AccountWrapper aw = (AccountWrapper) authentication.getPrincipal();
		String accInfo = aw.getAccInfo();
		
//		if (accInfo.equals("AL")) {
//			// 항공사계정
//			super.setDefaultTargetUrl("/in");
//		} else if (accInfo.equals("VD")) {
//			// 입점업체계정
//			super.setDefaultTargetUrl("/in");
//		} else {
//			// 공항직원계정
//			// 부서정보에 따라 해당 부서페이지로 이동하기
//			EmployeeVO empVO = (EmployeeVO) aw.getRealUser();
//			String deptNo = empVO.getEmpDeptNo();
//			String teamNo = empVO.getEmpTeam();
//			if (deptNo.equals("1201")) {
//				// 경영본부
//				if (teamNo.equals("31")) {
//					// 인사부서
//					super.setDefaultTargetUrl("/in/hr");
//				} else {
//					// 회계부서
//					super.setDefaultTargetUrl("/in/accounting");
//				}
//			} else if (deptNo.equals("1202")) {
//				// 운영본부
//				super.setDefaultTargetUrl("/in/operate");
//			} else if (deptNo.equals("1203")) {
//				// 보안본부
//				super.setDefaultTargetUrl("/in/safety");
//			} else {
//				// 인프라본부(1204)
//				super.setDefaultTargetUrl("/in/infra");
//			}
//		}
		super.setDefaultTargetUrl("/in");
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
