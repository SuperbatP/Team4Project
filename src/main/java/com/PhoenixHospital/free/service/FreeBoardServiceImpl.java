package com.PhoenixHospital.free.service;

import com.PhoenixHospital.attach.dao.IAttachDao;
import com.PhoenixHospital.attach.vo.AttachVO;
import com.PhoenixHospital.code.vo.CodeVO;
import com.PhoenixHospital.exception.BizException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.exception.BizPasswordNotMatchedException;
import com.PhoenixHospital.free.dao.IFreeBoardDao;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class FreeBoardServiceImpl implements IFreeBoardService {
    @Autowired
    private IFreeBoardDao freeBoardDao;

    @Autowired
    private IAttachDao attachDao;

    @Override
    public List<FreeBoardVO> getBoardList(FreeBoardVO freeBoardVO) {
        int totalRowCount = freeBoardDao.getTotalRowCount(freeBoardVO);
        freeBoardVO.setTotalRowCount(totalRowCount);
        freeBoardVO.pageSetting();
        List<FreeBoardVO> freeBoardList = freeBoardDao.getBoardList(freeBoardVO);


        return freeBoardList;
    }


    @Override
    public void increaseHit(int boNo) throws BizNotEffectedException {
        int result = freeBoardDao.increaseHit(boNo);
        if (result < 0) throw new BizNotEffectedException();
    }

    //수정
    @Override
    public void modifyBoard(FreeBoardVO freeBoard, @Param("boPass")String boPass) throws  BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {

        if (boPass.equals(freeBoard.getBoPass())){
            System.out.println(freeBoard);
            int result = freeBoardDao.updateBoard(freeBoard);
            if (result < 1) throw new BizNotEffectedException();
            //추가된 첨부파일 DB에 넣는 건 regist랑 똑같이.
            //차이점은 수정의 경우 특정 글에 대한 bo_bo가 넘어온다는 것.
            List<AttachVO> attaches = freeBoard.getAttaches();

            if (attaches != null) {
                for (AttachVO attach : attaches) {
                    attach.setAtchParentNo(freeBoard.getBoNo());
                    attachDao.insertAttach(attach);
                }
            }

            //휴지통 버튼에 의해 삭제될 첨부파일들을 처리해줘야 함.
            int[] delAtchNos = freeBoard.getDelAtchNos();
            //delAtchNos에 있는 모든 첨부파일을 받아옴. -> 그래서 배열형태
            //파라미터에 배열 + 쿼리문 forEach
            //where atch_no In(,,,,,)
            if (delAtchNos != null && delAtchNos.length > 0) {
                attachDao.delAtchNos(delAtchNos);
            }
        }

//        if (dbVO == null) throw new BizNotFoundException();
//        if (dbVO.getBoPass() == null || !dbVO.getBoPass().equals(freeBoard.getBoPass()))
//            throw new BizPasswordNotMatchedException();

    }

    //삭제
    @Override
    public void removeBoard(FreeBoardVO freeBoard, @Param("boPass")String boPass) throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
        FreeBoardVO dbVO = freeBoardDao.getBoard(freeBoard.getBoNo());
        int result = freeBoardDao.deleteBoard(freeBoard);
        if (result < 1) throw new BizNotEffectedException();
    }
// if (dbVO == null) throw new BizNotFoundException();
//        if (!dbVO.getBoPass().equals(freeBoard.getBoPass()))
//            throw new BizPasswordNotMatchedException();

    @Override
    public void registBoard(FreeBoardVO freeBoard) throws BizNotEffectedException {
//        int result = freeBoardDao.insertBoard(freeBoard);
//        if (result < 1) throw new BizNotEffectedException();
//
//        //freeBoard는 List<AttachVO>가 셋팅된 freeBoard.
//        List<AttachVO> attaches = freeBoard.getAttaches();
//        if (attaches != null) {
//            for (AttachVO attach : attaches) {
//                //지금은 위에 있는 freeBoard가 boNo가 0 ; db에 들어가기 전 seq가 실행되지 않으니까...
//                //selectKey를 통해 먼저 완성된 boNo가 생김
//                attach.setAtchParentNo(freeBoard.getBoNo());
//                attachDao.insertAttach(attach);
//            }
//        }
    }

    @Override
    public void insertForm(FreeBoardVO freeBoard) throws BizException {
        List<AttachVO> attaches = freeBoard.getAttaches();
        freeBoardDao.insertBoard(freeBoard);

        if (attaches != null) {
            for (AttachVO attach : attaches) {
                attach.setAtchParentNo(freeBoard.getBoNo());
                attachDao.insertAttach(attach);
            }
        }

        //휴지통 버튼에 의해 삭제될 첨부파일들을 처리해줘야 함.
        int[] delAtchNos = freeBoard.getDelAtchNos();
        //delAtchNos에 있는 모든 첨부파일을 받아옴. -> 그래서 배열형태
        //파라미터에 배열 + 쿼리문 forEach
        //where atch_no In(,,,,,)
        if (delAtchNos != null && delAtchNos.length > 0) {
            attachDao.delAtchNos(delAtchNos);
        }
    }

    @Override
    public FreeBoardVO freeView(int boNo) throws BizNotEffectedException, BizNotFoundException {

        return freeBoardDao.freeView(boNo);
    }

    @Override
    public List<CodeVO> freeEdit(int boNo) throws Exception{
        return freeBoardDao.freeEdit(boNo);
    }
    @Override
    public FreeBoardVO getBoard(int boNo) throws BizNotFoundException {
        FreeBoardVO freeBoard = freeBoardDao.getBoard(boNo);
        if (freeBoard == null) throw new BizNotFoundException();
        //----------------free board 가져오기------------------------------------------------

        //List<AttachVO> attaches = attachDao.getAttachListByParent(freeBoard.getBoNo(),"FREE");
        //어떤 글의 첨부파일'들' 이 필요하니까 List
        //freeBoard.setAttaches(attaches);
        //-------------- attach 가져오기------------------------------------------------------

        // resultMap을 통해 이미 freeBoard에는 attaches 가 셋팅되어 있다.
        return freeBoard;
    }

    public String resultMessageVO(int boNo){
        return freeBoardDao.resultMessage(boNo);
    }

    public String  freeRegist(FreeBoardVO freeBoard)throws BizException, IOException{
        return freeBoardDao.freeRegist(freeBoard);
    }



}