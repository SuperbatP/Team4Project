package com.PhoenixHospital.basic_checkUp_code.service;

import com.PhoenixHospital.basic_checkUp_code.dao.IBasicCheckUpDao;
import com.PhoenixHospital.basic_checkUp_code.vo.BasicCheckUpVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service //구현체에 붙이는것!
public class BasicCheckUpServiceImpl implements IBasicCheckUpService {
    @Autowired
    IBasicCheckUpDao basicCheckUpDao;

    @Override
    public List<BasicCheckUpVO> getCodeList() {
            return basicCheckUpDao.getCodeList();

    }
}
