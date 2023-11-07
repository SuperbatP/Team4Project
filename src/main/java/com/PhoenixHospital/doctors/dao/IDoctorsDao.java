package com.PhoenixHospital.doctors.dao;

import com.PhoenixHospital.doctors.vo.DoctorsVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IDoctorsDao {
    public List<DoctorsVO> getDocList(@Param("searchWord") String searchWord);
}
