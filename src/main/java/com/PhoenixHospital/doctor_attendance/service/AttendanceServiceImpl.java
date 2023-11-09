package com.PhoenixHospital.doctor_attendance.service;

import com.PhoenixHospital.doctor_attendance.dao.IAttendanceDao;
import com.PhoenixHospital.doctor_attendance.vo.AttendanceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttendanceServiceImpl implements IAttendanceService{
    @Autowired
    IAttendanceDao attendanceDao;

    @Override
    public List<AttendanceVO> getAttendance(String dcId) {
        return attendanceDao.getAttendance(dcId);
    }
}
