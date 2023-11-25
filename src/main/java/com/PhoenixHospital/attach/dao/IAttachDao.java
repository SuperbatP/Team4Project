package com.PhoenixHospital.attach.dao;

import com.PhoenixHospital.attach.vo.AttachVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
//어노테이션 까먹지말기 ㅠ0ㅠ
public interface IAttachDao {
    public int insertAttach(AttachVO attach);

    public List<AttachVO> getAttachListByParent(@Param(value = "atchParentNo")int atchParentNo, @Param(value = "categoryCode")String categoryCode);

    public int delAtchNos(@Param("delAtchNos") int[] delAtchNos);

    public AttachVO getAttach(int atchNo);

    public int increaseDownHit(int atchNo);

}
