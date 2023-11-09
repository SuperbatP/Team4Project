package com.PhoenixHospital.reservation.service;

import com.PhoenixHospital.reservation.dao.IReservationDao;
import com.PhoenixHospital.reservation.vo.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationServiceImpl implements IReservationService{
    @Autowired
    IReservationDao reservationDao;

    @Override
    public List<ReservationVO> getReservationList() {
        List<ReservationVO>  reservationVOList = reservationDao.getReservationList();
        return reservationVOList;
    }

    @Override
    public ReservationVO getReservation(String memId) {
        ReservationVO reservationVO = reservationDao.getReservation(memId);
        return reservationVO;
    }

    @Override
    public void modifyReservation(ReservationVO reservation) {
        reservationDao.updateReservation(reservation);
    }

    @Override
    public void cancelReservation(ReservationVO reservation) {
        reservationDao.deleteReservation(reservation);
    }

    @Override
    public void registReservation(ReservationVO reservation) {
        reservation.setReservationNo("");
        reservationDao.insertReservation(reservation);
    }
}
