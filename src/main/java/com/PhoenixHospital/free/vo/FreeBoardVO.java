package com.PhoenixHospital.free.vo;

import com.PhoenixHospital.attach.vo.AttachVO;
import com.PhoenixHospital.common.vo.PagingVO;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.List;


public class FreeBoardVO extends PagingVO {


    private int boNo;                                           /* 글 번호 */

    private String boTitle;                                     /* 글 제목 */

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    private String categoryCode;                                  /* 글 분류 코드 */

//    private String boCategoryNm;

    private String boWriter;                                    /* 작성자명 */

    private String boContents;                                   /* 글 내용 */

    private int boHit;                                          /* 조회수 */
    private String boRegDate;                                   /* 등록 일자 */
    private String boModDate;                                   /* 수정 일자 */
    private String boDelYn;                                     /* 삭제 여부 */
    private String boPass;                                      /* 비밀번호 */
    private String searchType;

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getSearchWord() {
        return searchWord;
    }

    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }

    private String searchWord;

    private List<AttachVO> attaches;      /*첨부파일 리스트    */
    //1:N 관계 -> free : attache ; 게시판 하나에 파일 여러개 올릴 수 있음.

    private int[] delAtchNos;             /*삭제를 위한 글 번호  */

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


    public String getBoWriter() {
        return boWriter;
    }

    public void setBoWriter(String boWriter) {
        this.boWriter = boWriter;
    }

    public String getBoContents() {
        return boContents;
    }

    public void setBoContents(String boContents) {
        this.boContents = boContents;
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

    public String getBoPass() {
        return boPass;
    }

    public void setBoPass(String boPass) {
        this.boPass = boPass;
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

    @Override
    public String toString() {
        return ToStringBuilder
                .reflectionToString
                        (this, ToStringStyle.MULTI_LINE_STYLE);
    }


}