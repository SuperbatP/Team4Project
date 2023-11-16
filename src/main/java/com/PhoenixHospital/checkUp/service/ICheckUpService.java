package com.PhoenixHospital.checkUp.service;

import com.PhoenixHospital.checkUp.vo.CheckUpVO;

import java.util.List;

public interface ICheckUpService {
    public List<CheckUpVO> getCheckUpList();
    public List<CheckUpVO> getCheckUp(String memId);
    public void registCheckUp(CheckUpVO checkUpVO);
    public void modifyCheckUp(CheckUpVO checkUpVO);
    public void cancelCheckUp(CheckUpVO checkUpVO);
}
