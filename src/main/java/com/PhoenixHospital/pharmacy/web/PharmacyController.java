package com.PhoenixHospital.pharmacy.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PharmacyController {
    @RequestMapping("/pharmacy/pharmacy.wow")
    public String pharmacy(Model model){
        return "pharmacy/pharmacy";
    }
}
