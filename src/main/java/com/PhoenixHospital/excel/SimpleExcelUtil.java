package com.PhoenixHospital.excel;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;

public class SimpleExcelUtil {
    private XSSFWorkbook wb;
    private Sheet sheet;
    private Class<?> clazz;
    private List<?> list;

    public SimpleExcelUtil(String sheetName, Class<?> clazz, List<?> list) throws IllegalAccessException {
        wb = new XSSFWorkbook();
        sheet = wb.createSheet(sheetName);
        this.clazz = clazz;
        this.list = list;
        excelHeader(); //생성자 만들면서 header 생성
        excelBody(); //생성자 만들면서 Body 생성
    }

    private void excelHeader() {
        //reflection을 이용해서 모든 필드 이름 얻어내서 필드 이름은 hearder로
        //@ 붙여서 설정한 필드 값 나오게 ; bo_No가 아니라 글번호가 출력되게

        Row row = sheet.createRow(0);
        Cell cell = null;

        Field[] fields = clazz.getDeclaredFields();
        //각 클래스의 필드 갯수를 모름 -> Class<?> clazz에 정보있음!
        int cellNum = 0;

        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            ExcelColumn annotation = field.getAnnotation(ExcelColumn.class);
            if(annotation!=null){
                cell = row.createCell(cellNum++);
                cell.setCellValue(annotation.hearName());
            }


//            String simpleTypeName = field.getType().getSimpleName();
//            if (simpleTypeName.equals("String") || simpleTypeName.equals("int")) {
//                //freeboardVO에 있는 필요없는 필드 private int[] delAtchNos;  private List<AttachVO> attaches 안나오게 하려고
//                //특정 타입의 필드만 출력되게 함.
//                String fieldName = field.getName();
//                cell = row.createCell(i);
//                cell.setCellValue(fieldName);
//            }
        }
    }

    private void excelBody() throws IllegalAccessException {
        Row row = null;
        for (int i = 0; i < list.size(); i++) {
            Object obj = list.get(i);
            row = sheet.createRow(i + 1); //header에서 0을 사용했으니까...
            Cell cell = null;
            Field[] fields = clazz.getDeclaredFields();
            for (int j = 0; j < fields.length; j++) {

                Field field = fields[j];
                field.setAccessible(true); //원래 필드는 private인데 접근 가능하게
                //블로그에는 method를 이용해서 가져옴.

                ExcelColumn annotation = field.getAnnotation(ExcelColumn.class);
                if (annotation != null) {
                    Object o = field.get(obj); //현재 객체의 필드값 가져오기
                    if (o != null) {
                        cell = row.createCell(j);
                        cell.setCellValue(o.toString());

                    } else {
                        cell = row.createCell(j);
                        cell.setCellValue("null");

                    }
                }
                else {

                }
            }
        }
    }
//                String simpleTypeName = field.getType().getSimpleName();
//                if (simpleTypeName.equals("String") || simpleTypeName.equals("int")) {
//                    Object o = field.get(obj); //현재 객체의 필드값 가져오기
//                    //list.get(0).~~~ 가 넘어와야함.
//                    if(o!=null){
//                        cell = row.createCell(j);
//                        cell.setCellValue(o.toString());
//                    }else{
//                        cell = row.createCell(j);
//                        cell.setCellValue("null");
//                    }
//                }




    public void writeOutPutStream(HttpServletResponse response, String fileName) throws IOException {
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");  //파일이름지정.
        wb.write(response.getOutputStream());
    }
}
