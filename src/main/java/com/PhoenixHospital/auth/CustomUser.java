package com.PhoenixHospital.auth;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.authority.AuthorityUtils;

import com.PhoenixHospital.member.vo.MemberVO;
import lombok.Getter;


public class CustomUser extends User {
    
    @Getter
    private MemberVO member;
    
/*
    public CustomUser(MemberVO member) {
        super(
            member.getMemId(),
            member.getMemPassword(),
            new ArrayList<GrantedAuthority>(
                Arrays.asList(
                    new SimpleGrantedAuthority(member.getMemRole())
                )
            )
        );
        this.member = member;
    }
*/

    public CustomUser(MemberVO member) {
        super(
                member.getMemId(),
                member.getMemPassword(),
                AuthorityUtils.createAuthorityList(member.getMemRole())
        );
 /*       this.member = member;*/
    }

    private static List<GrantedAuthority> getAuthorities(String role) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + role)); // ROLE_ 접두사 추가
        return authorities;
    }

}
