//package com.PhoenixHospital.login.service;
//
//import com.PhoenixHospital.login.vo.UserVO;
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
//    public UserVO getUser(String memId) {
//        MemberVO member = memberDao.getMember(memId);
//        if (member == null) {
//            return null;
//        } else {
//            String role = "USER";
//            // 원래는 admin관련 테이블을 하나 만들어서 관리해야함. 여기서는 특정 아이디 하나만 관리자 지정함.
//            if(member.getMemRole().equals("admin")){
//                role ="ADMIN";
//            }
//            UserVO user = new UserVO(
//                    member.getMemId()
//                    , member.getMemName()
//                    , member.getMemPassword()
//                    , role);
//            return user;
//        }
//    }
//
////    public MemberVO getBySns(MemberVO snsUser) {
////        if (StringUtils.isNotEmpty(snsUser.getNaverid())) {
////            return session.selectOne(GET_BY_SNS_NAVER, snsUser.getNaverid());
////        } else {
////            return session.selectOne(GET_BY_SNS_GOOGLE, snsUser.getGoogleid());
////        }
////
////    }
//
//}
