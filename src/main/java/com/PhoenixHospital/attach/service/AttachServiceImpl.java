package com.PhoenixHospital.attach.service;

import com.PhoenixHospital.attach.dao.IAttachDao;
import com.PhoenixHospital.attach.vo.AttachVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttachServiceImpl {
    @Autowired
    private IAttachDao attachDao;

    public AttachVO getAttach(int atchNo){
        return attachDao.getAttach(atchNo);
    }

    public void increaseDownHit(int atchNo)  {
        int cnt = attachDao.increaseDownHit(atchNo);
    }
}
