package com.PhoenixHospital.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;
import java.util.Random;


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



        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;

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

}
