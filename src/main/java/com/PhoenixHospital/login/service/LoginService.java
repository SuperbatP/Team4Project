package com.PhoenixHospital.login.service;

import com.PhoenixHospital.login.vo.UserVO;
import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
     @Autowired
     IMemberDao memberDao;

    public UserVO getUser(String memId) {
        MemberVO member = memberDao.getMember(memId);
        if (member == null) {
            return null;
        } else {
            String role = "USER";
            // 원래는 admin관련 테이블을 하나 만들어서 관리해야함. 여기서는 특정 아이디 하나만 관리자 지정함.
            if(member.getMemId().equals("chopper")){
                role ="MANAGER";
            }
            UserVO user = new UserVO(
                    member.getMemId()
                    , member.getMemName()
                    , member.getMemPass()
                    , role);
            return user;
        }
    }
}
