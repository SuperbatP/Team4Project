package com.PhoenixHospital.admin.service;

import com.PhoenixHospital.admin.vo.AdminBoardVO;
import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.exception.BizPasswordNotMatchedException;

import java.util.List;

public interface IAdminBoardService {
    public List<AdminBoardVO> getAdminBoardList(PagingVO paging, SearchVO search, String searchCategory);
    public AdminBoardVO getAdminBoard(int boNo) throws BizNotFoundException;

    public void increaseHit(int boNo) throws BizNotEffectedException;

    public void modifyBoard(AdminBoardVO adminBoard)
            throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException ;
    public void removeBoard(AdminBoardVO adminBoard)
            throws BizNotFoundException,BizPasswordNotMatchedException, BizNotEffectedException ;
    public void registBoard(AdminBoardVO adminBoard) throws BizNotEffectedException;

}
