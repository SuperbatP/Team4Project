package com.PhoenixHospital.reservation.web;

import com.PhoenixHospital.checkUp.service.ICheckUpService;
import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.doctor_attendance.dao.IAttendanceDao;
import com.PhoenixHospital.doctor_attendance.service.AttendanceServiceImpl;
import com.PhoenixHospital.doctor_attendance.service.IAttendanceService;
import com.PhoenixHospital.doctor_attendance.vo.AttendanceVO;
import com.PhoenixHospital.doctors.dao.IDoctorsDao;
import com.PhoenixHospital.doctors.service.IDoctorsService;
import com.PhoenixHospital.doctors.vo.DoctorsVO;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.login.vo.UserVO;
import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.service.IMemberService;
import com.PhoenixHospital.member.vo.MemberVO;
import com.PhoenixHospital.reservation.dao.IReservationDao;
import com.PhoenixHospital.reservation.service.IReservationService;
import com.PhoenixHospital.reservation.service.ReservationServiceImpl;
import com.PhoenixHospital.reservation.vo.ReservationVO;
import com.PhoenixHospital.treatment_code.dao.ITreatmentCodeDao;
import com.PhoenixHospital.treatment_code.service.ITreatmentCodeService;
import com.PhoenixHospital.treatment_code.vo.TreatmentCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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

    @RequestMapping("reservation/reservationSearch.wow")
    public String reservationSearch(Model model){
        List<TreatmentCodeVO> codeList = treatmentCodeService.getCodeList();
        model.addAttribute("codeList", codeList);
        return "reservation/reservationSearch";
    }

    @RequestMapping("reservation/reservationList.wow")
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
    public String reservationForm(Model model, HttpSession session, String dcId) throws BizNotFoundException {
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        if(userInfo == null){
            return "redirect:/login/login.wow";
        }

        MemberVO member = memberService.getMember(userInfo.getUserId());
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
    public String reservationRegist(Model model, HttpSession session, ReservationVO reservation){
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        reservation.setMemId(userInfo.getUserId());
        reservationService.registReservation(reservation);

        return "reservation/reservationView";
    }

    @RequestMapping("reservation/reservationView.wow")
    public String reservationView(Model model, HttpSession session){
        UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
        if(userInfo == null){
            return "redirect:/login/login.wow";
        }

        model.addAttribute("reservation", reservationService.getReservation(userInfo.getUserId()));
        model.addAttribute("checkUp", checkUpService.getCheckUp(userInfo.getUserId()));

        return "reservation/reservationView";
    }
}
