package com.PhoenixHospital.checkUp.dao;

import com.PhoenixHospital.checkUp.vo.CheckUpVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ICheckUpDao {
    public List<CheckUpVO> getCheckUpList();
    public List<CheckUpVO> getCheckUp(String memId);
    public int insertCheckUp(CheckUpVO checkUpVO);
    public int deleteCheckUp(CheckUpVO checkUpVO);
    public int updateCheckUp(CheckUpVO checkUpVO);
}
