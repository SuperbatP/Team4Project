package com.PhoenixHospital.basic_checkUp_code.dao;

import com.PhoenixHospital.basic_checkUp_code.vo.BasicCheckUpVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IBasicCheckUpDao {
	public List<BasicCheckUpVO> getCodeList();
}
