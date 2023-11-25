//package com.PhoenixHospital.login.service;
//
//import com.PhoenixHospital.member.dao.IMemberDao;
//import com.PhoenixHospital.member.vo.MemberVO;
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.apache.commons.lang3.StringUtils;
//
//
//
//@Service
//public class LoginService {
//     @Autowired
//     IMemberDao memberDao;
//
//    @Autowired
//    private SqlSession session;
//
//
//    public MemberVO getBySns(MemberVO snsUser) {
//        if (StringUtils.isNotEmpty(snsUser.getNaverid())) {
//            return session.selectOne(GET_BY_SNS_NAVER, snsUser.getNaverid());
//        } else {
//            return session.selectOne(GET_BY_SNS_GOOGLE, snsUser.getGoogleid());
//        }
//
//    }
//
//}
