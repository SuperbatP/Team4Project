package com.PhoenixHospital.add_checkUp_code.dao;

import com.PhoenixHospital.add_checkUp_code.vo.AddCheckUpVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAddCheckUpDao {
	public List<AddCheckUpVO> getCodeList();
	
}
