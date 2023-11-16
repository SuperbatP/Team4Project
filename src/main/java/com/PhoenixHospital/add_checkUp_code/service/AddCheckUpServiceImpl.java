package com.PhoenixHospital.add_checkUp_code.service;

import com.PhoenixHospital.add_checkUp_code.dao.IAddCheckUpDao;
import com.PhoenixHospital.add_checkUp_code.vo.AddCheckUpVO;
import com.PhoenixHospital.code.dao.ICommCodeDao;
import com.PhoenixHospital.code.vo.CodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service //구현체에 붙이는것!
public class AddCheckUpServiceImpl implements IAddCheckUpService {
    @Autowired
    IAddCheckUpDao addCheckUpDao;

    @Override
    public List<AddCheckUpVO> getCodeList() {
            return addCheckUpDao.getCodeList();

    }
}
