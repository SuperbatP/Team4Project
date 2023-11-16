package com.PhoenixHospital.reservation.service;

import com.PhoenixHospital.reservation.vo.ReservationVO;

import java.util.List;

public interface IReservationService {
    public List<ReservationVO> getReservationList();
    public List<ReservationVO> getReservation(String memId);
    public void modifyReservation(ReservationVO reservation);
    public void cancelReservation(ReservationVO reservation);
    public void registReservation(ReservationVO reservation);
}
