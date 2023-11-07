package com.PhoenixHospital.code.service;

import com.PhoenixHospital.code.dao.ICommCodeDao;
import com.PhoenixHospital.code.vo.CodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service //구현체에 붙이는것!
public class CommCodeServiceImpl  implements  ICommCodeService{
    @Autowired
    ICommCodeDao codeDao;

    @Override
    public List<CodeVO> getCodeListByParent(String parentCode) {
            return codeDao.getCodeListByParent(parentCode);

    }
}
