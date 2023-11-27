package com.PhoenixHospital.medical_history.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

public class HistoryVO {
    private String historyNo;
    private String memId;
    private String dtCode;
    private String dcId;
    private String dtName;
    private String dcName;
    private Date reservationDate;
    private String reservationDateString;
    private String cancelDate;
    private String reservationNo;

    @Override
    public String toString() {
        return ToStringBuilder
                .reflectionToString
                        (this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public String getReservationDateString() {
        return reservationDateString;
    }

    public void setReservationDateString(String reservationDateString) {
        this.reservationDateString = reservationDateString;
    }

    public String getDtName() {
        return dtName;
    }

    public void setDtName(String dtName) {
        this.dtName = dtName;
    }

    public String getDcName() {
        return dcName;
    }

    public void setDcName(String dcName) {
        this.dcName = dcName;
    }

    public String getHistoryNo() {
        return historyNo;
    }

    public void setHistoryNo(String historyNo) {
        this.historyNo = historyNo;
    }

    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
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

    public Date getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate;
    }

    public String getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(String cancelDate) {
        this.cancelDate = cancelDate;
    }

    public String getReservationNo() {
        return reservationNo;
    }

    public void setReservationNo(String reservationNo) {
        this.reservationNo = reservationNo;
    }
}
