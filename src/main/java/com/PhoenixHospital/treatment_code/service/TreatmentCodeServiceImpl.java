package com.PhoenixHospital.treatment_code.service;

import com.PhoenixHospital.code.vo.CodeVO;
import com.PhoenixHospital.treatment_code.dao.ITreatmentCodeDao;
import com.PhoenixHospital.treatment_code.vo.TreatmentCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TreatmentCodeServiceImpl implements ITreatmentCodeService {
    @Autowired
    ITreatmentCodeDao codeDao;

    @Override
    public List<TreatmentCodeVO> getCodeList() {
        return codeDao.getCodeList();
    }
}
