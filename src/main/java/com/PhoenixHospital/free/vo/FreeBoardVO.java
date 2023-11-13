package com.PhoenixHospital.free.vo;

import com.PhoenixHospital.attach.vo.AttachVO;
import com.PhoenixHospital.excel.ExcelColumn;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;
import java.util.List;


public class FreeBoardVO  {

    @ExcelColumn(hearName = "글번호")
    private int    boNo       ;                                           /* 글 번호 */
    @ExcelColumn(hearName = "글제목")
    private String boTitle     ;                                     /* 글 제목 */
    @ExcelColumn(hearName = "카테고리")
    private String boCategory     ;                                  /* 글 분류 코드 */
    @ExcelColumn(hearName = "카테고리 이름")
    private String boCategoryNm;
    @ExcelColumn(hearName = "작성자")
    private String boWriter    ;                                    /* 작성자명 */
    @ExcelColumn(hearName = "글내용")
    private String boContent    ;                                   /* 글 내용 */
    @ExcelColumn(hearName = "조회수")
    private int    boHit       ;                                          /* 조회수 */
    private String boRegDate       ;                                   /* 등록 일자 */
    private String boModDate       ;                                   /* 수정 일자 */
    private String boDelYn      ;                                     /* 삭제 여부 */
    private String boPass          ;                                      /* 비밀번호 */



    private List<AttachVO> attaches ;      /*첨부파일 리스트    */
    //1:N 관계 -> free : attache ; 게시판 하나에 파일 여러개 올릴 수 있음.

    private int[] delAtchNos;             /*삭제를 위한 글 번호  */





    private int CP_NO=0;
    private String CP_TITLE="";
    private String CATEGORY_CODE="";
    private String CP_CONTENTS="";
    private String MEM_ID="";
    private int CP_HIT=0;

    public int getCP_NO() {
        return CP_NO;
    }

    public void setCP_NO(int CP_NO) {
        this.CP_NO = CP_NO;
    }

    public String getCP_TITLE() {
        return CP_TITLE;
    }

    public void setCP_TITLE(String CP_TITLE) {
        this.CP_TITLE = CP_TITLE;
    }

    public String getCATEGORY_CODE() {
        return CATEGORY_CODE;
    }

    public void setCATEGORY_CODE(String CATEGORY_CODE) {
        this.CATEGORY_CODE = CATEGORY_CODE;
    }

    public String getCP_CONTENTS() {
        return CP_CONTENTS;
    }

    public void setCP_CONTENTS(String CP_CONTENTS) {
        this.CP_CONTENTS = CP_CONTENTS;
    }

    public String getMEM_ID() {
        return MEM_ID;
    }

    public void setMEM_ID(String MEM_ID) {
        this.MEM_ID = MEM_ID;
    }

    public int getCP_HIT() {
        return CP_HIT;
    }

    public void setCP_HIT(int CP_HIT) {
        this.CP_HIT = CP_HIT;
    }

    public Date getCP_REG_DATE() {
        return CP_REG_DATE;
    }

    public void setCP_REG_DATE(Date CP_REG_DATE) {
        this.CP_REG_DATE = CP_REG_DATE;
    }

    public Date getCP_MOD_DATE() {
        return CP_MOD_DATE;
    }

    public void setCP_MOD_DATE(Date CP_MOD_DATE) {
        this.CP_MOD_DATE = CP_MOD_DATE;
    }

    public String getCP_DEL_YN() {
        return CP_DEL_YN;
    }

    public void setCP_DEL_YN(String CP_DEL_YN) {
        this.CP_DEL_YN = CP_DEL_YN;
    }

    public String getCP_ATTACH() {
        return CP_ATTACH;
    }

    public void setCP_ATTACH(String CP_ATTACH) {
        this.CP_ATTACH = CP_ATTACH;
    }

    private Date CP_REG_DATE;
    private Date CP_MOD_DATE;
    private String CP_DEL_YN="";
    private String CP_ATTACH="";



    public int getBoNo() {
        return boNo;
    }

    public void setBoNo(int boNo) {
        this.boNo = boNo;
    }

    public String getBoTitle() {
        return boTitle;
    }

    public void setBoTitle(String boTitle) {
        this.boTitle = boTitle;
    }

    public String getBoCategory() {
        return boCategory;
    }

    public void setBoCategory(String boCategory) {
        this.boCategory = boCategory;
    }

    public String getBoWriter() {
        return boWriter;
    }

    public void setBoWriter(String boWriter) {
        this.boWriter = boWriter;
    }

    public String getBoPass() {
        return boPass;
    }

    public void setBoPass(String boPass) {
        this.boPass = boPass;
    }

    public String getBoContent() {
        return boContent;
    }

    public void setBoContent(String boContent) {
        this.boContent = boContent;
    }

    public int getBoHit() {
        return boHit;
    }

    public void setBoHit(int boHit) {
        this.boHit = boHit;
    }

    public String getBoRegDate() {
        return boRegDate;
    }

    public void setBoRegDate(String boRegDate) {
        this.boRegDate = boRegDate;
    }

    public String getBoModDate() {
        return boModDate;
    }

    public void setBoModDate(String boModDate) {
        this.boModDate = boModDate;
    }

    public String getBoDelYn() {
        return boDelYn;
    }

    public void setBoDelYn(String boDelYn) {
        this.boDelYn = boDelYn;
    }

    public String getBoCategoryNm() {
        return boCategoryNm;
    }

    public void setBoCategoryNm(String boCategoryNm) {
        this.boCategoryNm = boCategoryNm;
    }

    public List<AttachVO> getAttaches() {
        return attaches;
    }

    public void setAttaches(List<AttachVO> attaches) {
        this.attaches = attaches;
    }

    public int[] getDelAtchNos() {
        return delAtchNos;
    }

    public void setDelAtchNos(int[] delAtchNos) {
        this.delAtchNos = delAtchNos;
    }

    //UserVO에 있는 toString 복사  ,  MemberVO도 toString
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString
                (this, ToStringStyle.MULTI_LINE_STYLE);
    }
}