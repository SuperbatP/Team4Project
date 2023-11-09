package com.PhoenixHospital.reservation.dao;

import com.PhoenixHospital.doctors.vo.DoctorsVO;
import com.PhoenixHospital.reservation.vo.ReservationVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IReservationDao {
    public List<ReservationVO> getReservationList();
}
