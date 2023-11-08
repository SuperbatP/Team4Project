package com.PhoenixHospital.doctors.dao;

import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.doctors.vo.DoctorsVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IDoctorsDao {
    public List<DoctorsVO> getDocList(@Param("search") SearchVO search);
}
