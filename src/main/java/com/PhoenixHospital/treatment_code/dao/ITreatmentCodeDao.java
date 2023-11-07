package com.PhoenixHospital.treatment_code.dao;

import com.PhoenixHospital.treatment_code.vo.TreatmentCodeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ITreatmentCodeDao {
    public List<TreatmentCodeVO> getCodeList();
}
