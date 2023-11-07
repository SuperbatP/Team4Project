package com.PhoenixHospital.member.web;

import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.service.IMemberService;
import com.PhoenixHospital.member.service.MailService;
import com.PhoenixHospital.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;

@Controller
public class MemberFormController {
    @Autowired
    private IMemberService memberService;

    @ResponseBody
    @RequestMapping(value ="/join/idCheck.wow", produces = "text/plain; charset=UTF-8")
    public String idCheck(String id){ //매개변수의 id는 script 의 json 객체 id
        try {
            MemberVO member = memberService.getMember(id);
            return "중복입니다.";
        }catch (BizNotFoundException e){
            return "중복이 아닙니다.";
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
