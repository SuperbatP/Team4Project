package com.PhoenixHospital.medical_history.service;

import com.PhoenixHospital.medical_history.dao.IHistoryDao;
import com.PhoenixHospital.medical_history.vo.HistoryVO;
import com.PhoenixHospital.reservation.vo.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class HistoryServiceImpl implements IHistoryService {
    @Autowired
    IHistoryDao historyDao;

    @Override
    public List<HistoryVO> getHistory(String memId) {
        List<HistoryVO> historyVOList = historyDao.getHistory(memId);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        List<HistoryVO> collect = historyVOList.stream().map(o -> {
            String str = format.format(o.getReservationDate());
            o.setReservationDateString(str);

            return o;
        }).collect(Collectors.toList());
        return collect;
    }
}
