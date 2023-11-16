package com.PhoenixHospital.dna_test_code.service;

import com.PhoenixHospital.dna_test_code.dao.IDNATestDao;
import com.PhoenixHospital.dna_test_code.vo.DNATestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service //구현체에 붙이는것!
public class DNATestServiceImpl implements IDNATestService {
    @Autowired
    IDNATestDao dnaTestDaoDao;

    @Override
    public List<DNATestVO> getCodeList() {
            return dnaTestDaoDao.getCodeList();

    }
}
