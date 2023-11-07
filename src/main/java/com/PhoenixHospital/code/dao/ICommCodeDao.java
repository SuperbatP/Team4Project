package com.PhoenixHospital.code.dao;

import com.PhoenixHospital.code.vo.CodeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ICommCodeDao {
	public List<CodeVO> getCodeListByParent(String parentCode);
	
}
