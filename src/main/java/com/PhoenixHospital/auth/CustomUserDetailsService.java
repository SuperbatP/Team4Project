package com.PhoenixHospital.auth;

import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private IMemberDao memberDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 데이터베이스에서 사용자 정보를 가져오는 부분
        MemberVO memberVO = memberDao.getMember(username);

        if (memberVO != null && "N".equals(memberVO.getMemDelYn())) {
            return User.builder().username(memberVO.getMemId()).password(memberVO.getMemPassword())
                    .roles(memberVO.getMemRole()).build();
            //    return new CustomUser(memberVO);
        }
        throw new UsernameNotFoundException("아이디가 다릅니다");


    }

}
