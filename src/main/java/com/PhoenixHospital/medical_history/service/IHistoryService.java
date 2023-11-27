package com.PhoenixHospital.medical_history.service;

import com.PhoenixHospital.medical_history.vo.HistoryVO;

import java.util.List;

public interface IHistoryService {
    public List<HistoryVO> getHistory(String memId);
}
