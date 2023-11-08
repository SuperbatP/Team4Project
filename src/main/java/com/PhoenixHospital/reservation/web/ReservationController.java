package com.PhoenixHospital.reservation.web;

import com.PhoenixHospital.common.vo.SearchVO;
import com.PhoenixHospital.doctors.dao.IDoctorsDao;
import com.PhoenixHospital.doctors.vo.DoctorsVO;
import com.PhoenixHospital.treatment_code.dao.ITreatmentCodeDao;
import com.PhoenixHospital.treatment_code.vo.TreatmentCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class ReservationController {
    @Autowired
    ITreatmentCodeDao codeDao;

    @Autowired
    IDoctorsDao doctorsDao;

    @RequestMapping("reservation/reservationSearch.wow")
    public String reservationSearch(Model model){
        List<TreatmentCodeVO> codeList = codeDao.getCodeList();
        model.addAttribute("codeList", codeList);
        return "reservation/reservationSearch";
    }

    @RequestMapping("reservation/reservationList.wow")
    public String reservationList(Model model, SearchVO search){
        System.out.println(search);
        List<DoctorsVO> doctorsList = doctorsDao.getDocList(search);
        model.addAttribute("doctors", doctorsList);
        return "reservation/reservationList";
    }
}
