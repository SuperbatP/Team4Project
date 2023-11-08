package com.PhoenixHospital.member.service;


import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizDuplicateKeyException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MemberServiceImpl implements IMemberService {
   @Autowired
   IMemberDao memberDao;
    @Override
    public List<MemberVO> getMemberList(PagingVO paging) {
            int totalRowCount = memberDao.getTotalRowCount(paging );
            paging.setTotalRowCount(totalRowCount);
            paging.pageSetting();

            List<MemberVO> memberList = memberDao.getMemberList(paging );
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
            int count = memberDao.updateMember(member);
            if (count < 1) throw new BizNotEffectedException();
    }
    @Override
    public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
            int count = memberDao.deleteMember(member);
            if (count < 1) throw new BizNotEffectedException();
    }
    @Override
    public void registMember(MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException {

            MemberVO daoMember = memberDao.getMember(member.getMemId());
            if (daoMember != null) {
                throw new BizDuplicateKeyException();
            }
            int count = memberDao.insertMember(member);  //1개 행이 insert 됐습니다.
            if (count < 1) {
                throw new BizNotEffectedException();
            }

    }
}
