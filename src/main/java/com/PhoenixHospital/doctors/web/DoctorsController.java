package com.PhoenixHospital.doctors.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DoctorsController {
    @RequestMapping("/doctors/doctors.wow")
    public String map(Model model) {
        return "doctors/doctors";
    }
}
