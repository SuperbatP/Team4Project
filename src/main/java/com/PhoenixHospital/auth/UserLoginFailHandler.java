package com.PhoenixHospital.auth;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UserLoginFailHandler implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        if (exception instanceof AuthenticationServiceException) {
            request.setAttribute("msg", "죄송합니다. 시스템에 오류가 발생했습니다.");

        } else if(exception instanceof BadCredentialsException) {
            request.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
        }
        // 로그인 페이지로 다시 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/login/login.wow");
        dispatcher.forward(request, response);
    }
}
