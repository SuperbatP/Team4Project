package com.PhoenixHospital.checkUp.service;

import com.PhoenixHospital.checkUp.dao.ICheckUpDao;
import com.PhoenixHospital.checkUp.vo.CheckUpVO;
import com.PhoenixHospital.reservation.vo.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CheckUpServiceImpl implements ICheckUpService{
    @Autowired
    ICheckUpDao checkUpDao;

    @Override
    public List<CheckUpVO> getCheckUpList() {
        List<CheckUpVO>  checkUpVOList = checkUpDao.getCheckUpList();
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        List<CheckUpVO> collect = checkUpVOList.stream().map(o -> {
            String str = format.format(o.getReservationDate());
            o.setReservationDateString(str);
            ;
            return o;
        }).collect(Collectors.toList());
        return collect;
    }

    @Override
    public List<CheckUpVO> getCheckUp(String memId) {
        return checkUpDao.getCheckUp(memId);
    }

    @Override
    public void registCheckUp(CheckUpVO checkUpVO) {
        checkUpDao.insertCheckUp(checkUpVO);
    }

    @Override
    public void modifyCheckUp(CheckUpVO checkUpVO) {
        checkUpDao.updateCheckUp(checkUpVO);
    }

    @Override
    public void cancelCheckUp(CheckUpVO checkUpVO) {
        checkUpDao.deleteCheckUp(checkUpVO);
    }
}
