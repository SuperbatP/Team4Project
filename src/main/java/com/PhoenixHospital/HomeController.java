package com.PhoenixHospital;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String index(Model model){
        return "index";
        //return의 타입에 상관없이 HandlerAdapter가 처리해줌. 그 결과를 viewResolver로 보내줌.
    }

    @RequestMapping("/common/siteMap.wow")
    public String siteMapView(Model model){
        return "common/siteMap";
    }

}