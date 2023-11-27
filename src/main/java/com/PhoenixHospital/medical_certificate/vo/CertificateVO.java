package com.PhoenixHospital.medical_certificate.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CertificateVO {
    private String certificationId;
    private String memId;
    private String certificationOpinion;
    private String certificationMedicine;
    private String certificationDiagnosis;
    private String dateOfOnset;
    private String certificationPeriod;
    private String reservationNo;

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

    public String getCertificationId() {
        return certificationId;
    }

    public void setCertificationId(String certificationId) {
        this.certificationId = certificationId;
    }

    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getCertificationOpinion() {
        return certificationOpinion;
    }

    public void setCertificationOpinion(String certificationOpinion) {
        this.certificationOpinion = certificationOpinion;
    }

    public String getCertificationMedicine() {
        return certificationMedicine;
    }

    public void setCertificationMedicine(String certificationMedicine) {
        this.certificationMedicine = certificationMedicine;
    }

    public String getCertificationDiagnosis() {
        return certificationDiagnosis;
    }

    public void setCertificationDiagnosis(String certificationDiagnosis) {
        this.certificationDiagnosis = certificationDiagnosis;
    }

    public String getDateOfOnset() {
        return dateOfOnset;
    }

    public void setDateOfOnset(String dateOfOnset) {
        this.dateOfOnset = dateOfOnset;
    }

    public String getCertificationPeriod() {
        return certificationPeriod;
    }

    public void setCertificationPeriod(String certificationPeriod) {
        this.certificationPeriod = certificationPeriod;
    }
}
