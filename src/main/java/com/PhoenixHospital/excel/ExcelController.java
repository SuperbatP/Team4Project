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

    }

    @ResponseBody
    @RequestMapping("/excel/MemberList.wow")
    public void excelMemberList(HttpServletResponse response, SearchVO searchVO, String searchJob, String searchHobby) throws IOException, IllegalAccessException {
        //데이터 만개 정도는 그냥 뿌린다고;;; 페이징이 필요하면 따로 알아서 구현
        List<MemberVO> memberList = excelDao.getMemberBySearch(searchVO, searchJob, searchHobby);

        SimpleExcelUtil simpleExcelUtil = new SimpleExcelUtil("memberSheet1", MemberVO.class, memberList);

        simpleExcelUtil.writeOutPutStream(response, "memberList");

    }
}
