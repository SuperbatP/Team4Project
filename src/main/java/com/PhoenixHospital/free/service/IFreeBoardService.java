package com.PhoenixHospital.free.service;

import com.PhoenixHospital.code.vo.CodeVO;
import com.PhoenixHospital.exception.BizException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.exception.BizPasswordNotMatchedException;
import com.PhoenixHospital.free.vo.FreeBoardVO;

import java.io.IOException;
import java.util.List;

public interface IFreeBoardService {
	public List<FreeBoardVO> getBoardList(FreeBoardVO freeBoardVO);
	public FreeBoardVO getBoard(int boNo) throws BizNotFoundException;
	public List<CodeVO> freeEdit(int boNo) throws Exception;
	public void modifyBoard(FreeBoardVO freeBoard)
			throws BizNotFoundException,BizPasswordNotMatchedException, BizNotEffectedException ;
	public void increaseHit(int boNo) throws BizNotEffectedException;


	public void removeBoard(FreeBoardVO freeBoard)
			throws BizNotFoundException,BizPasswordNotMatchedException, BizNotEffectedException ;
	public void registBoard(FreeBoardVO freeBoard) throws BizNotEffectedException;

	public void insertForm(FreeBoardVO freeBoard) throws BizException;

	public FreeBoardVO freeView(int boNo) throws BizNotEffectedException, BizNotFoundException;

	public String resultMessageVO(int boNo);

	public String freeRegist(FreeBoardVO freeBoard)throws BizException, IOException;
}