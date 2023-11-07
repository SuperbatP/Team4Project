package com.PhoenixHospital.code.service;

import com.PhoenixHospital.code.vo.CodeVO;

import java.util.List;

public interface ICommCodeService {
	List<CodeVO> getCodeListByParent(String parentCode) ;
	
}
