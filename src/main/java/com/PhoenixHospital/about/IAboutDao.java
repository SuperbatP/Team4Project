package com.PhoenixHospital.about;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface IAboutDao {
    public List<Map<String, Object>> getPianoList();

}
