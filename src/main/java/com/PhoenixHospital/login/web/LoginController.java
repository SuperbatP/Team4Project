package com.PhoenixHospital.login.web;

import com.PhoenixHospital.auth.CustomUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.PhoenixHospital.login.vo.UserVO;
import com.PhoenixHospital.login.service.LoginService;
import com.PhoenixHospital.common.util.CookieUtils;
import com.PhoenixHospital.login.vo.UserVO;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private PasswordEncoder passwordEncoder;




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
            } else {//id맞았을때
                if (passwordEncoder.matches(pw, user.getUserPass())) {
                    if (save_id.equals("Y")) {
                        response.addCookie(CookieUtils.createCookie("SAVE_ID", id, "/", 3600 * 24 * 7));
                    }
                    session.setAttribute("USER_INFO", user);

                    // 로그인 성공시 Authentication 객체 생성 및 설정
                    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                    // 사용자의 정보와 권한을 설정하려면 CustomUserDetails를 사용
                    CustomUserDetails userDetails = new CustomUserDetails(user);
                    authentication.setAuthenticated(true);
                    userDetails.setAuthorities(user.getAuthorities());
                    userDetails.setPassword(user.getUserPass());

                    return "redirect:/";  // 성공했을때는 home으로
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



/*
    // 로그인창으로 감
    @RequestMapping("/GoLogin")
    public String GoLogin() {

        return "login/login";
    }

*/








/*

    // 로그아웃
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        // 로그아웃할때 세션종료해서 정보 다없애고 다시 시작하는거임
        return "redirect:/";
    }
*/

    ///////////////////////////////////////////////////////////////////////////////////////////////////

    /*//개인회원가입 아이디중복체크
    @RequestMapping("/join/idCheck")
    @ResponseBody
    public int idCheck(@ModelAttribute MemberVO member) {


        boolean result = memberService.idCheck(member);
        if(result) {
            return 1;
        }else {
            return 2;
        }

    }*/

   /* //개인회원가입 이메일 체크
    @RequestMapping("/join/EmCheck")
    @ResponseBody
    public int EmCheck(@RequestParam String memMail) {

        System.out.println("EmCheck:" + memMail);


        boolean result = memberService.EmCheck(memMail);
        if(result) {
            return 1;
        }else {
            return 2;
        }
    }*/




}