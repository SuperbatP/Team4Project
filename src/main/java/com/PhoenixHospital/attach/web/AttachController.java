package com.PhoenixHospital.attach.web;


import com.PhoenixHospital.attach.service.AttachServiceImpl;
import com.PhoenixHospital.attach.vo.AttachVO;
import com.PhoenixHospital.exception.BizNotFoundException;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@Controller
public class AttachController {

    @Autowired
    private AttachServiceImpl attachService;

    @Value("#{util['file.upload.path']}") //home/pc12/Aupload
    private String uploadPath;

    @ResponseBody
    @RequestMapping("/attach/download/{atchNo}")
    //@RequestMapping("/attach/download/{atchNo}") 의 값과 @PathVariable("atchNo") 값 같아야함.
    public void attachDownload(@PathVariable("atchNo") int atchNo, HttpServletResponse resp) throws UnsupportedEncodingException, BizNotFoundException, IOException {
        //DB에서 atchNo에 대한 AttachVO 조회
        AttachVO attach = attachService.getAttach(atchNo);
        String originalName = new String(attach.getAtchOriginalName().getBytes("utf-8"),"iso-8859-1"); //"iso-8859-1
        //파일의 원래 이름, 다운로드 시 화면 하단에 표시될 이름
        //화면 하단에 보여진다-> resp에 전달된다는 것. resp에 file로 들어갈 때(stream) 인코딩 해야함.

        String fileName = attach.getAtchFileName();
        //DB에서 찾아야 할 값.(우리는 랜덤으로 생성되게 함,)
        String filePath = attach.getAtchPath();
        //저장되어 있는 폴더 경로; 서버 컴퓨터에
        String path = uploadPath + File.separatorChar + filePath;
        // /home/pc12/Aupload/free
        // File.separator를 쓰는 이유는 운영체제마다 경로가 달라서 "/" vs "\"

        File file = new File(path, fileName);

        if(!file.isFile()) throw new BizNotFoundException("파일없음");

        // 다운로드를 위한 헤더 생성
        resp.setHeader("Content-Type", "application/octet-stream;");
        resp.setHeader("Content-Disposition", "attachment;filename=\"" + originalName + "\";");
        resp.setHeader("Content-Transfer-Encoding", "binary;");
        resp.setContentLength((int) file.length()); // 진행율
        resp.setHeader("Pragma", "no-cache;");
        resp.setHeader("Expires", "-1;");
        // 저장된 파일을 응답객체의 스트림으로 내보내기,  resp의 outputStream에  해당파일을 복사
        FileUtils.copyFile(file, resp.getOutputStream());
        resp.getOutputStream().close();
        
    }
}
