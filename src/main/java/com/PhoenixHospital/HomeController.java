package com.PhoenixHospital;

import com.PhoenixHospital.free.dao.IFreeBoardDao;
import com.PhoenixHospital.free.vo.FreeBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    @Autowired
    private IFreeBoardDao freeBoardDao;

    @RequestMapping("/")
    public String index(Model model){
        return "index";
        //return의 타입에 상관없이 HandlerAdapter가 처리해줌. 그 결과를 viewResolver로 보내줌.
    }

    //@ResponseBody 가 없으면 return 값.jsp를 찾으러 감.
    @ResponseBody
    @RequestMapping(value = "/ch", produces = "text/html; charset=UTF-8")
    public String ch(){
        return "help me 이제 한국말도 되나요?";
        //이 때 값은 한글 깨짐. contextType를 만들어줘야함.. produces = "text/html; charset=UTF-8" 이때 html도 인식함.
    }

    @ResponseBody
    @RequestMapping(value = "/ch2", produces = "text/plain; charset=UTF-8")
    public FreeBoardVO ch2(){
        return freeBoardDao.getBoard(500);
        //파일이나 특정 객체를 보낼수도 있음. 단, html은 json형태로만 받을 수 있어서 특정 라이브러리가 필요함.
    }
}