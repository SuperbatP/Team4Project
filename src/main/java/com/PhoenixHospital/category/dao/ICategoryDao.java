package com.PhoenixHospital.category.dao;

import com.PhoenixHospital.category.vo.CategoryVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ICategoryDao {
    public List<CategoryVO> getCodeList();
}
