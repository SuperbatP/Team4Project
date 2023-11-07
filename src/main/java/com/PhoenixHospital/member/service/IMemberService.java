package com.PhoenixHospital.member.service;

import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizDuplicateKeyException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.vo.MemberVO;

import java.util.List;

public interface IMemberService {
	
	public List<MemberVO> getMemberList(PagingVO paging, SearchVO search, String searchJob, String searchHobby);
	public MemberVO getMember(String memId) throws BizNotFoundException ;
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException ;	
	public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException;
	public void registMember(MemberVO member) throws BizNotEffectedException,BizDuplicateKeyException;
}
