package com.PhoenixHospital.reservation.service;

import com.PhoenixHospital.reservation.dao.IReservationDao;
import com.PhoenixHospital.reservation.vo.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ReservationServiceImpl implements IReservationService{
    @Autowired
    IReservationDao reservationDao;

    @Override
    public List<ReservationVO> getReservationList() {
        List<ReservationVO>  reservationVOList = reservationDao.getReservationList();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        List<ReservationVO> collect = reservationVOList.stream().map(o -> {
            String str = format.format(o.getReservationDate());
            o.setReservationDateString(str);

            return o;
        }).collect(Collectors.toList());
        return collect;
    }

    @Override
    public List<ReservationVO> getReservation(String memId) {
        List<ReservationVO> reservationVO = reservationDao.getReservation(memId);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        List<ReservationVO> collect = reservationVO.stream().map(o -> {
            String str = format.format(o.getReservationDate());
            o.setReservationDateString(str);

            return o;
        }).collect(Collectors.toList());
        return collect;
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
        reservationDao.insertReservation(reservation);
    }
}
