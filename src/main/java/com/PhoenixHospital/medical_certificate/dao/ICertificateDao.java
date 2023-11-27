package com.PhoenixHospital.medical_certificate.dao;

import com.PhoenixHospital.medical_certificate.vo.CertificateVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ICertificateDao {
    public CertificateVO getCertificate(String reservationNo);
}
