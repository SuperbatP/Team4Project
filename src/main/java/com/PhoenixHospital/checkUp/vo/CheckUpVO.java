package com.PhoenixHospital.checkUp.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

public class CheckUpVO {
    private String ckReservationNo;
    private String memId;
    private String reservationName;
    private String reservationGender;
    private String reservationBirthday;
    private String reservationHp;
    private String basicCheckupCode;
    private String addCheckupCode;
    private String dnaTestCode;
    private String reservationDateString;
    private Date reservationDate;
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

    public String getReservationDateString() {
        return reservationDateString;
    }

    public void setReservationDateString(String reservationDateString) {
        this.reservationDateString = reservationDateString;
    }

    public Date getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate;
    }

    public String getCkReservationNo() {
        return ckReservationNo;
    }

    public void setCkReservationNo(String ckReservationNo) {
        this.ckReservationNo = ckReservationNo;
    }

    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getReservationName() {
        return reservationName;
    }

    public void setReservationName(String reservationName) {
        this.reservationName = reservationName;
    }

    public String getReservationGender() {
        return reservationGender;
    }

    public void setReservationGender(String reservationGender) {
        this.reservationGender = reservationGender;
    }

    public String getReservationBirthday() {
        return reservationBirthday;
    }

    public void setReservationBirthday(String reservationBirthday) {
        this.reservationBirthday = reservationBirthday;
    }

    public String getReservationHp() {
        return reservationHp;
    }

    public void setReservationHp(String reservationHp) {
        this.reservationHp = reservationHp;
    }

    public String getBasicCheckupCode() {
        return basicCheckupCode;
    }

    public void setBasicCheckupCode(String basicCheckupCode) {
        this.basicCheckupCode = basicCheckupCode;
    }

    public String getAddCheckupCode() {
        return addCheckupCode;
    }

    public void setAddCheckupCode(String addCheckupCode) {
        this.addCheckupCode = addCheckupCode;
    }

    public String getDnaTestCode() {
        return dnaTestCode;
    }

    public void setDnaTestCode(String dnaTestCode) {
        this.dnaTestCode = dnaTestCode;
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
