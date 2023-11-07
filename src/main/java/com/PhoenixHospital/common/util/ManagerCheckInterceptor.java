package com.PhoenixHospital.common.util;

import com.PhoenixHospital.login.vo.UserVO;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerCheckInterceptor extends HandlerInterceptorAdapter {
    // Member 게시판은 일반 사용자가 볼 수 없음. 관리자만 볼 수 있어야함.

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //controller 가기전 보통은 이것만 사용. 걸러주만 하면 되니까.
        HttpSession session = request.getSession();
        //로그인 정보는 session에 있으니까.
        UserVO user = (UserVO) session.getAttribute("USER_INFO");
        if (user == null) {//로그인이 안된 경우
            response.sendRedirect("/login/login.wow");
            //redirect: 표시는 controller에서만... sendRedirect는 주소만...
            return false;
        } else { //로그인은 한 경우
            if (!user.getUserRole().equals("MANAGER")) {
                //로그인은 했지만 매니저가 아닌 경우 = 유저인 경우
                response.sendError(HttpServletResponse.SC_FORBIDDEN,"당신은 권한이 부족합니다.");
                return false;
            }
        }
        return true;
        //관리자인 경우에만 interceptor 통과. true
    }

//    @Override
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//        //controller 간 후
//        super.postHandle(request, response, handler, modelAndView);
//    }
//
//    @Override
//    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
//        //렌더링 직후. jsp 가기 직전.
//        super.afterCompletion(request, response, handler, ex);
//    }
}
