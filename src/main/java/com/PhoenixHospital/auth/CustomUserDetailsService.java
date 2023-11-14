package com.PhoenixHospital.auth;

import com.PhoenixHospital.member.dao.IMemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

    @Autowired
    private PasswordEncoder passwordEncoder;

 /*   @Autowired
    private HttpServletRequest request;*/

    @Override
    public UserDetails loadUserByUsername(String memId) throws UsernameNotFoundException {
//        System.out.println("username: " + memId);
//        //개인 회원인경우
//        MemberVO member = new MemberVO();
//        member.setMemId(memId);
//        MemberVO indivMember = memberDao.getMember(member.getMemId());
//
//        if (indivMember != null) {
////            indivMember.setRoleList(memMapper.getUserRoleListByUserId(username));
////            indivMember.setUserRoleList(memMapper.getUserRole(indivMember));
//            indivMember.setRemember(request.getParameter("remember"));
//            HttpSession session = request.getSession();
//            session.setAttribute("member", indivMember);
//            return new CustomUser(indivMember);
//        }

       /* System.out.println("username: " + memId);

        // 데이터베이스에서 사용자 정보를 가져오는 부분
        MemberVO indivMember = memberDao.getMember(memId);

        if (indivMember != null) {
            // 데이터베이스에서 가져온 암호화된 비밀번호와 입력된 비밀번호를 비교
            String userPass = request.getParameter("userPass"); // 비밀번호 값을 가져오기
            boolean passwordMatch = passwordEncoder.matches(userPass, indivMember.getMemPassword());

            if (passwordMatch) {
                // 사용자 정보가 있는 경우 UserDetails 객체로 변환하여 반환
                return new CustomUser(indivMember);
            }
        }

        // 사용자 정보가 없거나 비밀번호가 일치하지 않는 경우 예외를 던지거나 null을 반환
        throw new UsernameNotFoundException("사용자를 찾을 수 없거나 비밀번호가 일치하지 않습니다: " + memId);
    }
*/
        System.out.println("username: " + memId);

        // 데이터베이스에서 사용자 정보를 가져오는 부분
        MemberVO indivMember = memberDao.getMember(memId);

        if (indivMember != null) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String userPass = authentication.getCredentials().toString(); // 비밀번호 값을 가져오기
            // 데이터베이스에서 가져온 암호화된 비밀번호와 입력된 비밀번호를 비교
            boolean passwordMatch = passwordEncoder.matches(userPass, indivMember.getMemPassword());

            if (passwordMatch) {
                // 사용자 정보가 있는 경우 UserDetails 객체로 변환하여 반환
                return new CustomUser(indivMember);
            }
        }

        // 사용자 정보가 없거나 비밀번호가 일치하지 않는 경우 예외를 던지거나 null을 반환
        throw new UsernameNotFoundException("사용자를 찾을 수 없거나 비밀번호가 일치하지 않습니다: " + memId);
    }



}
