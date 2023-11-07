package com.PhoenixHospital.common.util;

import com.PhoenixHospital.attach.vo.AttachVO;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Component
//<input type=file> 로 날라온 파일을 경로에 업로드 하는 studyAttachUtils
public class StudyAttachUtils {
	@Value("#{util['file.upload.path']}")
	//appconfig.properties에 값 있음. alt+ctrl+b 누르면 해당 파일로 이동
	private String uploadPath;

	/** 다중 MultipartFile에서 VO 설정 및 업로드 파일 처리 후 List 리턴 */
	public List<AttachVO> getAttachListByMultiparts(MultipartFile[] multipartFiles, String category, String path)
			throws IOException {
		List<AttachVO> atchList = new ArrayList<AttachVO>();
		//여러개의 파일을 동시에 처리하니까, List로 받음.
		for (int i = 0; i < multipartFiles.length; i++) {
			MultipartFile multipart = multipartFiles[i];
			AttachVO vo = this.getAttachByMultipart(multipart, category, path);
			if (vo != null) {
				atchList.add(vo);
			}
		}
		return atchList;
	}

	/** MultipartFile에서 VO 설정 및 업로드 파일 처리 후 리턴, 없는 경우 null */
	public AttachVO getAttachByMultipart(MultipartFile multipart, String category, String path) throws IOException {
		//단일 파일 처리.
		if (!multipart.isEmpty()) {
			String fileName = UUID.randomUUID().toString();
			AttachVO vo = new AttachVO();
			vo.setAtchOriginalName(multipart.getOriginalFilename());
			vo.setAtchFileSize(multipart.getSize());
			vo.setAtchContentType(multipart.getContentType());
			vo.setAtchFileName(fileName);
			vo.setAtchCategory(category);
			vo.setAtchPath(path);
			vo.setAtchFancySize(fancySize(multipart.getSize()));
			String filePath = uploadPath + File.separatorChar + vo.getAtchPath();

			FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(filePath, fileName));
			// 여기서 실제 파일이 저장(regist에서 실행됬다), inputStream을 file로 변환하는 메소드
			// multipart.transferTo(new File(filePath, fileName)); // 비슷한 역할
			return vo;
		} else {
			return null;
		}
	}

	private DecimalFormat df = new DecimalFormat("#,###.0");
	//숫자형식 변환 -> 데이터 단위 쉽게 계산하기 위해.

	private String fancySize(long size) {
		if (size < 1024) { // 1k 미만
			return size + " Bytes";
		} else if (size < (1024 * 1024)) { // 1M 미만
			return df.format(size / 1024.0) + " KB";
		} else if (size < (1024 * 1024 * 1024)) { // 1G 미만
			return df.format(size / (1024.0 * 1024.0)) + " MB";
		} else {
			return df.format(size / (1024.0 * 1024.0 * 1024.0)) + " GB";
		}
	}

}