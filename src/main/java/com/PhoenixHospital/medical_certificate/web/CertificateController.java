package com.PhoenixHospital.medical_certificate.web;

import com.PhoenixHospital.doctors.service.IDoctorsService;
import com.PhoenixHospital.medical_certificate.service.CertificateServiceImpl;
import com.PhoenixHospital.medical_certificate.service.ICertificateService;
import com.PhoenixHospital.medical_certificate.vo.CertificateVO;
import com.PhoenixHospital.medical_history.service.IHistoryService;
import com.PhoenixHospital.treatment_code.service.ITreatmentCodeService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

@Controller
public class CertificateController {
    @Autowired
    ICertificateService certificateService;

    @Autowired
    IHistoryService historyService;

    @GetMapping("certificate/certificateChoice.wow")
    public String certificateChoice(){
        return "certificate/certificateChoice";
    }

    @RequestMapping("certificate/certificateHistory.wow")
    public String certificateHistory(Model model, String fileName, @AuthenticationPrincipal User user){
        model.addAttribute("history", historyService.getHistory(user.getUsername()));
        model.addAttribute("fileName", fileName);

        return "certificate/certificateHistory";
    }

    @ResponseBody
    @PostMapping("certificate/certificateDownload.wow")
    public void certificateDownload(Model model, CertificateVO certificate, String fileName, HttpServletResponse resp) throws IOException {
        File file = certificateService.getCertificate(certificate.getReservationNo(), fileName);

        String originalName = new String(fileName.getBytes("utf-8"),"iso-8859-1"); //"iso-8859-1
        resp.setHeader("Content-Type", MediaType.APPLICATION_PDF.toString());
        resp.setHeader("Content-Disposition", "inline;filename=\"" + originalName + "\";");
        resp.setHeader("Content-Transfer-Encoding", "binary;");
        resp.setContentLength((int) file.length()); // 진행율
        resp.setHeader("Pragma", "no-cache;");
        resp.setHeader("Expires", "-1;");
        // 저장된 파일을 응답객체의 스트림으로 내보내기,  resp의 outputStream에  해당파일을 복사
        FileUtils.copyFile(file, resp.getOutputStream());
        resp.getOutputStream().close();
    }
}
