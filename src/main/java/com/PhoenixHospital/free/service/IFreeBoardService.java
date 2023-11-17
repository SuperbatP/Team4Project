package com.PhoenixHospital.free.service;

import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.exception.BizPasswordNotMatchedException;
import com.PhoenixHospital.free.vo.FreeBoardVO;

import java.util.List;

public interface IFreeBoardService {
	public List<FreeBoardVO> getBoardList(PagingVO paging, SearchVO search, String searchCategory);
	public FreeBoardVO getBoard(int boNo) throws BizNotFoundException;

	public void increaseHit(int boNo) throws BizNotEffectedException;


	public void modifyBoard(FreeBoardVO freeBoard)
			throws BizNotFoundException,BizPasswordNotMatchedException, BizNotEffectedException ;
	public void removeBoard(FreeBoardVO freeBoard)
			throws BizNotFoundException,BizPasswordNotMatchedException, BizNotEffectedException ;
	public void registBoard(FreeBoardVO freeBoard) throws BizNotEffectedException;

	public void insertForm(FreeBoardVO freeBoard) throws BizException;
}