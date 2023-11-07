package com.PhoenixHospital.excel;

import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import com.PhoenixHospital.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class ExcelController {
    @Autowired
    IExcelDao excelDao;

    @ResponseBody
    @RequestMapping("/excel/freeList.wow")
    public void excelFreeList(HttpServletResponse response, SearchVO searchVO, String searchCategory) throws IOException, IllegalAccessException {
        //데이터 만개 정도는 그냥 뿌린다고;;; 페이징이 필요하면 따로 알아서 구현
        List<FreeBoardVO> freeBoardList = excelDao.getFreeBoardBySearch(searchVO, searchCategory);

        SimpleExcelUtil simpleExcelUtil = new SimpleExcelUtil("freeSheet1", FreeBoardVO.class, freeBoardList);

        simpleExcelUtil.writeOutPutStream(response, "freeBoard");

//        XSSFWorkbook wb = new XSSFWorkbook();
//
//        String sheetName = "excelFreeList";
//        Sheet sheet = wb.createSheet(sheetName);
//
//        XSSFCellStyle cellStyle = wb.createCellStyle();
//        cellStyle.setFillBackgroundColor((short) 13);
//
//        XSSFFont font = wb.createFont();
//        font.setColor(IndexedColors.RED.getIndex());
//        cellStyle.setFont(font);
//
//        //sheet는 이름이 있음
//
//        int rowNum = 0;
//        Row row = sheet.createRow(rowNum++); //0
//        //row는 이름 없음 보통 숫자임
//
//        int cellNum = 0;
//        Cell cell = row.createCell(cellNum++);
//        cell.setCellValue("글번호");
//        Cell cell2 = row.createCell(cellNum++);
//        cell2.setCellValue("카테고리");
//        Cell cell3 = row.createCell(cellNum++);
//        cell3.setCellValue("제목");
//        Cell cell4 = row.createCell(cellNum++);
//        cell4.setCellValue("작성자");
//        Cell cell5 = row.createCell(cellNum++);
//        cell5.setCellValue("작성일");
//        Cell cell6 = row.createCell(cellNum++);
//        cell6.setCellValue("조회수");
//        Cell cell7 = row.createCell(cellNum++);
//        cell7.setCellValue("내용");
//        Cell cell8 = row.createCell(cellNum++);
//        cell8.setCellValue("삭제여부");
//        Cell cell9 = row.createCell(cellNum++);
//        cell9.setCellValue("분류코드 한글명");
//
//
//        //for문으로 돌릴곳...?
//        for (int i = 0; i < freeBoardList.size(); i++) {
//            row = sheet.createRow(i + 1);
//            cellNum = 0;
//            cell = row.createCell(cellNum++);
//            cell.setCellValue(freeBoardList.get(i).getBoNo());
//            cell2 = row.createCell(cellNum++);
//            cell2.setCellValue(freeBoardList.get(i).getBoCategory());
//            cell3 = row.createCell(cellNum++);
//            cell3.setCellValue(freeBoardList.get(i).getBoTitle());
//            cell4 = row.createCell(cellNum++);
//            cell4.setCellValue(freeBoardList.get(i).getBoWriter());
//            cell5 = row.createCell(cellNum++);
//            cell5.setCellValue(freeBoardList.get(i).getBoRegDate());
//            cell6 = row.createCell(cellNum++);
//            cell6.setCellValue(freeBoardList.get(i).getBoHit());
//            cell7 = row.createCell(cellNum++);
//            cell7.setCellValue(freeBoardList.get(i).getBoContent());
//            cell8 = row.createCell(cellNum++);
//            cell8.setCellValue(freeBoardList.get(i).getBoDelYn());
//            cell9 = row.createCell(cellNum++);
//            cell9.setCellValue(freeBoardList.get(i).getBoCategoryNm());
//        }
//
//
//        //이 안에서 만들어진 파일을 보내는 것.
//        // 컨텐츠 타입과 파일명 지정 : excel 전용 header
//        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");  //파일이름지정.
//        //response OutputStream에 엑셀 작성
//        wb.write(response.getOutputStream());
//
//        //  이 엑셀은 사용자에게 엑셀 데이터를 넘기기 위함.

    }

    @ResponseBody
    @RequestMapping("/excel/MemberList.wow")
    public void excelMemberList(HttpServletResponse response, SearchVO searchVO, String searchJob, String searchHobby) throws IOException, IllegalAccessException {
        //데이터 만개 정도는 그냥 뿌린다고;;; 페이징이 필요하면 따로 알아서 구현
        List<MemberVO> memberList = excelDao.getMemberBySearch(searchVO, searchJob, searchHobby);

        SimpleExcelUtil simpleExcelUtil = new SimpleExcelUtil("memberSheet1", MemberVO.class, memberList);

        simpleExcelUtil.writeOutPutStream(response, "memberList");

//        XSSFWorkbook wb = new XSSFWorkbook();
//
//        String sheetName = "excelMemberList";
//        Sheet sheet = wb.createSheet(sheetName);
//
//        XSSFCellStyle cellStyle = wb.createCellStyle();
//        cellStyle.setFillBackgroundColor((short) 13);
//
//        XSSFFont font = wb.createFont();
//        font.setColor(IndexedColors.RED.getIndex());
//        cellStyle.setFont(font);
//
//        //sheet는 이름이 있음
//
//        int rowNum = 0;
//        Row row = sheet.createRow(rowNum++); //0
//        //row는 이름 없음 보통 숫자임
//
//        int cellNum = 0;
//        Cell cell = row.createCell(cellNum++);
//        cell.setCellValue("아이디");
//        Cell cell2 = row.createCell(cellNum++);
//        cell2.setCellValue("이름");
//        Cell cell3 = row.createCell(cellNum++);
//        cell3.setCellValue("생일");
//        Cell cell4 = row.createCell(cellNum++);
//        cell4.setCellValue("우편번호");
//        Cell cell5 = row.createCell(cellNum++);
//        cell5.setCellValue("주소1");
//        Cell cell6 = row.createCell(cellNum++);
//        cell6.setCellValue("주소2");
//        Cell cell7 = row.createCell(cellNum++);
//        cell7.setCellValue("전화번호");
//        Cell cell8 = row.createCell(cellNum++);
//        cell8.setCellValue("메일");
//        Cell cell9 = row.createCell(cellNum++);
//        cell9.setCellValue("직업코드 한글명");
//        Cell cell10 = row.createCell(cellNum++);
//        cell10.setCellValue("취미코드 한글명");
//        Cell cell11 = row.createCell(cellNum++);
//        cell11.setCellValue("마일리지");
//
//
//        //for문으로 돌릴곳...?
//        for (int i = 0; i < memberList.size(); i++) {
//            row = sheet.createRow(i + 1);
//            cellNum = 0;
//            cell = row.createCell(cellNum++);
//            cell.setCellValue(memberList.get(i).getMemId());
//            cell2 = row.createCell(cellNum++);
//            cell2.setCellValue(memberList.get(i).getMemName());
//            cell3 = row.createCell(cellNum++);
//            cell3.setCellValue(memberList.get(i).getMemBir());
//            cell4 = row.createCell(cellNum++);
//            cell4.setCellValue(memberList.get(i).getMemZip());
//            cell5 = row.createCell(cellNum++);
//            cell5.setCellValue(memberList.get(i).getMemAdd1());
//            cell6 = row.createCell(cellNum++);
//            cell6.setCellValue(memberList.get(i).getMemAdd2());
//            cell7 = row.createCell(cellNum++);
//            cell7.setCellValue(memberList.get(i).getMemHp());
//            cell8 = row.createCell(cellNum++);
//            cell8.setCellValue(memberList.get(i).getMemMail());
//            cell9 = row.createCell(cellNum++);
//            cell9.setCellValue(memberList.get(i).getMemJobNm());
//            cell10 = row.createCell(cellNum++);
//            cell10.setCellValue(memberList.get(i).getMemHobbyNm());
//            cell11 = row.createCell(cellNum++);
//            cell11.setCellValue(memberList.get(i).getMemMileage());
//        }
//
//
//        //이 안에서 만들어진 파일을 보내는 것.
//        // 컨텐츠 타입과 파일명 지정 : excel 전용 header
//        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");  //파일이름지정.
//        //response OutputStream에 엑셀 작성
//        wb.write(response.getOutputStream());
//
//        //  이 엑셀은 사용자에게 엑셀 데이터를 넘기기 위함.
//
    }
}
