package com.PhoenixHospital.doctors.service;

import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.doctors.vo.DoctorsVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IDoctorsService {
    public List<DoctorsVO> getDocList(SearchVO search);
    public DoctorsVO getDoc(String dcId);
}
