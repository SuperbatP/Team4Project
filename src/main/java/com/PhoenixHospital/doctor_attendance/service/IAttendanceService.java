package com.PhoenixHospital.doctor_attendance.service;

import com.PhoenixHospital.doctor_attendance.vo.AttendanceVO;

import java.util.List;

public interface IAttendanceService {
    public List<AttendanceVO> getAttendance(String dcId);
}
