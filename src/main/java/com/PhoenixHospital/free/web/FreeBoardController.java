package com.PhoenixHospital.free.web;

import com.PhoenixHospital.attach.vo.AttachVO;
import com.PhoenixHospital.code.service.ICommCodeService;
import com.PhoenixHospital.code.vo.CodeVO;
import com.PhoenixHospital.common.util.StudyAttachUtils;
import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.ResultMessageVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.exception.BizPasswordNotMatchedException;
import com.PhoenixHospital.free.service.IFreeBoardService;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class FreeBoardController {

    @Autowired
    private ICommCodeService codeService;

    @Autowired
    private IFreeBoardService freeBoardService;

    @Autowired
    private StudyAttachUtils attachUtils;


    @ExceptionHandler(value = {BizNotEffectedException.class, BizNotFoundException.class, BizPasswordNotMatchedException.class, BizException.class})
    public String Exception(Model model, BizException e) {
        e.printStackTrace();
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(false, "에러", "에러가 발생하였습니다", "/", "홈으로 이동");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }

    @RequestMapping("/free/freeList.wow")
    // 요청을 받는 과정으로 웹에서 가져온 파라미터를 다 가지고 온다...! ㅇ0ㅇ!!! 그냥 매개변수로 할당하면 ok!
    public String freeList(Model model, @ModelAttribute("paging") PagingVO paging, @ModelAttribute("search") SearchVO search, @ModelAttribute("searchCategory") String searchCategory) {


        List<FreeBoardVO> freeBoardList = freeBoardService.getBoardList(paging, search, searchCategory);

        model.addAttribute("freeBoardList", freeBoardList);

        return "free/freeList";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/free/freeView.wow")
    //@GetMapping("/free/freeView.wow")와 같은 맥락
    public String freeView(Model model, int boNo) throws BizNotEffectedException, BizNotFoundException {

        FreeBoardVO freeBoard = freeBoardService.getBoard(boNo);
        model.addAttribute("freeBoard", freeBoard);
       // freeBoardService.increaseHit(boNo);

        return "free/freeView";
    }

    @GetMapping("/free/freeEdit.wow")
    public String freeEdit(Model model, int boNo) throws BizNotFoundException {

        List<CodeVO> codeList = codeService.getCodeListByParent("BC00");
        model.addAttribute("codeList", codeList);

        FreeBoardVO freeBoard = freeBoardService.getBoard(boNo);
        model.addAttribute("freeBoard", freeBoard);

        return "free/freeEdit";
    }


    @PostMapping("/free/freeModify.wow")
    //edit 후 여기로 옴. 첨부파일도 처리해줘야 함.
    public String freeModify(Model model, FreeBoardVO freeBoard, @RequestParam(required = false, name = "boFiles") MultipartFile[] boFiles) throws BizException, IOException {
        // 날라온 첨부파일들에 대해서는 form과 동일
        if(boFiles!=null){
            List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(boFiles, "FREE", "free");
            freeBoard.setAttaches(attaches);
        }

        //form과 차이점은 휴지통 버튼을 통해 삭제해야 할 첨부파일 번호들도 날라옴 -> service에서 처리함.
        //freeBoardVO의 delAtchNos 필드가 있음.
        freeBoardService.modifyBoard(freeBoard);

        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(true, "수정", "수정성공", "/free/freeList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }


    @PostMapping("/free/freeDelete.wow")
    //BizException를 상속받은거라 throws BizException 하나만 작성해도 ok
    public String freeDelete(Model model, @ModelAttribute("freeBoard") FreeBoardVO freeBoard) throws BizException {

        ResultMessageVO resultMessageVO = new ResultMessageVO();

        freeBoardService.removeBoard(freeBoard);
        resultMessageVO.messageSetting(true, "삭제", "삭제성공", "/free/freeList.wow", "목록으로");

        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }

    //파일 처리는 freeRegist에서.
    @RequestMapping("/free/freeRegist.wow")
    public String freeRegist(Model model, FreeBoardVO freeBoard, @RequestParam(required = false, name = "boFiles") MultipartFile[] boFiles) throws BizException, IOException {
        // 파일의 필수값을 false로 하지 않으면 파일 첨부안하면 에러 -> 반대로 필요 자료가 있으면 true로 하면 될 듯.
        // MultipartFile[] 는 다중의 파일을 처리하니까 배열형태.

        if (boFiles != null) {// 파일 이 있다면.
           /* for (MultipartFile multipartFile : boFiles) {
                String randomFileName = UUID.randomUUID().toString();   //파일이름은 랜덤해야됨. 사용자가 올리는 다른 파일이름이 같을 수 있음.
                FileUtils.copyInputStreamToFile(multipartFile.getInputStream(), new File("/home/pc12/AUpload/free", randomFileName));
                //copyInputStreamToFile inputstream을 파일로 copy
                //multipartFile : 사용자가 컴퓨터에서 선택한 파일
                //new File("패스", "파일이름") : 서버에 저장될 파일. 패스는 서버 컴퓨터에 파일이 저장되는 경로, 파일이름은 겹치지 않게 고유해야함.
            }*/

            //위의 내용은 StudyAttachUtils의 AttachVO getAttachByMultipart()에 있음.

            List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(boFiles, "FREE", "free");
            //category 와 path 의 값은 하드코딩이 아니라 따로 변수로 빼주는게 맞음.
            freeBoard.setAttaches(attaches);
            //public AttachVO getAttachByMultipart()를 보면 return 이 vo -> List<AttachVO> 타입임.
            //path는 서버 컴퓨터에 저장될 폴더 이름.
            //여기서 파일 업로드가 됨.
            //freeRegist에 파일을 등록할 때 atchParentNo가 없는 상태임(아직 등록을 안했으니까...) 능
            // 그러다 보니 atchParentNo을 먼저 할당해야함.


        }// 파일 업로드 끝

        // 파일에 대한 정보를 AttachVO에 담아서 DB에 저장. -> 서비스에서 해야함.장

        ResultMessageVO resultMessageVO = new ResultMessageVO();

        freeBoardService.registBoard(freeBoard);
        resultMessageVO.messageSetting(true, "등록", "등록성공", "/free/freeFrom.wow", "목록으로");

        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }

    @RequestMapping("/free/freeForm.wow")
    public String freeForm(Model model, FreeBoardVO freeBoard, @RequestParam(required = false, name = "boFiles") MultipartFile[] boFiles) throws Exception {
        //List<CodeVO> codeList = codeService.getCodeListByParent("BC00");
        //model.addAttribute("codeList", codeList);


        return "free/freeForm";
    }

    //@RequestMapping("/board/freeForm.wow")
    //public String freeForm() throws Exception {
    //    return "/free/freeForm";
    //}

    @RequestMapping("/free/insertForm.wow")
    public String insertForm(Model model, FreeBoardVO freeBoard, @RequestParam(required = false, name = "boFiles") MultipartFile[] boFiles) throws BizException {

       freeBoard.setCategory_Code("99");
        freeBoardService.insertForm(freeBoard);
        return "redirect:/free/freeList.wow";
    }


}






