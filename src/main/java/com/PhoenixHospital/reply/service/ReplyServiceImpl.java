package com.PhoenixHospital.reply.service;

import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.exception.BizAccessFailException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.reply.dao.IReplyDao;
import com.PhoenixHospital.reply.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements IReplyService{
    @Autowired
    private IReplyDao replyDao;

    @Override
    public List<ReplyVO> getReplyListByParent(PagingVO paging, String categoryCode, int reParentNo) {
        int totalRowCount = replyDao.getReplyCountByParent(paging, categoryCode, reParentNo);
        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();
        List<ReplyVO> replyList = replyDao.getReplyListByParent(paging, categoryCode, reParentNo);
        return replyList;
    }

    @Override
    public void modifyReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException {
        ReplyVO replyFromDB = replyDao.getReply(reply.getReNo());
        if(!reply.getMemId().equals(replyFromDB.getMemId())){
            //!reply.getReMemId().equals(replyFromDB.getReMemId() 가 같지 않다면
            throw new BizAccessFailException("글쓴이가 아닙니다.");
        }
        replyDao.updateReply(reply);
    }

    @Override
    public void removeReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException {
        ReplyVO replyFromDB = replyDao.getReply(reply.getReNo());
        if(!reply.getMemId().equals(replyFromDB.getMemId())){
            //!reply.getReMemId().equals(replyFromDB.getReMemId() 가 같지 않다면
            throw new BizAccessFailException("글쓴이가 아닙니다.");
        }
        replyDao.deleteReply(reply);

    }

    @Override
    public void registReply(ReplyVO reply) {
        replyDao.insertReply(reply);
    }
}
