package com.PhoenixHospital.map.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {
    @RequestMapping("/map/map.wow")
    public String map(Model model){
        return "map/map";
    }
}
