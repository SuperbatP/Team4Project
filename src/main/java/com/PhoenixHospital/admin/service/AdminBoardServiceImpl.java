package com.PhoenixHospital.admin.service;

import com.PhoenixHospital.admin.dao.IAdminBoardDao;
import com.PhoenixHospital.admin.vo.AdminBoardVO;
import com.PhoenixHospital.attach.dao.IAttachDao;
import com.PhoenixHospital.attach.vo.AttachVO;
import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.exception.BizPasswordNotMatchedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminBoardServiceImpl implements IAdminBoardService {

    @Autowired
    IAdminBoardDao adminBoardDao;

    @Autowired
    private IAttachDao attachDao;

    @Override
    public List<AdminBoardVO> getAdminBoardList(PagingVO paging, SearchVO search, String searchCategory) {
        int totalRowCount = adminBoardDao.getTotalRowCount(paging, search, searchCategory);
        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();
        List<AdminBoardVO> adminBoardList = adminBoardDao.getAdminBoardList(paging, search, searchCategory);
        return adminBoardList;
    }

    @Override
    public AdminBoardVO getAdminBoard(int boNo) throws BizNotFoundException {
        AdminBoardVO adminBoard = adminBoardDao.getAdminBoard(boNo);
        if (adminBoard == null) throw new BizNotFoundException();
        return adminBoard;
    }

    @Override
    public void increaseHit(int boNo) throws BizNotEffectedException {
        int count = adminBoardDao.increaseHit(boNo);
    }

    @Override
    public void modifyBoard(AdminBoardVO adminBoard) throws BizNotFoundException, BizNotEffectedException {
        AdminBoardVO daoBoardList = adminBoardDao.getAdminBoard(adminBoard.getBoNo());

        int count = adminBoardDao.updateBoard(adminBoard);
        if (count < 1) {
            throw new BizNotEffectedException();
        }
        if (daoBoardList == null) {
            throw new BizNotFoundException();
        }

        List<AttachVO> attaches = adminBoard.getAttaches();
        if (attaches != null) {
            for (AttachVO attach : attaches) {
                attach.setAtchParentNo(adminBoard.getBoNo());
                attachDao.insertAttach(attach);
            }
        }
        int[] delAtchNos = adminBoard.getDelAtchNos();
        if (delAtchNos != null && delAtchNos.length > 0) {
            attachDao.delAtchNos(delAtchNos);
        }
    }

    @Override
    public void removeBoard(AdminBoardVO adminBoard) throws BizNotFoundException, BizNotEffectedException {
        AdminBoardVO daoBoardList = adminBoardDao.getAdminBoard(adminBoard.getBoNo());


        int count = adminBoardDao.deleteBoard(adminBoard);
        if (count < 1) {
            throw new BizNotFoundException();
        }
    }

    @Override
    public void registBoard(AdminBoardVO adminBoard) throws BizNotEffectedException {
        int count = adminBoardDao.insertBoard(adminBoard);

        if (count < 1) {
            throw new BizNotEffectedException();
        }
        List<AttachVO> attaches = adminBoard.getAttaches();
        if (attaches != null) {
            for (AttachVO attach : attaches) {
                attach.setAtchParentNo(adminBoard.getBoNo());
                attachDao.insertAttach(attach);
            }
        }

    }

    @Override
    public void answerRegistBoard(AdminBoardVO adminBoard) throws BizNotEffectedException {
        int count = adminBoardDao.notice_answer_insert(adminBoard);

        if (count < 1) {
            throw new BizNotEffectedException();
        }
        List<AttachVO> attaches = adminBoard.getAttaches();
        if (attaches != null) {
            for (AttachVO attach : attaches) {
                attach.setAtchParentNo(adminBoard.getBoNo());
                attachDao.insertAttach(attach);
            }
        }


    }

}

