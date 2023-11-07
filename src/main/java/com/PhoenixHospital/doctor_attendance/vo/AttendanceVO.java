package com.PhoenixHospital.doctor_attendance.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class AttendanceVO {
    private String attendanceId;
    private String dcId;
    private String dtCode;
    private String attendanceDate;
    private String attendanceTime;
    private String reservationYn;

    @Override
    public String toString() {
        return ToStringBuilder
                .reflectionToString
                        (this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public String getAttendanceId() {
        return attendanceId;
    }

    public void setAttendanceId(String attendanceId) {
        this.attendanceId = attendanceId;
    }

    public String getDcId() {
        return dcId;
    }

    public void setDcId(String dcId) {
        this.dcId = dcId;
    }

    public String getDtCode() {
        return dtCode;
    }

    public void setDtCode(String dtCode) {
        this.dtCode = dtCode;
    }

    public String getAttendanceDate() {
        return attendanceDate;
    }

    public void setAttendanceDate(String attendanceDate) {
        this.attendanceDate = attendanceDate;
    }

    public String getAttendanceTime() {
        return attendanceTime;
    }

    public void setAttendanceTime(String attendanceTime) {
        this.attendanceTime = attendanceTime;
    }

    public String getReservationYn() {
        return reservationYn;
    }

    public void setReservationYn(String reservationYn) {
        this.reservationYn = reservationYn;
    }
}
