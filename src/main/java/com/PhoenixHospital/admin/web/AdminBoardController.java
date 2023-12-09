package com.PhoenixHospital.admin.web;

import com.PhoenixHospital.admin.dao.IAdminBoardDao;
import com.PhoenixHospital.admin.service.IAdminBoardService;
import com.PhoenixHospital.admin.vo.AdminBoardVO;
import com.PhoenixHospital.attach.vo.AttachVO;
import com.PhoenixHospital.category.service.ICategoryService;
import com.PhoenixHospital.category.vo.CategoryVO;
import com.PhoenixHospital.common.util.StudyAttachUtils;
import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.ResultMessageVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.exception.BizPasswordNotMatchedException;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import com.PhoenixHospital.reply.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class AdminBoardController {
    @Autowired
    ICategoryService categoryService;
    @Autowired
    IAdminBoardService adminBoardService;
    @Autowired
    private StudyAttachUtils attachUtils;
    @Autowired
    private IAdminBoardDao adminBoardDao;

    @ExceptionHandler(value = {BizNotEffectedException.class,
            BizNotFoundException.class,
            BizPasswordNotMatchedException.class,
            BizException.class})
    public String exception(Model model, BizException e) {
        e.printStackTrace();
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(false, "에러", "에러입니다.", "", "홈으로 이동합니다.");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }

    @RequestMapping("/admin/adminBoardList.wow")
    public String adminBoardList(Model model,
                                 @ModelAttribute("paging") PagingVO paging,
                                 @ModelAttribute("search") SearchVO search,
                                 @ModelAttribute("searchCategory") String searchCategory) {
        List<CategoryVO> categoryList = categoryService.getCategoryList();
        model.addAttribute("categoryList", categoryList);
        List<AdminBoardVO> adminBoardList = adminBoardService.getAdminBoardList(paging, search, searchCategory);

        //뭐가 있을 때만 넣기
        if (adminBoardList.size() > 0) {
            model.addAttribute("adminBoardList", adminBoardList);
        }
        return "admin/adminBoardList";
    }

    @RequestMapping(method = RequestMethod.GET, value = "admin/adminBoardView.wow")
    public String adminBoardView(Model model, int boNo) throws BizNotFoundException, BizNotEffectedException {
        AdminBoardVO adminBoard = adminBoardService.getAdminBoard(boNo);
        model.addAttribute("adminBoard", adminBoard);
        adminBoardService.increaseHit(boNo);
        return "admin/adminBoardView";
    }

    @RequestMapping(method = RequestMethod.GET, value = "admin/adminBoardForm.wow")
    public String adminBoardForm(Model model) {
        List<CategoryVO> categoryList = categoryService.getCategoryList();
        model.addAttribute("categoryList", categoryList);
        return "admin/adminBoardForm";
    }

    @RequestMapping(method = RequestMethod.POST, value = "admin/adminBoardRegist.wow")
    public String adminBoardRegist(Model model, AdminBoardVO adminBoard, @RequestParam(required = false, name = "boFiles") MultipartFile[] boFiles) throws BizException, IOException {
        if (boFiles != null) {
            List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(boFiles, "A001", "admin");
            adminBoard.setAttaches(attaches);
        }
        adminBoardService.registBoard(adminBoard);
        model.addAttribute("adminBoard", adminBoard);
        return "redirect:/admin/adminBoardList.wow";
    }

    @RequestMapping(method = RequestMethod.GET, value = "admin/adminBoardEdit.wow")
    public String adminBoardEdit(Model model, int boNo) throws BizNotFoundException {
        List<CategoryVO> categoryList = categoryService.getCategoryList();
        model.addAttribute("categoryList", categoryList);
        AdminBoardVO adminBoard = adminBoardService.getAdminBoard(boNo);
        model.addAttribute("adminBoard", adminBoard);

        return "admin/adminBoardEdit";
    }

    @RequestMapping(method = RequestMethod.POST, value = "admin/adminBoardModify.wow")
    public String adminBoardModify(Model model, AdminBoardVO adminBoard, @RequestParam(name = "boFiles", required = false) MultipartFile[] boFiles) throws BizNotFoundException, BizNotEffectedException, BizPasswordNotMatchedException, IOException {
        if (boFiles != null) {
            List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(boFiles, "A001", "admin");
            adminBoard.setAttaches(attaches);
        }
        adminBoardService.modifyBoard(adminBoard);
        model.addAttribute("adminBoard", adminBoard);
        return "redirect:/admin/adminBoardList.wow";
    }

    @RequestMapping(method = RequestMethod.POST, value = "admin/adminBoardDelete.wow")
    public String adminBoardDelete(Model model, AdminBoardVO adminBoard) throws BizException {
        adminBoardService.removeBoard(adminBoard);
        model.addAttribute("adminBoard", adminBoard);
        return "redirect:/admin/adminBoardList.wow";
    }

    //공지글 답글 쓰기 화면 요청=============================================================================================
    @RequestMapping("admin/answerForm.wow")
    public String answer(Model model, @RequestParam int boNo) throws BizNotFoundException {

        List<CategoryVO> categoryList = categoryService.getCategoryList();

        AdminBoardVO adminBoardVO = adminBoardService.getAdminBoard(boNo);

        model.addAttribute("categoryList", categoryList);

        model.addAttribute("adminBoardVO", adminBoardVO);

        //원글의 정보를 답글 쓰기 화면에서 알 수 있도록 한다.
        return "admin/answerForm";
    } //reply()

    //공지글 신규 답글 저장 처리 요청=============================================================================================
    @RequestMapping("admin/answerRegist.wow")
    public String notice_answer_insert(Model model, AdminBoardVO adminBoard, AttachVO attach, ReplyVO reply, @RequestParam(required = false, name = "boFiles") MultipartFile[] boFiles) throws BizException, IOException {
        if (boFiles != null) {
            List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(boFiles, "A001", "admin");
            adminBoard.setAttaches(attaches);
        }
        adminBoardDao.changeboNo(adminBoard.getBoNo());
        adminBoardDao.changeboNoAttach(adminBoard.getBoNo());
        adminBoardDao.changeboNoReply(adminBoard.getBoNo());
        adminBoardService.answerRegistBoard(adminBoard);
        model.addAttribute("adminBoard", adminBoard);
        return "redirect:/admin/adminBoardList.wow";

    }

}

