package com.PhoenixHospital.member.web;

import com.PhoenixHospital.code.service.ICommCodeService;
import com.PhoenixHospital.code.vo.CodeVO;
import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.ResultMessageVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizException;
import com.PhoenixHospital.member.service.IMemberService;
import com.PhoenixHospital.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MemberController {
    @Autowired
    ICommCodeService codeService;

    @Autowired
    IMemberService memberService;

    @RequestMapping("/member/memberList.wow")
    public String memberList(Model model, @ModelAttribute("paging")PagingVO paging, @ModelAttribute("search") SearchVO search){


        List<MemberVO> memberList = memberService.getMemberList(paging, search);
        model.addAttribute("memberList", memberList);

        return "member/memberList";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/member/memberView.wow")
    public String memberView(Model model, @RequestParam(name = "memId") String memId )throws BizException {

        MemberVO member = memberService.getMember(memId);
        model.addAttribute("member",member);

        return "member/memberView";

    }
    @GetMapping("/member/memberEdit.wow")
    public String memberEdit(Model model, @RequestParam(name = "memId") String memId) throws BizException{

        MemberVO member = memberService.getMember(memId);
        model.addAttribute("member",member);

        return "member/memberEdit";
    }

    @PostMapping("/member/memberModify.wow")
    public String memberModify(Model model, MemberVO member) throws BizException{

        memberService.modifyMember(member);

        ResultMessageVO resultMessageVO=new ResultMessageVO();
        resultMessageVO.messageSetting(true,"수정","수정성공했어요"
                    ,"/member/memberList.wow" , "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);

        return "common/message";
    }
    @PostMapping("/member/memberDelete.wow")
    public String memberDelete(Model model, MemberVO member)throws BizException{

        memberService.removeMember(member);

        ResultMessageVO resultMessageVO=new ResultMessageVO();
        resultMessageVO.messageSetting(true ,"삭제"
                    , "삭제에 성공했어요" ,"/member/memberList.wow","목록으로");

        model.addAttribute("resultMessageVO", resultMessageVO);

        return  "common/message";
    }
    @RequestMapping("/member/memberRegist.wow")
    public String memberRegist(Model model, MemberVO member)throws BizException{

        memberService.registMember(member);

        ResultMessageVO resultMessageVO=new ResultMessageVO();
        resultMessageVO.messageSetting(true,"등록","등록성공했어요"
                ,"/member/memberList.wow" , "목록으로");

        model.addAttribute("resultMessageVO", resultMessageVO);

        return "common/message";

    }
    @RequestMapping("/member/memberForm.wow")
    public String  memberForm(Model model){
        return "member/memberForm";
    }

}
