package com.PhoenixHospital.member.service;


import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizDuplicateKeyException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.vo.MemberVO;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class MemberServiceImpl implements IMemberService {
    @Autowired
    private IMemberDao memberDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private SqlSession session;




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
                = passwordEncoder.encode(member. getMemPassword());
        System.out.println("encodedPw : "+ encodedPw);
        member.setMemPassword(encodedPw);
        int count = memberDao.updateMember(member);
        if (count < 1) throw new BizNotEffectedException();
    }

    @Override
    public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
        int count = memberDao.deleteMember(member);
        if (count < 1) throw new BizNotEffectedException();


    /*    EnterMemberVO vo = null;
        if(member.getIndivMemId() != null && ! member.getIndivMemId().equals("")) {
            //vo = memberDao.getMember(member.getMemId());
            vo = memMapper.getMember(member.getIndivMemId());
        }
        if( vo == null) {
            throw new BizNotFoundException();
        }
        if( !vo.getEnterPw().equals(member.getIndivMemPw()) ){
            throw new BizPasswordNotMatchedException();
        }
        int resultCnt = memMapper.deleteIndiv(member);
        if(resultCnt != 1){
            throw new BizNotEffectedException();
        }
    }*/
    }

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

}
