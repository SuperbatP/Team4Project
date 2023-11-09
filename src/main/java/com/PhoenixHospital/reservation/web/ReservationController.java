package com.PhoenixHospital.reservation.web;

import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.doctor_attendance.dao.IAttendanceDao;
import com.PhoenixHospital.doctor_attendance.service.AttendanceServiceImpl;
import com.PhoenixHospital.doctor_attendance.service.IAttendanceService;
import com.PhoenixHospital.doctor_attendance.vo.AttendanceVO;
import com.PhoenixHospital.doctors.dao.IDoctorsDao;
import com.PhoenixHospital.doctors.service.IDoctorsService;
import com.PhoenixHospital.doctors.vo.DoctorsVO;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.service.IMemberService;
import com.PhoenixHospital.member.vo.MemberVO;
import com.PhoenixHospital.reservation.dao.IReservationDao;
import com.PhoenixHospital.reservation.service.IReservationService;
import com.PhoenixHospital.reservation.service.ReservationServiceImpl;
import com.PhoenixHospital.reservation.vo.ReservationVO;
import com.PhoenixHospital.treatment_code.dao.ITreatmentCodeDao;
import com.PhoenixHospital.treatment_code.vo.TreatmentCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ReservationController {
    @Autowired
    ITreatmentCodeDao codeDao;

    @Autowired
    IDoctorsService doctorsService;

    @Autowired
    IAttendanceService attendanceService;

    @Autowired
    IMemberService memberService;

    @Autowired
    IReservationService reservationService;

    @RequestMapping("reservation/reservationSearch.wow")
    public String reservationSearch(Model model){
        List<TreatmentCodeVO> codeList = codeDao.getCodeList();
        model.addAttribute("codeList", codeList);
        return "reservation/reservationSearch";
    }

    @RequestMapping("reservation/reservationList.wow")
    public String reservationList(Model model, SearchVO search){
        List<DoctorsVO> doctorsList = doctorsService.getDocList(search);
        Map<String, List<AttendanceVO>> attendanceVOMap = new HashMap<>();
        for (int i = 0; i < doctorsList.size(); i++) {
            String dcId = doctorsList.get(i).getDcId();
            List<AttendanceVO> attendanceVOList = attendanceService.getAttendance(dcId);
            attendanceVOMap.put(dcId, attendanceVOList);
        }

        model.addAttribute("doctors", doctorsList);
        model.addAttribute("attendance", attendanceVOMap);
        return "reservation/reservationList";
    }

    @RequestMapping("reservation/reservationForm.wow")
    public String reservationForm(Model model, String memId, String dcId) throws BizNotFoundException {
        if(memId.equals("")){
            return "redirect:/login/login.wow";
        }
        MemberVO member = memberService.getMember(memId);
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
    public String reservationRegist(Model model, ReservationVO reservation){
        reservationService.registReservation(reservation);

        return "reservation/reservationSearch";
    }
}
