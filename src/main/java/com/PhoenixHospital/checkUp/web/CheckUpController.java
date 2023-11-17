package com.PhoenixHospital.checkUp.web;

import com.PhoenixHospital.add_checkUp_code.service.IAddCheckUpService;
import com.PhoenixHospital.add_checkUp_code.vo.AddCheckUpVO;
import com.PhoenixHospital.basic_checkUp_code.dao.IBasicCheckUpDao;
import com.PhoenixHospital.basic_checkUp_code.service.IBasicCheckUpService;
import com.PhoenixHospital.basic_checkUp_code.vo.BasicCheckUpVO;
import com.PhoenixHospital.checkUp.service.ICheckUpService;
import com.PhoenixHospital.checkUp.vo.CheckUpVO;
import com.PhoenixHospital.dna_test_code.service.IDNATestService;
import com.PhoenixHospital.dna_test_code.vo.DNATestVO;
import com.PhoenixHospital.login.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CheckUpController {
    @Autowired
    ICheckUpService checkUpService;

    @Autowired
    IBasicCheckUpService basicCheckUpService;

    @Autowired
    IAddCheckUpService addCheckUpService;

    @Autowired
    IDNATestService dnaTestService;

    @RequestMapping("reservation/checkUpForm.wow")
    public String checkUpForm(Model model, @AuthenticationPrincipal User user){
        List<CheckUpVO> checkUpVOList = checkUpService.getCheckUpList();
        List<BasicCheckUpVO> basicCheckUpVOList = basicCheckUpService.getCodeList();
        List<AddCheckUpVO> addCheckUpVOList = addCheckUpService.getCodeList();
        List<DNATestVO> dnaTestVOList = dnaTestService.getCodeList();

        model.addAttribute("checkUp", checkUpVOList);
        model.addAttribute("basicCodeList", basicCheckUpVOList);
        model.addAttribute("addCodeList", addCheckUpVOList);
        model.addAttribute("DNACodeList", dnaTestVOList);

        return "reservation/checkUpForm";
    }

    @PostMapping("reservation/checkUpRegist.wow")
    public String checkUpRegist(Model model, @AuthenticationPrincipal User user, CheckUpVO checkUp){
        checkUp.setMemId(user.getUsername());
        checkUpService.registCheckUp(checkUp);

        return "reservation/reservationView";
    }

    @RequestMapping("reservation/checkUpEdit.wow")
    public String checkUpEdit(Model model, @AuthenticationPrincipal User user, CheckUpVO checkUp){

        model.addAttribute("checkUp", checkUpService.getCheckUp(user.getUsername()));

        return "reservation/checkUpEdit";
    }

    @PostMapping("reservation/checkUpModify.wow")
    public String checkUpModify(Model model, CheckUpVO checkUp){
        checkUpService.modifyCheckUp(checkUp);

        return "reservation/reservationView";
    }

    @PostMapping("reservation/checkUpCancel.wow")
    public String checkUpCancel(Model model, CheckUpVO checkUp){
        checkUpService.cancelCheckUp(checkUp);

        return "reservation/reservationView";
    }
}
