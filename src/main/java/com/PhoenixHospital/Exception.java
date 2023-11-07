package com.PhoenixHospital;

import com.PhoenixHospital.common.vo.ResultMessageVO;
import com.PhoenixHospital.exception.BizException;
import com.PhoenixHospital.exception.BizNotEffectedException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.exception.BizPasswordNotMatchedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice(basePackages ={"com.PhoenixHospital"} )
public class Exception {

    @ExceptionHandler(value = {BizNotEffectedException.class, BizNotFoundException.class, BizPasswordNotMatchedException.class, BizException.class})
    public String Exception(Model model, BizException e) {
        e.printStackTrace();
        ResultMessageVO resultMessageVO = new ResultMessageVO();
        resultMessageVO.messageSetting(false, "에러", "에러가 발생하였습니다", "/","홈으로 이동");
        model.addAttribute("resultMessageVO", resultMessageVO);
        return "common/message";
    }


}
