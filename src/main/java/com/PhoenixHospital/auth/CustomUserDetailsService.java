package com.PhoenixHospital.auth;

import com.PhoenixHospital.member.dao.IMemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.PhoenixHospital.member.vo.MemberVO;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private IMemberDao memberDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 데이터베이스에서 사용자 정보를 가져오는 부분
        MemberVO memberVO = memberDao.getMember(username);

        if (memberVO != null) {
            return User.builder().username(memberVO.getMemId()).password(memberVO.getMemPassword())
                    .roles(memberVO.getMemRole()).build();
        //    return new CustomUser(memberVO);
        }
         throw new  UsernameNotFoundException("아이디가 다릅니다");
    }

}
