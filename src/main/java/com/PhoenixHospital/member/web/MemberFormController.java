package com.PhoenixHospital.member.web;

import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.service.IMemberService;
import com.PhoenixHospital.member.service.MailService;
import com.PhoenixHospital.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;

@Controller
public class MemberFormController {
    @Autowired
    private IMemberService memberService;


//    @ResponseBody
//    @RequestMapping(value ="/join/idCheck.wow", produces = "text/plain; charset=UTF-8")
//    public String idCheck2(String id){ //매개변수의 id는 script 의 json 객체 id
//        try {
//            MemberVO member = memberService.getMember(id);
//            return "중복입니다.";
//        }catch (BizNotFoundException e){
//            return "중복이 아닙니다.";
//        }
//    }

    @RequestMapping(method = {RequestMethod.GET}, value = "/member/checkid")
    public @ResponseBody int idCheck(String memId) {

        if(memId == null || memId == "")
            return -1;
        else{
            try {
                MemberVO member = memberService.getMember(memId);
                return 1;
            }catch (BizNotFoundException e){
                return 0;
            }
        }

    }


















    @Autowired
    private MailService mailService;

    @ResponseBody
    @RequestMapping(value = "/join/emailSend.wow")
    public String sendEmil(String email) throws MessagingException {
        //main 메소드에 있던 메일 보내기를 하면 됨.
        //controller이 아닌 service에서 보내기로 함.
        return mailService.mailSend(email);
    }
}
