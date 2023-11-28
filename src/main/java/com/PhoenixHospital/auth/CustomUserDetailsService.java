package com.PhoenixHospital.auth;

import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import java.util.Date;

public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private IMemberDao memberDao;


    @Autowired
    private PersistentTokenRepository jdbcTokenRepository; // JdbcTokenRepositoryImpl를 주입받는다.

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

    // Remember Me 토큰을 저장하는 메서드
    public void createRememberMeToken(String username, String series, String tokenValue, long date) {
        Date creationDate = new Date(date);
        jdbcTokenRepository.createNewToken(new PersistentRememberMeToken(username, series, tokenValue, creationDate));
    }

    // Remember Me 토큰을 업데이트하는 메서드
    public void updateRememberMeToken(String series, String tokenValue, long lastUsed) {
        PersistentRememberMeToken token = jdbcTokenRepository.getTokenForSeries(series);
        if (token != null) {
            Date lastUsedDate = new Date(lastUsed);
            jdbcTokenRepository.updateToken(series, tokenValue, lastUsedDate);
        }
    }

    // Remember Me 토큰을 제거하는 메서드
    public void removeRememberMeToken(String series) {
        jdbcTokenRepository.removeUserTokens(series);
    }
}
