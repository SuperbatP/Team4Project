package com.PhoenixHospital.dna_test_code.dao;

import com.PhoenixHospital.dna_test_code.vo.DNATestVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IDNATestDao {
	public List<DNATestVO> getCodeList();
}
