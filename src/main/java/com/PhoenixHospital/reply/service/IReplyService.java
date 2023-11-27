package com.PhoenixHospital.reply.service;

import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.exception.BizAccessFailException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.reply.vo.ReplyVO;

import java.util.List;

public interface IReplyService {
/** 댓글 목록 조회 <br>
* <b>필수 : reCategory, reParentNo </b>
*/
public List<ReplyVO> getReplyListByParent(PagingVO paging, String categoryCode, int reParentNo);
/** 댓글 수정 <br>
* 댓글이 존재하지 않으면 BizNotFoundException
* 댓글 작성자와 로그인 사용자가 다른 경우 BizAccessFailException
*/
public void modifyReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException;
/**
* 댓글 삭제 <br>
* 해당글의 존재하지 않으면 BizNotFoundException
* 댓글 작성자와 로그인 사용자가 다른 경우 BizAccessFailException
*/
public void removeReply(ReplyVO reply) throws BizNotFoundException, BizAccessFailException;
/** 댓글등록 */
public void registReply(ReplyVO reply) ;


}




