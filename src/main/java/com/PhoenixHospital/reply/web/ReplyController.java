package com.PhoenixHospital.reply.web;

import com.PhoenixHospital.common.vo.PagingVO;
import com.PhoenixHospital.exception.BizAccessFailException;
import com.PhoenixHospital.exception.BizNotFoundException;
import com.PhoenixHospital.reply.service.IReplyService;
import com.PhoenixHospital.reply.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
//@ResponseBody  ; 컨트롤러 위에 @ResponseBody 붙이면 전체 할당이랑 같음
//@Controller
//@RestController = @ResponseBody + @Controller
public class ReplyController {

    @Autowired
    private IReplyService replyService;

    //map 형태인건 공공데이터 포털 데이터 가져올때 json 형태 생각해보기
    @RequestMapping(value = "/reply/replyList.wow")
    public Map<String, Object> replyList(PagingVO paging, String reCategory, int reParentNo) {
        Map<String, Object> map = new HashMap<>();
        List<ReplyVO> replyList = replyService.getReplyListByParent(paging, reCategory, reParentNo);
        map.put("reCategoty", reCategory);
        map.put("size", replyList.size());
        map.put("data", replyList);
        return map;
    }

    @RequestMapping(value = "/reply/replyRegist.wow")
    public Map<String, Object> replyRegist(ReplyVO reply) {
        Map<String, Object> map = new HashMap<>();
        replyService.registReply(reply);
        map.put("msg","등록성공");
        return map;
    }

    @RequestMapping(value = "/reply/replyModify.wow")
    public Map<String, Object> replyModify(ReplyVO reply) throws BizNotFoundException, BizAccessFailException {
        Map<String, Object> map = new HashMap<>();
        replyService.modifyReply(reply);
        map.put("msg","수정성공");
        return map;
    }

    @RequestMapping(value = "/reply/replyDelete.wow")
    public Map<String, Object> replyDelete(ReplyVO reply) throws BizNotFoundException, BizAccessFailException {
        Map<String, Object> map = new HashMap<>();
        replyService.removeReply(reply);
        map.put("msg","삭제성공");
        return map;
    }


}
