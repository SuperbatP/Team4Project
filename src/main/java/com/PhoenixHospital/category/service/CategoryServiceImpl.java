package com.PhoenixHospital.category.service;

import com.PhoenixHospital.category.dao.ICategoryDao;
import com.PhoenixHospital.category.vo.CategoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    ICategoryDao categoryDao;

    public List<CategoryVO> getCategoryList() {
        return categoryDao.getCodeList();
    }
}
