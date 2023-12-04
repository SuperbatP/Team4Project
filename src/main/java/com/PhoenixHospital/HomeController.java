package com.PhoenixHospital;

import com.PhoenixHospital.free.dao.IFreeBoardDao;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

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