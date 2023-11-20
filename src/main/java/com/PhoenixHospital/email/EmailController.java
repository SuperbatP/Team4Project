package com.PhoenixHospital.email;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Slf4j
@Controller
public class EmailController {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    EmailService emailService; // 서비스를 호출하기위한 의존성 주입

    /* 회원가입시 이메일 인증 */
    @RequestMapping(value = "/emp/mailCheck", method = RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception {

        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("이메일 : " + email);

        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 " + checkNum);

        /* 이메일 보내기 */
        String setFrom = "nextitproject1213@gmail.com";
        String toMail = email;
        String title = "불사조병원 회원가입 인증 이메일 입니다.";
        String content =
                "불사조 병원 회원가입을 위한 인증번호 발송 메일입니다." +
                        "<br><br>" +
                        "인증번호는 " + "<h1 style='color:red;'><strong>" + checkNum + "</strong></h1>" + " 입니다." +
                        "<br><br>" +
                        "해당 인증번호를 인증번호" + " 확인란에 기입하여 주세요.";
        try {

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            mailSender.send(message);


        } catch (Exception e) {
            e.printStackTrace();
        }
        String num = Integer.toString(checkNum);

        return num;
    }

    /*비밀번호 찾기에서 이메일로 비번 발송*/
    @RequestMapping(value = "/emp/passSearch", method = RequestMethod.POST)
    @ResponseBody
    public String passSearch(String email, @RequestBody String pass) throws Exception {

        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("이메일 : " + email);
        log.info("비밀번호 데이터 전송 확인");
        log.info("비번 : " + pass);

        /* 인증번호(난수) 생성 */
	        /*
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        log.info("인증번호 " + checkNum);
	        */

        /* 이메일 보내기 */
        String setFrom = "nextitproject1213@gmail.com";
        String toMail = email;
        String title = "불사조 병원 임시비밀번호 안내 이메일 입니다.";
        String content =
                "메디컬 테그놀로지 비밀번호는 " +
                        "<br><br>" +
                        "<h1 style='color:red;'><strong>" + pass + "</strong></h1>" + " 입니다." +
                        "<br><br>" +
                        "해당 비밀버호는 이전에 설정한 비밀번호로, 로그인후  비밀번호를 다시 변경해주세요.";
        try {

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            mailSender.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
        String num = pass;

        return num;
    }
}
