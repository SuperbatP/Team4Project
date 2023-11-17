package com.PhoenixHospital.auth;

import java.util.*;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.authority.AuthorityUtils;

import com.PhoenixHospital.member.vo.MemberVO;
import lombok.Getter;


public class CustomUser extends User {



    public CustomUser(String username, String password
            , Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    // 사용자가 정의한 MemberVO 타입을 스프링 시큐리티 UsersDetails 타입으로 변환
//    public CustomUser(MemberVO member) {
//        // 사용자 아아디, 비밀번호, 권한 리스트(memberVO.getMemberAuthVOList())
//        super(member.getMemId(),
//                member.getMemPassword(),
//                member.getMemName(),
//                Collections.singleton(new SimpleGrantedAuthority("ROLE_" + member.getMemRole()))
//        );
//    }



}
