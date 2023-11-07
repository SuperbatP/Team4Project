package com.PhoenixHospital.reservation.web;

import com.PhoenixHospital.treatment_code.dao.ITreatmentCodeDao;
import com.PhoenixHospital.treatment_code.vo.TreatmentCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ReservationController {
    @Autowired
    ITreatmentCodeDao codeDao;

    @RequestMapping("reservation/reservationSearch.wow")
    public String reservationSearch(Model model){
        List<TreatmentCodeVO> codeList = codeDao.getCodeList();
        model.addAttribute("codeList", codeList);
        return "reservation/reservationSearch";
    }
}
