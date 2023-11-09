package com.PhoenixHospital.doctors.service;

import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.doctors.dao.IDoctorsDao;
import com.PhoenixHospital.doctors.vo.DoctorsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorsServiceImpl implements IDoctorsService{
    @Autowired
    IDoctorsDao doctorsDao;

    @Override
    public List<DoctorsVO> getDocList(SearchVO search) {
        return doctorsDao.getDocList(search);
    }

    @Override
    public DoctorsVO getDoc(String dcId) {
        return doctorsDao.getDoc(dcId);
    }
}
