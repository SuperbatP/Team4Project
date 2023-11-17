package com.PhoenixHospital.free.service;

import com.PhoenixHospital.attach.dao.IAttachDao;
import com.PhoenixHospital.attach.vo.AttachVO;
import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.exception.BizPasswordNotMatchedException;
import com.PhoenixHospital.free.dao.IFreeBoardDao;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeBoardServiceImpl implements IFreeBoardService {
    @Autowired
    private IFreeBoardDao freeBoardDao;

    @Autowired
    private IAttachDao attachDao;

    @Override
    public List<FreeBoardVO> getBoardList(PagingVO paging, SearchVO search, String searchCategory) {
        int totalRowCount = freeBoardDao.getTotalRowCount(paging, search, searchCategory);
        paging.setTotalRowCount(totalRowCount);
        //rowCount 임 /pageCount 아님
        paging.pageSetting();

        List<FreeBoardVO> freeBoardList = freeBoardDao.getBoardList(paging, search, searchCategory);
        return freeBoardList;
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

    @Override
    public void increaseHit(int boNo) throws BizNotEffectedException {
        int result = freeBoardDao.increaseHit(boNo);
        if (result < 0) throw new BizNotEffectedException();
    }

    @Override
    public void modifyBoard(FreeBoardVO freeBoard) throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
        FreeBoardVO dbVO = freeBoardDao.getBoard(freeBoard.getBoNo());
        if (dbVO == null) throw new BizNotFoundException();
        if (!dbVO.getBoPass().equals(freeBoard.getBoPass()))
            throw new BizPasswordNotMatchedException();
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

    @Override
    public void removeBoard(FreeBoardVO freeBoard) throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
        FreeBoardVO dbVO = freeBoardDao.getBoard(freeBoard.getBoNo());
        if (dbVO == null) throw new BizNotFoundException();
        if (!dbVO.getBoPass().equals(freeBoard.getBoPass()))
            throw new BizPasswordNotMatchedException();
        int result = freeBoardDao.deleteBoard(freeBoard);
        if (result < 1) throw new BizNotEffectedException();
    }


    @Override
    public void registBoard(FreeBoardVO freeBoard) throws BizNotEffectedException {
        int result = freeBoardDao.insertBoard(freeBoard);
        if (result < 1) throw new BizNotEffectedException();

        //freeBoard는 List<AttachVO>가 셋팅된 freeBoard.
        List<AttachVO> attaches = freeBoard.getAttaches();
        if (attaches != null) {
            for (AttachVO attach : attaches) {
                //지금은 위에 있는 freeBoard가 boNo가 0 ; db에 들어가기 전 seq가 실행되지 않으니까...
                //selectKey를 통해 먼저 완성된 boNo가 생김
                attach.setAtchParentNo(freeBoard.getBoNo());
                attachDao.insertAttach(attach);
            }
        }
    }

    @Override
    public int insertForm(FreeBoardVO freeBoard) throws Exception {
        int getfreeBoard = freeBoardDao.getfreeBoard(freeBoard);
        freeBoard.setTotalRowCount(getfreeBoard);
        //rowCount 임 /pageCount 아님
        freeBoard.pageSetting();
        int count = 0;
        count = freeBoardDao.insertBoard(freeBoard);
        return count;
    }
}