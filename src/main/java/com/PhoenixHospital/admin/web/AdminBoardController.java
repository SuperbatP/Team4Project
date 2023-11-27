package com.PhoenixHospital.admin.web;

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
        if(adminBoardList.size() > 0)
        {
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
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        adminBoardService.registBoard(adminBoard);
        resultMessageVO.messageSetting(true, "생성", "생성하셨습니다.", "/admin/adminBoardList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
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
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(true, "수정", "수정에 성공하셨습니다.", "/admin/adminBoardList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }

    @RequestMapping(method = RequestMethod.POST, value = "admin/adminBoardDelete.wow")
    public String adminBoardDelete(Model model, AdminBoardVO adminBoard) throws BizException {
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        adminBoardService.removeBoard(adminBoard);
        resultMessageVO.messageSetting(true, "삭제", "삭제되었습니다.", "/admin/adminBoardList.wow", "목록으로");
        return "common/message";
    }

}


