package com.PhoenixHospital.add_checkUp_code.service;

import com.PhoenixHospital.add_checkUp_code.vo.AddCheckUpVO;
import com.PhoenixHospital.code.vo.CodeVO;

import java.util.List;

public interface IAddCheckUpService {
	List<AddCheckUpVO> getCodeList() ;
	
}
