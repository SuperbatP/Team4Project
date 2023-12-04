package com.PhoenixHospital.admin.dao;

import com.PhoenixHospital.admin.vo.AdminBoardVO;
import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IAdminBoardDao {
    int getTotalRowCount(@Param("paging")PagingVO paging,
                         @Param("search")SearchVO search,
                         @Param("searchCategory") String searchCategory);
    List<AdminBoardVO> getAdminBoardList(@Param("paging") PagingVO paging,
                                         @Param("search") SearchVO search,
                                         @Param("searchCategory") String searchCategory);
    AdminBoardVO getAdminBoard(int boNo);
    int increaseHit(int boNo);
    int updateBoard(AdminBoardVO adminBoard);
    int deleteBoard(AdminBoardVO adminBoard);
    int insertBoard(AdminBoardVO adminBoard);
    int notice_answer_insert(AdminBoardVO adminBoard);
    int changeboNo(int boNo);
    int changeboNoAttach(int boNo);
    int changeboNoReply(int boNo);

}
