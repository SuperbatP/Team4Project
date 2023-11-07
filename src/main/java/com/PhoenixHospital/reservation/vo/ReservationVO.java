package com.PhoenixHospital.reservation.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ReservationVO {
    private String reservationNo;
    private String memName;
    private String memId;
    private String memHp;
    private String dtCode;
    private String dcId;
    private String attendanceId;
    private String reservationDate;
    private String reservationTime;
    private String reservationRegDate;
    private String etc;
    private String cancelDate;
    private String reservationModDate;

    @Override
    public String toString() {
        return ToStringBuilder
                .reflectionToString
                        (this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public String getReservationNo() {
        return reservationNo;
    }

    public void setReservationNo(String reservationNo) {
        this.reservationNo = reservationNo;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getMemHp() {
        return memHp;
    }

    public void setMemHp(String memHp) {
        this.memHp = memHp;
    }

    public String getDtCode() {
        return dtCode;
    }

    public void setDtCode(String dtCode) {
        this.dtCode = dtCode;
    }

    public String getDcId() {
        return dcId;
    }

    public void setDcId(String dcId) {
        this.dcId = dcId;
    }

    public String getAttendanceId() {
        return attendanceId;
    }

    public void setAttendanceId(String attendanceId) {
        this.attendanceId = attendanceId;
    }

    public String getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(String reservationDate) {
        this.reservationDate = reservationDate;
    }

    public String getReservationTime() {
        return reservationTime;
    }

    public void setReservationTime(String reservationTime) {
        this.reservationTime = reservationTime;
    }

    public String getReservationRegDate() {
        return reservationRegDate;
    }

    public void setReservationRegDate(String reservationRegDate) {
        this.reservationRegDate = reservationRegDate;
    }

    public String getEtc() {
        return etc;
    }

    public void setEtc(String etc) {
        this.etc = etc;
    }

    public String getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(String cancelDate) {
        this.cancelDate = cancelDate;
    }

    public String getReservationModDate() {
        return reservationModDate;
    }

    public void setReservationModDate(String reservationModDate) {
        this.reservationModDate = reservationModDate;
    }
}
