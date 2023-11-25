package com.PhoenixHospital.member.web;

import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.service.IMemberService;
import com.PhoenixHospital.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
/*@RequestMapping
@RestController*/
public class MemberFormController {
    @Autowired
    private IMemberService memberService;

    //아이디 체크
    @RequestMapping(method = {RequestMethod.GET}, value = "/member/checkid")
    public @ResponseBody int idCheck(String memId) {

        if(memId == null || memId == "")
            return -1;
        else{
            try {
                //중복일 때
                MemberVO member = memberService.getMember(memId);
                return 1;
            }catch (BizNotFoundException e){
                //중복이 아닐 때
                return 0;
            }
        }

    }
}
