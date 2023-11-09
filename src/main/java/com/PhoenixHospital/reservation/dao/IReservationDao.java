package com.PhoenixHospital.reservation.dao;

import com.PhoenixHospital.doctors.vo.DoctorsVO;
import com.PhoenixHospital.reservation.vo.ReservationVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IReservationDao {
    public List<ReservationVO> getReservationList();
    public ReservationVO getReservation(String memId);
    public int updateReservation(ReservationVO reservation);
    public int deleteReservation(ReservationVO reservation);
    public int insertReservation(ReservationVO reservation);
}
