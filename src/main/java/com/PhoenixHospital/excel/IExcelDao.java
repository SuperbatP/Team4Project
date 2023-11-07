package com.PhoenixHospital.excel;

import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import com.PhoenixHospital.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface IExcelDao {
    public List<FreeBoardVO> getFreeBoardBySearch(@Param("search") SearchVO search, @Param("searchCategory") String searchCategory);
    public List<MemberVO> getMemberBySearch(@Param("search")SearchVO searchVO, @Param("searchJob")String searchJob, @Param("searchHobby")String searchHobby);
}
