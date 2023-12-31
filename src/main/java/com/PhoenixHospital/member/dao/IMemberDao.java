package com.PhoenixHospital.member.dao;

import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * member 테이블에 접근하는 메소드들 정의하는 인터페이스입니다.
 * 이 인터페이스를 상속받은 클래스는 이 메소드들을 잘 정의해야됩니다.
 */
@Mapper
public interface IMemberDao {

    public int getTotalRowCount(@Param("paging") PagingVO paging, @Param("search") SearchVO search);

    public List<MemberVO> getMemberList(@Param("paging") PagingVO paging, @Param("search") SearchVO search);

    /**
     * @param memId
     * @return
     */
    public MemberVO getMember(String memId);

    public int updateMember(MemberVO member);

    public int insertMember(MemberVO member);

    public int idCheck(MemberVO member);

    public int EmCheck(String memEmail);

    public int updateUser(MemberVO member);

    public List<MemberVO> findId(String memEmail) throws Exception;

    public int findIdCheck(String memEmail) throws Exception;

    public int findPwCheck(MemberVO memberVO) throws Exception;

    public int findPw(@Param("memId")String memId, @Param("memEmail")String memEmail, @Param("memPassword")String memPassword) throws Exception;

    public String pwCheck(String memId)throws Exception;

    public void pwUpdate(@Param("memId")String memId, @Param("memPassword")String memPassword)throws Exception;

    public int removeMember(String memPassword);

}
