package com.PhoenixHospital.reply.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


public class ReplyVO {
    private int reNo;                       /* 댓글번호 (pk)*/
    private String categoryCode;              /* 분류(BOARD, PDS, FREE, ...) 각 게시판에 CRUD가 있으니까..*/
    private int reParentNo;                 /* 부모 번호 ;공지사항에 대한 100번 글인지, 자유게시판에 대한 100번 글인지..*/
    // 꼼수? 편하게 하는 방법은 각 게시판별로 댓글 테이블을 만들어서 관리하면 편하긴함. 댓글 테이블을 하나로 하면 속도면에서는 빠르다고...!
    private String memId;                 /* 작성자ID */
    private String reContent;               /* 댓글 내용 */
    private String reRegDate;               /* 댓글 등록일자 */
    private String reModDate;               /* 댓글 수정일자 */

    public int getReNo() {
        return reNo;
    }

    public void setReNo(int reNo) {
        this.reNo = reNo;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public int getReParentNo() {
        return reParentNo;
    }

    public void setReParentNo(int reParentNo) {
        this.reParentNo = reParentNo;
    }

    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getReContent() {
        return reContent;
    }

    public void setReContent(String reContent) {
        this.reContent = reContent;
    }

    public String getReRegDate() {
        return reRegDate;
    }

    public void setReRegDate(String reRegDate) {
        this.reRegDate = reRegDate;
    }

    public String getReModDate() {
        return reModDate;
    }

    public void setReModDate(String reModDate) {
        this.reModDate = reModDate;
    }

    public String getRe_Del_Yn() {
        return re_Del_Yn;
    }

    public void setRe_Del_Yn(String re_Del_Yn) {
        this.re_Del_Yn = re_Del_Yn;
    }

    public String getReMemName() {
        return reMemName;
    }

    public void setReMemName(String reMemName) {
        this.reMemName = reMemName;
    }

    private String re_Del_Yn;               /* 댓글 수정일자 */


    private String reMemName; //필드 추가 후 데이터 담는 그릇임... 코드 카테고리와 유사.


    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this,
                ToStringStyle.MULTI_LINE_STYLE);
    }
}
