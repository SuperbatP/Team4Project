package com.PhoenixHospital.member.service;

import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizDuplicateKeyException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.vo.MemberVO;

import java.util.List;

public interface IMemberService {
	
	public List<MemberVO> getMemberList(PagingVO paging, SearchVO search);
	public MemberVO getMember(String memId) throws BizNotFoundException ;
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException ;	
	public void removeMember(String memPassword) throws BizNotEffectedException, BizNotFoundException;
	public void registMember(MemberVO member) throws BizNotEffectedException,BizDuplicateKeyException;

	boolean idCheck(MemberVO member);

	boolean EmCheck(String memEmail);

//	boolean loginCheck(MemberVO member, HttpServletResponse rep, HttpServletRequest req) throws BizNotEffectedException;

	MemberVO getBySns(MemberVO snsUser);

	public void updateUser(MemberVO member) throws BizNotEffectedException, BizNotFoundException ;

	public List<MemberVO> findId(String memEmail)throws Exception;

	public int findIdCheck(String memEmail)throws Exception;

	public void findPw(String memId, String memEmail)throws Exception;

	public int findPwCheck(MemberVO memberVO)throws Exception;

	public String pwCheck(String memId)throws Exception;

	public void pwUpdate(String memId, String memPassword)throws Exception;


}
