package com.PhoenixHospital.reservation.web;

import com.PhoenixHospital.checkUp.service.ICheckUpService;
import com.PhoenixHospital.checkUp.vo.CheckUpVO;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.doctor_attendance.service.IAttendanceService;
import com.PhoenixHospital.doctor_attendance.vo.AttendanceVO;
import com.PhoenixHospital.doctors.service.IDoctorsService;
import com.PhoenixHospital.doctors.vo.DoctorsVO;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.service.IMemberService;
import com.PhoenixHospital.member.vo.MemberVO;
import com.PhoenixHospital.reservation.service.IReservationService;
import com.PhoenixHospital.reservation.vo.ReservationVO;
import com.PhoenixHospital.treatment_code.service.ITreatmentCodeService;
import com.PhoenixHospital.treatment_code.vo.TreatmentCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class ReservationController {
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

    @GetMapping("reservation/reservationSearch.wow")
    public String reservationSearch(Model model){
        List<TreatmentCodeVO> codeList = treatmentCodeService.getCodeList();
        model.addAttribute("codeList", codeList);

        return "reservation/reservationSearch";
    }

    @GetMapping("reservation/reservationList.wow")
    public String reservationList(Model model, SearchVO search){
        List<DoctorsVO> doctorsList = doctorsService.getDocList(search);
        Map<String, List<String>> attendanceVOMap = new HashMap<>(); //나중에 Service로 옮겨야됨
        for (int i = 0; i < doctorsList.size(); i++) {
            String dcId = doctorsList.get(i).getDcId();
            List<String> collect = attendanceService.getAttendance(dcId).stream().map(o -> o.getAttendanceDate()).collect(Collectors.toList());

            attendanceVOMap.put(dcId, collect);
        }

        model.addAttribute("doctors", doctorsList);
        model.addAttribute("attendance", attendanceVOMap);

        return "reservation/reservationList";
    }

    @RequestMapping("reservation/reservationForm.wow")
    public String reservationForm(Model model, String dcId, @AuthenticationPrincipal User user) throws BizNotFoundException {

        MemberVO member = memberService.getMember(user.getUsername());
        DoctorsVO doctorsVO = doctorsService.getDoc(dcId);
        List<AttendanceVO> attendanceVOList = attendanceService.getAttendance(dcId);
        List<ReservationVO> reservationVOList = reservationService.getReservationList();

        model.addAttribute("member", member);
        model.addAttribute("doctor", doctorsVO);
        model.addAttribute("attendance", attendanceVOList);
        model.addAttribute("reservation", reservationVOList);

        return "reservation/reservationForm";
    }

    @PostMapping("reservation/reservationRegist.wow")
    public String reservationRegist(Model model, ReservationVO reservation, @AuthenticationPrincipal User user){
        reservation.setMemId(user.getUsername());
        reservationService.registReservation(reservation);

        List<ReservationVO> reservationVOList = reservationService.getReservation(user.getUsername());
        List<CheckUpVO> checkUpVOList = checkUpService.getCheckUp(user.getUsername());

        model.addAttribute("reservation", reservationVOList);
        model.addAttribute("checkUp", checkUpVOList);

        return "reservation/reservationView";
    }

    @RequestMapping("reservation/reservationView.wow")
    public String reservationView(Model model, @AuthenticationPrincipal User user){
        List<ReservationVO> reservationVOList = reservationService.getReservation(user.getUsername());
        List<CheckUpVO> checkUpVOList = checkUpService.getCheckUp(user.getUsername());

        model.addAttribute("reservation", reservationVOList);
        model.addAttribute("checkUp", checkUpVOList);

        return "reservation/reservationView";
    }

    @RequestMapping("reservation/reservationEdit.wow")
    public String reservationEdit(Model model, @AuthenticationPrincipal User user, ReservationVO reservation) throws BizNotFoundException {
        MemberVO member = memberService.getMember(user.getUsername());
        DoctorsVO doctorsVO = doctorsService.getDoc(reservation.getDcId());
        List<AttendanceVO> attendanceVOList = attendanceService.getAttendance(reservation.getDcId());
        List<ReservationVO> reservationVOList = reservationService.getReservationList();

        model.addAttribute("member", member);
        model.addAttribute("doctor", doctorsVO);
        model.addAttribute("attendance", attendanceVOList);
        model.addAttribute("reservation", reservationVOList);

        model.addAttribute("myReservation", reservation);

        return "reservation/reservationEdit";
    }

    @PostMapping("reservation/reservationModify.wow")
    public String reservationModify(Model model, ReservationVO reservation, @AuthenticationPrincipal User user){
        reservationService.modifyReservation(reservation);

        List<ReservationVO> reservationVOList = reservationService.getReservation(user.getUsername());
        List<CheckUpVO> checkUpVOList = checkUpService.getCheckUp(user.getUsername());

        model.addAttribute("reservation", reservationVOList);
        model.addAttribute("checkUp", checkUpVOList);

        return "reservation/reservationView";
    }

    @PostMapping("reservation/reservationCancel.wow")
    public String reservationCancel(Model model, ReservationVO reservation, @AuthenticationPrincipal User user){
        reservationService.cancelReservation(reservation);

        List<ReservationVO> reservationVOList = reservationService.getReservation(user.getUsername());
        List<CheckUpVO> checkUpVOList = checkUpService.getCheckUp(user.getUsername());

        model.addAttribute("reservation", reservationVOList);
        model.addAttribute("checkUp", checkUpVOList);

        return "reservation/reservationView";
    }
}
