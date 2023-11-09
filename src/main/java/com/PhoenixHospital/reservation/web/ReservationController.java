package com.PhoenixHospital.reservation.web;

import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.doctor_attendance.dao.IAttendanceDao;
import com.PhoenixHospital.doctor_attendance.vo.AttendanceVO;
import com.PhoenixHospital.doctors.dao.IDoctorsDao;
import com.PhoenixHospital.doctors.vo.DoctorsVO;
import com.PhoenixHospital.member.dao.IMemberDao;
import com.PhoenixHospital.member.vo.MemberVO;
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
    IDoctorsDao doctorsDao;

    @Autowired
    IAttendanceDao attendanceDao;

    @Autowired
    IMemberDao memberDao;

    @RequestMapping("reservation/reservationSearch.wow")
    public String reservationSearch(Model model){
        List<TreatmentCodeVO> codeList = codeDao.getCodeList();
        model.addAttribute("codeList", codeList);
        return "reservation/reservationSearch";
    }

    @RequestMapping("reservation/reservationList.wow")
    public String reservationList(Model model, SearchVO search){
        List<DoctorsVO> doctorsList = doctorsDao.getDocList(search);
        Map<String, List<AttendanceVO>> attendanceVOMap = new HashMap<>();
        for (int i = 0; i < doctorsList.size(); i++) {
            String dcId = doctorsList.get(i).getDcId();
            List<AttendanceVO> attendanceVOList = attendanceDao.getAttendanceList(dcId);
            attendanceVOMap.put(dcId, attendanceVOList);
        }

        model.addAttribute("doctors", doctorsList);
        model.addAttribute("attendance", attendanceVOMap);
        return "reservation/reservationList";
    }

    @RequestMapping("reservation/reservationForm.wow")
    public String reservationForm(Model model, String memId, String dcId){
        if(memId.equals("")){
            return "redirect:/login/login.wow";
        }
        MemberVO member = memberDao.getMember(memId);
        List<AttendanceVO> attendanceVOList = attendanceDao.getAttendanceList(dcId);
        model.addAttribute("member", member);
        model.addAttribute("attendance", attendanceVOList);
        return "reservation/reservationForm";
    }

    @PostMapping("reservation/reservationRegist.wow")
    public String reservationRegist(){
        return "";
    }
}
