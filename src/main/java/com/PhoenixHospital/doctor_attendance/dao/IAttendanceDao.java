package com.PhoenixHospital.doctor_attendance.dao;

import com.PhoenixHospital.doctor_attendance.vo.AttendanceVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAttendanceDao {
    public List<AttendanceVO> getAttendance(String dcId);
}
