//package com.PhoenixHospital.login.web;
//
//
//import com.PhoenixHospital.auth.CustomUserDetails;
//import com.PhoenixHospital.auth.SNSLogin;
//import com.PhoenixHospital.auth.SnsValue;
//import com.PhoenixHospital.login.service.LoginService;
//import com.PhoenixHospital.login.vo.UserVO;
//import com.PhoenixHospital.member.service.IMemberService;
//import com.PhoenixHospital.member.vo.MemberVO;
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.social.google.connect.GoogleConnectionFactory;
//import org.springframework.social.oauth2.GrantType;
//import org.springframework.social.oauth2.OAuth2Operations;
//import org.springframework.social.oauth2.OAuth2Parameters;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import com.PhoenixHospital.common.util.CookieUtils;
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.net.URLEncoder;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//
//@Controller
//public class LoginController {
//
//    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
//
//    @Autowired
//    private LoginService loginService;
//
//    @Autowired
//    private PasswordEncoder passwordEncoder;
//
//    @Autowired
//    private IMemberService memberService;
//
//
//    @Autowired
//    private SnsValue naverSns;
//
//    @Autowired
//    private SnsValue googleSns;
//
//    @Autowired
//    private GoogleConnectionFactory googleConnectionFactory;
//
//    @Autowired
//    private OAuth2Parameters googleOAuth2Parameters;
//

//
//
//
//    @PostMapping("/login/login.wow")
//    public String postLogin(Model model,  @RequestParam("userId") String id, @RequestParam("userPass") String pw, @RequestParam(value = "rememberMe", required = false) String save_id,
//                            HttpServletRequest req, HttpServletResponse response, HttpSession session) throws IOException {
//
//        if (save_id == null) {
//            CookieUtils cookieUtils = new CookieUtils(req);
//            if (cookieUtils.exists("SAVE_ID")) {
//                Cookie cookie = CookieUtils.createCookie("SAVE_ID", id, "/", 0);
//                response.addCookie(cookie);
//            }
//            save_id = "";
//        }
//        if ((id == null || id.isEmpty()) || (pw == null || pw.isEmpty())) {
//            return  "redirect:/login/login.wow?msg=" +  URLEncoder.encode("아이디 또는 비번을 입력하지 않았습니다.", "utf-8");
//        } else {
//            UserVO user = loginService.getUser(id);
//            if (user == null) {
//                return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비번을 확인해주세요.", "utf-8");
//            } else {//id맞았을때
//                if (passwordEncoder.matches(pw, user.getUserPass())) {
//                    if (save_id.equals("Y")) {
//                        response.addCookie(CookieUtils.createCookie("SAVE_ID", id, "/", 3600 * 24 * 7));
//                    }
//                    session.setAttribute("USER_INFO", user);
//
//                    // 로그인 성공시 Authentication 객체 생성 및 설정
//                    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//                    // 사용자의 정보와 권한을 설정하려면 CustomUserDetails를 사용
//                    CustomUserDetails userDetails = new CustomUserDetails(user);
//                    authentication.setAuthenticated(true);
//                    userDetails.setAuthorities(user.getAuthorities());
//                    userDetails.setPassword(user.getUserPass());
//
//                    return "redirect:/";  // 성공했을때는 home으로
//                } else {//  비번만 틀린경우
//                    return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비번을 확인해주세요.", "utf-8");
//                }
//            }
//        }
//    }
//
//    @GetMapping("/login/login.wow")
//    public String snsLogin(Model model) throws IOException {
//        SNSLogin snsLogin = new SNSLogin(naverSns);
//        model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
//
//        SNSLogin googleLogin = new SNSLogin(googleSns);
//        model.addAttribute("google_url", snsLogin.getNaverAuthURL());
//
//        /* 구글code 발행을 위한 URL 생성 */
//        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//        String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
//
//        model.addAttribute("google_url", url);
//
//        return "login/login";
//    }
//
//
//
//    @RequestMapping(value = "/auth/{snsService}/callback",
//            method = { RequestMethod.GET, RequestMethod.POST})
//    public String snsLoginCallback(@PathVariable String snsService,
//                                   Model model, @RequestParam String code, HttpSession session) throws Exception {
//
//        logger.info("snsLoginCallback: service={}", snsService);
//        SnsValue sns = null;
//        if (StringUtils.equals("naver", snsService))
//            sns = naverSns;
//        else
//            sns = googleSns;
//
//        // 1. code를 이용해서 access_token 받기
//        // 2. access_token을 이용해서 사용자 profile 정보 가져오기
//        SNSLogin snsLogin = new SNSLogin(sns);
//
//        MemberVO snsUser = snsLogin.getUserProfile(code); // 1,2번 동시
//        System.out.println("Profile>>" + snsUser);
//
//        // 3. DB 해당 유저가 존재하는 체크 (googleid, naverid 컬럼 추가)
//        MemberVO user = memberService.getBySns(snsUser);
//        if (user == null) {
//            model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해 주세요.");
//
//            //미존재시 가입페이지로!!
//
//        } else {
//            model.addAttribute("result", user.getMemName() + "님 반갑습니다.");
//
//            // 4. 존재시 강제로그인
//            //session.setAttribute(SessionNames.LOGIN, user);
//        }
//
//
//        return "login/project";
//    }
//
//}