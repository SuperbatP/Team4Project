package com.PhoenixHospital.member.web;

import com.PhoenixHospital.checkUp.service.ICheckUpService;
import com.PhoenixHospital.checkUp.vo.CheckUpVO;
import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.common.vo.ResultMessageVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.exception.BizException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.service.IMemberService;
import com.PhoenixHospital.member.vo.MemberVO;
import com.PhoenixHospital.reservation.dao.IReservationDao;
import com.PhoenixHospital.reservation.service.IReservationService;
import com.PhoenixHospital.reservation.vo.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MemberController {
    @Autowired
    IMemberService memberService;

    @Autowired
    IReservationDao reservationDao;

    @Autowired
    IReservationService reservationService;

    @Autowired
    ICheckUpService checkUpService;

    @Autowired
    private IMemberDao memberDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    //회원목록
    @RequestMapping("/member/memberList.wow")
    public String memberList(Model model, @ModelAttribute("paging") PagingVO paging, @ModelAttribute("search") SearchVO search) {


        List<MemberVO> memberList = memberService.getMemberList(paging, search);
        model.addAttribute("memberList", memberList);

        return "member/memberList";
    }

    //회원개별내용
    @RequestMapping(method = RequestMethod.GET, value = "/member/memberView.wow")
    public String memberView(Model model, MemberVO memberVO) throws BizException {

        MemberVO member = memberService.getMember(memberVO.getMemId());
        model.addAttribute("member", member);

        return "member/memberView";

    }

    //회원 정보
    @GetMapping("/member/memberEdit.wow")
    public String memberEdit(Model model, @AuthenticationPrincipal User user) throws BizException {

        MemberVO member = memberService.getMember(user.getUsername());
        model.addAttribute("member", member);

        return "member/memberEdit";
    }

    //회원 정보 수정
    @PostMapping("/member/memberModify.wow")
    public String memberModify(Model model, MemberVO member) throws BizException {

        memberService.modifyMember(member);

        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(true, "수정", "수정성공했어요"
                , "/member/memberList.wow", "목록으로");
        model.addAttribute("resultMessageVO", resultMessageVO);

        return "common/message";
    }

 /*   @PostMapping("/member/memberDelete.wow")
    public String memberDelete(Model model, MemberVO member)throws BizException{

        memberService.removeMember(member);

        ResultMessageVO resultMessageVO=new ResultMessageVO();
        resultMessageVO.messageSetting(true ,"삭제"
                    , "삭제에 성공했어요" ,"/member/memberList.wow","목록으로");

        model.addAttribute("resultMessageVO", resultMessageVO);

        return  "common/message";
    }*/

    //회원가입
    @RequestMapping("/member/memberRegist.wow")
    public String memberRegist(Model model, MemberVO member) throws BizException {

        memberService.registMember(member);

        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(true, "등록", "등록성공했어요"
                , "/member/memberList.wow", "목록으로");

        model.addAttribute("resultMessageVO", resultMessageVO);

        return "common/message";

    }

    //회원가입 양식 이동
    @RequestMapping("/member/memberForm.wow")
    public String memberForm(Model model) {
        return "member/memberForm";
    }

    //관리자가 회원 권한 및 탈퇴여부 처리
    @PostMapping("/member/updateUser.wow")
    public String updateUser(Model model, MemberVO member) throws BizException {

        memberService.updateUser(member);

        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(true, "수정"
                , "수정에 성공했어요", "/member/memberList.wow", "목록으로");

        model.addAttribute("resultMessageVO", resultMessageVO);

        return "common/message";
    }

    //관리자가 회원의 예약 관리
    @RequestMapping("/member/memberReservationList.wow")
    public String memberReservationList(Model model, @ModelAttribute("paging") PagingVO paging, @ModelAttribute("search") SearchVO search) {

        List<ReservationVO> reservationVOList = reservationService.getReservationList();
        List<CheckUpVO> checkUpVOList = checkUpService.getCheckUpList();

        model.addAttribute("reservation", reservationVOList);
        model.addAttribute("checkUp", checkUpVOList);

        return "member/memberReservationList";
    }


    @RequestMapping(value = "/member/memberPasswordForm.wow", method = RequestMethod.GET)
    public String pwUpdateView() throws Exception {
        return "/member/memberPasswordForm";
    }

    //회원이 비밀번호 변경: 비번 조회
    @ResponseBody
    @RequestMapping(method = {RequestMethod.GET}, value = "/pwCheck")
    public int pwCheck(@RequestParam("memPassword") String memPassword, @AuthenticationPrincipal User user) throws BizNotFoundException {
        //user의 id얻기
        //id로 DB조회  ==> memberVO    memberVO는 DB에서 조회딘 비밀번호 그대로가지고옴(암호화된)
        MemberVO memberVO = memberService.getMember(user.getUsername());
        if (!passwordEncoder.matches(memPassword, memberVO.getMemPassword())) {
            return 0;
        }
        return 1;
    }

    //회원이 비밀번호 변경: 비번 변경 후 로그아웃 처리
    @RequestMapping(value = "/pwUpdate", method = RequestMethod.POST)
    public String pwUpdate(@AuthenticationPrincipal User user, String memberPw1) throws Exception {
        String memPassword = passwordEncoder.encode(memberPw1);
        memberService.pwUpdate(user.getUsername(), memPassword);
        return "redirect:/logout";
    }
}

