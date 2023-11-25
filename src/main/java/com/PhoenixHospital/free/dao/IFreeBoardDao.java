package com.PhoenixHospital.free.dao;

import com.PhoenixHospital.code.vo.CodeVO;
import com.PhoenixHospital.exception.BizException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.io.IOException;
import java.util.List;

@Mapper
public interface IFreeBoardDao {
  public int getTotalRowCount(@Param("freeBoardVO") FreeBoardVO freeBoardVO);
  //검색어에 대한 List 반환 , String searchCategory-분류
  public List<FreeBoardVO> getBoardList(@Param("freeBoardVO") FreeBoardVO freeBoardVO) ;

  public int increaseHit(int boNo);
  public int updateBoard(FreeBoardVO freeBoard);
  public int deleteBoard(FreeBoardVO freeBoard);
  public void insertBoard(FreeBoardVO freeBoard)  throws BizException;

  public int getFreeBoard(FreeBoardVO freeBoard) throws Exception;

  public FreeBoardVO freeView(int boNo)throws BizNotEffectedException,BizNotFoundException;

  Void increaseHit(Integer boNo) throws Exception;

  public List<CodeVO> freeEdit(int boNo) throws Exception;

  public FreeBoardVO getBoard(int boNo) throws BizNotFoundException;

  public String resultMessage(int boNo);

  public String freeRegist( FreeBoardVO freeBoard)throws BizException, IOException;


}