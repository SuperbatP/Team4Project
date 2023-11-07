package com.PhoenixHospital.reservation.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {
    @RequestMapping("reservation/reservationSearch.wow")
    public String reservationSearch(){
        return "reservation/reservationSearch";
    }
}
