package com.PhoenixHospital.about;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
public class AboutController {

    @RequestMapping("/about/aboutHome.wow")
    public String aboutHome(){
        return "about/aboutHome";
    }

    @RequestMapping("/about/chProfile.wow")
    public String aboutProfile(){
        return "about/chProfile";
    }

    @Autowired
    private IAboutDao aboutDao;

    //DB에서 가져와야함
    @RequestMapping("/about/chPiano.wow")
    public String aboutPiano(Model model){
        List<Map<String, Object>> pianoList = aboutDao.getPianoList();
        model.addAttribute("pianoList",pianoList);
        return "about/chPiano";
    }
}
