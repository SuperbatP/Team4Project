package com.PhoenixHospital;

import com.PhoenixHospital.free.dao.IFreeBoardDao;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    private IFreeBoardDao freeBoardDao;

    @RequestMapping("/")
    public String index(Model model){
        return "index";
        //return의 타입에 상관없이 HandlerAdapter가 처리해줌. 그 결과를 viewResolver로 보내줌.
    }

    // 로그인창으로 감.
    @RequestMapping("/login/login.wow")
    public String GoLogin() {
        return "login/login";
    }

    //로그아웃
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        // 로그아웃할때 세션종료해서 정보 다없애고 다시 시작.
        return "redirect:/";
    }

}