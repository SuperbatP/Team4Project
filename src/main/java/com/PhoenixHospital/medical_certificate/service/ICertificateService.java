package com.PhoenixHospital.medical_certificate.service;

import com.PhoenixHospital.medical_certificate.vo.CertificateVO;

import java.io.File;
import java.util.List;

public interface ICertificateService {
    public File getCertificate(String reservationNo, String fileName);
}
