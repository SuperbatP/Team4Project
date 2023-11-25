package com.PhoenixHospital.login.web;

import com.PhoenixHospital.auth.SNSLogin;
import com.PhoenixHospital.auth.SnsValue;
import com.PhoenixHospital.email.EmailService;
import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.service.IMemberService;
import com.PhoenixHospital.member.vo.MemberVO;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;


@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private IMemberService memberService;

    @Autowired
    private SnsValue naverSns;

    @Autowired
    private SnsValue googleSns;

    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;

    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;

    @Autowired
    private IMemberDao memberDao;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    EmailService emailService; // 서비스를 호출하기위한 의존성 주입


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

    @GetMapping("/login/login.wow")
    public String snsLogin(Model model) throws IOException {
        SNSLogin snsLogin = new SNSLogin(naverSns);
        model.addAttribute("naver_url", snsLogin.getNaverAuthURL());

        SNSLogin googleLogin = new SNSLogin(googleSns);
        model.addAttribute("google_url", snsLogin.getNaverAuthURL());

        /* 구글code 발행을 위한 URL 생성 */
        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
        String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

        model.addAttribute("google_url", url);

        return "login/login";
    }

    @GetMapping("/login/search_IdPw.wow")
    public String searchIdPW() throws Exception {
        return "login/search_IdPw";
    }

    @RequestMapping(value = "/login/findId", method = RequestMethod.POST)
    public String findId(MemberVO memberVO, Model model) throws Exception {
        if (memberService.findIdCheck(memberVO.getMemEmail()) == 0) {
            model.addAttribute("msg", "가입시 작성한 올바른 이메일을 입력하세요.");
            return "/login/search_IdPw";
        } else {
            model.addAttribute("member", memberService.findId(memberVO.getMemEmail()));
            return "/login/findId";
        }
    }

    @RequestMapping(value = "/login/findPw", method = RequestMethod.POST)
    public String findPw(MemberVO memberVO, Model model) throws Exception {

        if (memberService.findPwCheck(memberVO) == 0) {
            model.addAttribute("msg", "아이디와 이메일를 확인해주세요");
            return "/login/search_IdPw";
        } else {
            memberService.findPw(memberVO.getMemId(), memberVO.getMemEmail());
            model.addAttribute("member", memberVO.getMemEmail());

            return "/login/findPw";
        }

    }

    @RequestMapping(value = "/auth/{snsService}/callback",
            method = {RequestMethod.GET, RequestMethod.POST})
    public String snsLoginCallback(@PathVariable String snsService,
                                   Model model, @RequestParam String code, HttpSession session) throws Exception {

        logger.info("snsLoginCallback: service={}", snsService);
        SnsValue sns = null;
        if (StringUtils.equals("naver", snsService))
            sns = naverSns;
        else
            sns = googleSns;

        // 1. code를 이용해서 access_token 받기
        // 2. access_token을 이용해서 사용자 profile 정보 가져오기
        SNSLogin snsLogin = new SNSLogin(sns);

        MemberVO snsUser = snsLogin.getUserProfile(code); // 1,2번 동시
        System.out.println("Profile>>" + snsUser);

        // 3. DB 해당 유저가 존재하는 체크 (googleid, naverid 컬럼 추가)
        MemberVO user = memberService.getBySns(snsUser);
        if (user == null) {
            model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해 주세요.");

            //미존재시 가입페이지로!!

        } else {
            model.addAttribute("result", user.getMemName() + "님 반갑습니다.");

            // 4. 존재시 강제로그인
            //session.setAttribute(SessionNames.LOGIN, user);
        }

        return "/";
    }

}