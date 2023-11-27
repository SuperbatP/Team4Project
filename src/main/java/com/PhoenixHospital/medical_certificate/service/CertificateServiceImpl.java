package com.PhoenixHospital.medical_certificate.service;

import com.PhoenixHospital.medical_certificate.dao.ICertificateDao;
import com.PhoenixHospital.medical_certificate.vo.CertificateVO;
import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.vo.MemberVO;
import com.aspose.pdf.*;
import com.aspose.pdf.operators.ConcatenateMatrix;
import com.aspose.pdf.operators.Do;
import com.aspose.pdf.operators.GRestore;
import com.aspose.pdf.operators.GSave;
import com.aspose.pdf.text.FontTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class CertificateServiceImpl implements ICertificateService {
    @Autowired
    ICertificateDao certificateDao;

    @Autowired
    IMemberDao memberDao;

    @Value("#{util['file.pdf.path']}")
    //appconfig.properties에 값 있음. alt+ctrl+b 누르면 해당 파일로 이동
    private String uploadPath;

    private void addText(String str, double x, double y, Document pdfDocument){
        TextFragment text = new TextFragment(str);
        text.setPosition(new Position(x, y));
        try{
            ClassPathResource resource = new ClassPathResource("NanumGothic.ttf");
            InputStream fontStream = resource.getInputStream();

            text.getTextState().setFont(FontRepository.openFont(fontStream, FontTypes.TTF));
        } catch (IOException e){
            e.printStackTrace();
        }
        pdfDocument.getPages().get_Item(1).getParagraphs().add(text);
    }

    private void setWatermark(Document pdfDocument, String reservationNo, String fileName){
        double w = pdfDocument.getPageInfo().getWidth();
        double h = pdfDocument.getPageInfo().getHeight();

        double lowerLeftX = 0;
        double lowerLeftY = 0;
        double upperRightX = w;
        double upperRightY = h;

// 이미지를 추가할 페이지를 가져옵니다.
        Page page = pdfDocument.getPages().get_Item(1);

// 스트림에 이미지 로드
        ClassPathResource resource = new ClassPathResource("병원로고_워터마크.png");
        InputStream imageStream = null;
        try {
            imageStream = resource.getInputStream();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

// 페이지 리소스의 이미지 컬렉션에 이미지 추가
        page.getResources().getImages().add(imageStream);

// GSave 연산자 사용: 이 연산자는 현재 그래픽 상태를 저장합니다.
        page.getContents().add(new GSave());
// Rectangle 및 Matrix 객체 만들기
        Rectangle rectangle = new Rectangle(lowerLeftX, lowerLeftY, upperRightX, upperRightY);
        Matrix matrix = new Matrix(new double[] { rectangle.getURX() - rectangle.getLLX(), 0, 0, rectangle.getURY() - rectangle.getLLY(), rectangle.getLLX(), rectangle.getLLY() });

// ConcatenateMatrix(행렬 연결) 연산자 사용: 이미지를 배치하는 방법을 정의합니다.
        page.getContents().add(new ConcatenateMatrix(matrix));
        XImage ximage = page.getResources().getImages().get_Item(page.getResources().getImages().size());

// Do 연산자 사용: 이 연산자는 이미지를 그립니다.
        page.getContents().add(new Do(ximage.getName()));

// GRestore 연산자 사용: 이 연산자는 그래픽 상태를 복원합니다.
        page.getContents().add(new GRestore());

// 새 PDF 저장
        pdfDocument.save(uploadPath + File.separatorChar + reservationNo + fileName + ".pdf");

// 이미지 스트림 닫기
        try {
            imageStream.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createPdf1(Document pdfDocument,CertificateVO certificate, MemberVO member) {
        addText(member.getMemName(), 150, 625, pdfDocument);
        addText(member.getMemAdd1(), 150, 590, pdfDocument);
        addText(certificate.getCertificationDiagnosis(), 150, 540, pdfDocument);
        addText(certificate.getDateOfOnset(), 150, 480, pdfDocument);
        addText(certificate.getCertificationPeriod(), 370, 480, pdfDocument);
        addText(certificate.getCertificationOpinion(), 150, 440, pdfDocument);

        Date today = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
        addText(format.format(today), 155, 255, pdfDocument);
    }

    private void createPdf2(Document pdfDocument,CertificateVO certificate, MemberVO member){
        addText(member.getMemName(), 150, 725, pdfDocument);
        addText(member.getMemAdd1(), 150, 690, pdfDocument);
        addText(certificate.getCertificationDiagnosis(), 150, 640, pdfDocument);
        addText(certificate.getCertificationPeriod(), 430, 625, pdfDocument);
        addText(certificate.getDateOfOnset(), 150, 590, pdfDocument);
        addText(certificate.getCertificationOpinion(), 150, 560, pdfDocument);

        Date today = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
        addText(format.format(today), 260, 350, pdfDocument);
    }

    private void createPdf3(Document pdfDocument,CertificateVO certificate, MemberVO member){
        addText(member.getMemName(), 110, 615, pdfDocument);
        addText(certificate.getCertificationPeriod(), 230, 615, pdfDocument);
        addText("100,000", 305, 540, pdfDocument);
        addText("50,000", 305, 505, pdfDocument);
        addText("200,000", 305, 465, pdfDocument);
        addText("150,000", 305, 430, pdfDocument);

        Date today = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
        addText(format.format(today), 255, 315, pdfDocument);
    }

    @Override
    public File getCertificate(String reservationNo, String fileName) {
        System.out.println(reservationNo);
        CertificateVO certificateVO = certificateDao.getCertificate(reservationNo);
        MemberVO memberVO = memberDao.getMember(certificateVO.getMemId());

        String s = uploadPath + File.separatorChar + fileName + ".pdf";
        Document pdfDocument = new Document(s);

        if(fileName.equals("진단서")){
            createPdf1(pdfDocument, certificateVO, memberVO);
        } else if (fileName.equals("소견서")) {
            createPdf2(pdfDocument, certificateVO, memberVO);
        } else if (fileName.equals("진료계산서영수증")) {
            createPdf3(pdfDocument, certificateVO, memberVO);
        }

        setWatermark(pdfDocument, reservationNo, fileName);
        File file = new File(uploadPath + File.separatorChar + reservationNo + fileName + ".pdf");

        return file;
    }
}
