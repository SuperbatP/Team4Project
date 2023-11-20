package com.PhoenixHospital.member.service;


import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.email.EmailService;
import com.PhoenixHospital.exception.BizDuplicateKeyException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.vo.MemberVO;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.security.SecureRandom;


@Service
public class MemberServiceImpl implements IMemberService {
    @Autowired
    private IMemberDao memberDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private SqlSession session;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    EmailService emailService; // 서비스를 호출하기위한 의존성 주입


    private static final String NS = "com.PhoenixHospital.member.dao.IMemberDao";
    private static final String GET_BY_SNS_NAVER = NS + ".getBySnsNaver";
    private static final String GET_BY_SNS_GOOGLE = NS + ".getBySnsGoogle";


    @Override
    public List<MemberVO> getMemberList(PagingVO paging, SearchVO search) {
        int totalRowCount = memberDao.getTotalRowCount(paging, search);
        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();

        List<MemberVO> memberList = memberDao.getMemberList(paging, search);
        return memberList;
    }

    @Override
    public MemberVO getMember(String memId) throws BizNotFoundException {
        MemberVO member = memberDao.getMember(memId);
        if (member == null) throw new BizNotFoundException();
        return member;
    }

    @Override
    public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {

        String encodedPw
                = passwordEncoder.encode(member.getMemPassword());
        System.out.println("encodedPw : " + encodedPw);
        member.setMemPassword(encodedPw);
        int count = memberDao.updateMember(member);
        if (count < 1) throw new BizNotEffectedException();
    }

  /*  @Override
    public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
        int count = memberDao.deleteMember(member);
        if (count < 1) throw new BizNotEffectedException();
    }*/

    @Override
    public void registMember(MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException {

        MemberVO daoMember = memberDao.getMember(member.getMemId());
        if (daoMember != null) {
            throw new BizDuplicateKeyException();
        } else {

            //스프링 시큐리티로 비밀번호 암호화 작업함
            String encodedPw
                    = passwordEncoder.encode(member.getMemPassword());
            System.out.println("encodedPw : " + encodedPw);
            member.setMemPassword(encodedPw);

            int count = memberDao.insertMember(member);  //1개 행이 insert 됐습니다.

            if (count < 1) {
                throw new BizNotEffectedException();
            }
        }

    }

    @Override
    public boolean idCheck(MemberVO member) {

        int count = memberDao.idCheck(member);
        if (count == 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean EmCheck(String memEmail) {

        int count = memberDao.EmCheck(memEmail);
        if (count == 0) {
            return true;
        }

        return false;
    }


    @Override
    public boolean loginCheck(MemberVO member, HttpServletResponse rep, HttpServletRequest req) throws BizNotEffectedException {
        MemberVO members = null;

        System.out.println("member.getRemember():" + member.getRemember());


        if (member == null) {
            return false;
        } else {
            members = memberDao.loginCheck(member);
            System.out.println(members);
            //원하는걸로 잘들어옴

            if (members == null) {
                return false;
            } else {
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("memId", members.getMemId());

            }
            try {

                System.out.println(member.getMemPassword());
                //시큐리티를 이용해서 암호화된 비밀번호와 암호화되서 디비에들어간 값과 일치하는지확인
                //member.xml에서 로그인체크 xml에있는 비밀번호 비교값을 여기서 비교하게 만들고 아이디만있는지확인하는걸로 바뀜
                //passwordEncoder.matches(내가입력한값,이미 암호화된 디비에서 가져온값 ) -->> 꼭 기억하기
                boolean match = passwordEncoder.matches(member.getMemPassword(), members.getMemPassword());
                System.out.println("match : " + match);
                if (!match) {
                    return false;
                }
                String remember = member.getRemember();
//                List<UserRoleVO> userRoleList = memMapper.getUserRole(member);
//                System.out.println("UserRoleList: " + userRoleList);
//                if (userRoleList != null) {
//                    members.setUserRoleList(userRoleList);
//                }
                req.getSession().setAttribute("member", members);
                if (remember != null && remember.equals("Y")) {
                    Cookie cookie = new Cookie("remember", member.getMemId());
                    cookie.setMaxAge(60 * 60 * 24);
                    cookie.setHttpOnly(true);
                    rep.addCookie(cookie);
                } else {
                    Cookie cookie = new Cookie("remember", "");
                    cookie.setMaxAge(0);
                    rep.addCookie(cookie);
                }

            } catch (Exception e) {
                throw new BizNotEffectedException();
            }
            return true;
        }

    }

    @Override
    public MemberVO getBySns(MemberVO snsUser) {
        if (StringUtils.isNotEmpty(snsUser.getNaverid())) {
            return session.selectOne(GET_BY_SNS_NAVER, snsUser.getNaverid());
        } else {
            return session.selectOne(GET_BY_SNS_GOOGLE, snsUser.getGoogleid());
        }

    }

    @Override
    public void updateUser(MemberVO member) throws BizNotEffectedException, BizNotFoundException {

        int count = memberDao.updateUser(member);
        if (count < 1) throw new BizNotEffectedException();
    }

    @Override
    public List<MemberVO> findId(String memEmail) throws Exception {
        return memberDao.findId(memEmail);
    }

    @Override
    public int findIdCheck(String memEmail) throws Exception {
        return memberDao.findIdCheck(memEmail);
    }

    @Override
    public int findPwCheck(MemberVO memberVO) throws Exception {
        return memberDao.findPwCheck(memberVO);
    }

    @Override
    public void findPw(String memId, String memEmail) throws Exception {

        SecureRandom random = new SecureRandom();
        StringBuilder tempPassword = new StringBuilder();

        String[] ranValue1 = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};
        String[] ranValue2 = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
        String[] ranValue3 = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};

        for (int i = 0; i < 2; i++) {
            int ranPick1 = random.nextInt(ranValue1.length);
            int ranPick2 = random.nextInt(ranValue2.length);
            int ranPick3 = random.nextInt(ranValue3.length);
            tempPassword.append(ranValue1[ranPick1]).append(ranValue2[ranPick2]).append(ranValue3[ranPick3]);
        }

        String memberKey = tempPassword.toString();
        String memPassword = passwordEncoder.encode(memberKey);

        memberDao.findPw(memId, memEmail, memPassword);


        /* 이메일 보내기 */
        String setFrom = "nextitproject1213@gmail.com";
        String toMail = memEmail;
        String title = "불사조병원 임시 비밀번호 입니다.";
        String content =
                "<h1>임시비밀번호 발급</h1>" +
                        "<br/>" + memId + "님 " +
                        "<br/>비밀번호 찾기를 통한 임시 비밀번호입니다." +
                        "<br/>임시비밀번호 :   <h2>" + memberKey + "</h2>" +
                        "<br/>로그인 후 비밀번호 변경을 해주세요." +
                        "<a href='http://localhost:8080/login/login.wow" +
                        ">로그인 페이지</a>";

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        helper.setFrom(setFrom);
        helper.setTo(toMail);
        helper.setSubject(title);
        helper.setText(content, true);
        mailSender.send(message);
    }


}
