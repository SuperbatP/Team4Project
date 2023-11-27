package com.PhoenixHospital.medical_history.dao;

import com.PhoenixHospital.medical_history.vo.HistoryVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IHistoryDao {
    public List<HistoryVO> getHistory(String memId);
}
