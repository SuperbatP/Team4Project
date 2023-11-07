package com.PhoenixHospital.login.web;


import com.PhoenixHospital.common.util.CookieUtils;
import com.PhoenixHospital.login.service.LoginService;
import com.PhoenixHospital.login.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

@Controller
public class LoginController {
 //    java에서는 먼저 받은 다음에 get/ process로 나뉘었는데, spring는 그냥 @으로 나누면 됨.
 /*   public String process(HttpServletRequest req, HttpServletResponse response) throws Exception {
        if (req.getMethod().equals("GET")) {
            return getProcess(req,response);
        } else {  //post랑 그 외
            return postProcess(req,response);
        }
    }*/

    @Autowired
    LoginService loginService;



    @GetMapping("/login/login.wow")
    public String getLogin(Model model, String msg, HttpServletRequest req) throws IOException {

        String id = "";
        String checked = "";
        if (msg == null) {
            msg = "";
        }
        CookieUtils cookieUtils = new CookieUtils(req);
        if (cookieUtils.exists("SAVE_ID")) {
            id = cookieUtils.getValue("SAVE_ID");
            checked = "checked='checked'";
        }
        model.addAttribute("id", id);
        model.addAttribute("checked", checked);
        model.addAttribute("msg", msg);
        return "login/login";

    }

    @PostMapping("/login/login.wow")
    public String postLogin(Model model,  @RequestParam("userId") String id, @RequestParam("userPass") String pw, @RequestParam(value = "rememberMe", required = false) String save_id,
                            HttpServletRequest req, HttpServletResponse response, HttpSession session) throws IOException {

        if (save_id == null) {
            CookieUtils cookieUtils = new CookieUtils(req);
            if (cookieUtils.exists("SAVE_ID")) {
                Cookie cookie = CookieUtils.createCookie("SAVE_ID", id, "/", 0);
                response.addCookie(cookie);
            }
            save_id = "";
        }
        if ((id == null || id.isEmpty()) || (pw == null || pw.isEmpty())) {
            return  "redirect:/login/login.wow?msg=" +  URLEncoder.encode("입력안했어요", "utf-8");
        } else {
            UserVO user = loginService.getUser(id);
            if (user == null) {
                return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비번확인", "utf-8");
            } else { //id맞았을때
                if (user.getUserPass().equals(pw)) {//다 맞는경우
                    if (save_id.equals("Y")) {
                        response.addCookie(CookieUtils.createCookie("SAVE_ID", id, "/", 3600 * 24 * 7));
                    }
                    session.setAttribute("USER_INFO", user);
                    return  "redirect:/";  //성공했을때는 home으로
                } else {//  비번만 틀린경우
                    return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비번확인", "utf-8");
                }
            }
        }

    }

    @RequestMapping("/login/logout.wow")
    public String Logout(HttpSession session) {
        session.removeAttribute("USER_INFO");
        return "redirect:/";
    }
}