package com.PhoenixHospital.free.dao;

import com.PhoenixHospital.code.vo.CodeVO;
import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IFreeBoardDao {
  public int getTotalRowCount(@Param("paging") PagingVO paging, @Param("search") SearchVO search, @Param("searchCategory") String searchCategory);
  //검색어에 대한 List 반환 , String searchCategory-분류
  public List<FreeBoardVO> getBoardList(@Param("paging") PagingVO paging, @Param("search") SearchVO search, @Param("searchCategory") String searchCategory) ;
  public FreeBoardVO getBoard(int boNo);
  public int increaseHit(int boNo);
  public int updateBoard(FreeBoardVO freeBoard);
  public int deleteBoard(FreeBoardVO freeBoard);
  public void insertBoard(FreeBoardVO freeBoard);

  public int getfreeBoard(FreeBoardVO freeBoard) throws Exception;

  public FreeBoardVO freeView(int boNo)throws BizNotEffectedException,BizNotFoundException;

    Void increaseHit(Integer boNo) throws Exception;

    public List<CodeVO> freeEdit(int boNo) throws Exception;


}