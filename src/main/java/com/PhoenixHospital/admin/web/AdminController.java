package com.PhoenixHospital.admin.web;

import com.PhoenixHospital.checkUp.service.ICheckUpService;
import com.PhoenixHospital.checkUp.vo.CheckUpVO;
import com.PhoenixHospital.doctor_attendance.service.IAttendanceService;
import com.PhoenixHospital.doctor_attendance.vo.AttendanceVO;
import com.PhoenixHospital.doctors.service.IDoctorsService;
import com.PhoenixHospital.doctors.vo.DoctorsVO;
import com.PhoenixHospital.exception.BizException;
import com.PhoenixHospital.member.service.IMemberService;
import com.PhoenixHospital.member.vo.MemberVO;
import com.PhoenixHospital.reservation.service.IReservationService;
import com.PhoenixHospital.reservation.vo.ReservationVO;
import com.PhoenixHospital.treatment_code.service.ITreatmentCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    ITreatmentCodeService treatmentCodeService;

    @Autowired
    IDoctorsService doctorsService;

    @Autowired
    IAttendanceService attendanceService;

    @Autowired
    IMemberService memberService;

    @Autowired
    IReservationService reservationService;

    @Autowired
    ICheckUpService checkUpService;

    //관리자가 개별 예약 확인(사용자 아이디 클릭시 모든 예약 과정 다 나옴)
    @RequestMapping(method = RequestMethod.POST, value = "/admin/memberReservation.wow")
    public String memberReservationView(Model model, String memId) throws BizException {

        MemberVO memberVO = memberService.getMember(memId);
        List<ReservationVO> reservationVOList = reservationService.getReservation(memId);
        List<CheckUpVO> checkUpVOList = checkUpService.getCheckUp(memId);

        model.addAttribute("reservation", reservationVOList);
        model.addAttribute("checkUp", checkUpVOList);
        model.addAttribute("member", memberVO);
        return "admin/memberReservation";
    }

    //관리자가 개별 예약 수정
    @RequestMapping(method = RequestMethod.POST, value = "/admin/adminReservationEdit.wow")
    public String memberReservationEdit(Model model, ReservationVO reservation, MemberVO memberVO) throws BizException {

        MemberVO member = memberService.getMember(reservation.getMemId());
        DoctorsVO doctorsVO = doctorsService.getDoc(reservation.getDcId());
        List<AttendanceVO> attendanceVOList = attendanceService.getAttendance(reservation.getDcId());
        List<ReservationVO> reservationVOList = reservationService.getReservationList();

        model.addAttribute("member", member);
        model.addAttribute("doctor", doctorsVO);
        model.addAttribute("attendance", attendanceVOList);
        model.addAttribute("reservation", reservationVOList);

        model.addAttribute("myReservation", reservation);

        return "/admin/adminReservationEdit";

    }

    //관리자가 개별 예약 수정 후 완료
    @PostMapping("/admin/adminReservationModify.wow")
    public String reservationModify(Model model, ReservationVO reservation, MemberVO memberVO){
        reservationService.modifyReservation(reservation);

        List<ReservationVO> reservationVOList = reservationService.getReservation(reservation.getMemId());
        List<CheckUpVO> checkUpVOList = checkUpService.getCheckUp(reservation.getMemId());

        model.addAttribute("reservation", reservationVOList);
        model.addAttribute("checkUp", checkUpVOList);

        return "admin/memberReservation";
    }

    //관리자가 회원 권한 및 탈퇴여부 + 모든 정보 처리
    @PostMapping("/member/updateUser.wow")
    public String updateUser(Model model, MemberVO member, HttpServletRequest request) throws BizException {

        memberService.updateUser(member);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
}

