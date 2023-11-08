package com.PhoenixHospital.member.dao;

import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *  member 테이블에 접근하는 메소드들 정의하는 인터페이스입니다.
 *  이 인터페이스를 상속받은 클래스는 이 메소드들을 잘 정의해야됩니다.
 */
@Mapper
public interface IMemberDao {

	public int getTotalRowCount(@Param("paging") PagingVO paging);

	public List<MemberVO> getMemberList(@Param("paging")PagingVO paging, @Param("search")SearchVO search, @Param("searchJob")String searchJob, @Param("searchHobby")String searchHobby);

	/**
	 * @param memId
	 * @return
	 */
	public MemberVO getMember(String memId);
	public int updateMember(MemberVO member);
	public int deleteMember(MemberVO member);
	public int insertMember(MemberVO member);
	
}
