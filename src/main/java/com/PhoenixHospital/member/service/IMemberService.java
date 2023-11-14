package com.PhoenixHospital.member.service;

import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizDuplicateKeyException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface IMemberService {
	
	public List<MemberVO> getMemberList(PagingVO paging, SearchVO search);
	public MemberVO getMember(String memId) throws BizNotFoundException ;
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException ;	
	public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException;
	public void registMember(MemberVO member) throws BizNotEffectedException,BizDuplicateKeyException;

	boolean idCheck(MemberVO member);

	boolean EmCheck(String memMail);

	boolean loginCheck(MemberVO member, HttpServletResponse rep, HttpServletRequest req) throws BizNotEffectedException;


}
