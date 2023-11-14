package com.PhoenixHospital.auth;/*
package com.PhoenixHospital.auth;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.PhoenixHospital.member.vo.MemberVO;

public class LoginCheckFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		
		//로그인한 사용자는 세션에 해당정보를담아놨습니다.(memberVO)  
		//memberVO가 있다면 로그인을 한 사용자이고 그렇지 않다면 login화면으로 보내기
		
		
		HttpServletRequest req = (HttpServletRequest) request;
		indivMemberVO vo =(indivMemberVO) req.getSession().getAttribute("member");
		
		System.out.println("req.getRequestURI() :"+ req.getRequestURI());
		String uri = req.getRequestURI();
		
		if(uri.indexOf("memberRegister") > -1 ) {
			//가입진행
			chain.doFilter(request, response);
		}else {
			if(vo != null) {
				System.out.println("--- --- ---success login check in LoginCheck Filter");
				chain.doFilter(request, response);
			}else {
				System.out.println("--- --- ---fail login check in LoginCheck Filter");
				HttpServletResponse resp = (HttpServletResponse) response;
				resp.sendRedirect(req.getContextPath()+"/login/none");
			}
		}
	}
}
*/
