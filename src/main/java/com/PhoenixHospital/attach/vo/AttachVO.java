package com.PhoenixHospital.attach.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class AttachVO {
    private int atchNo;                     /* 첨부파일 번호(PK) */
    //테이블을 조인하는게 아니라 테이블내에 부모글의 번호, 카테고리를 지정해서 사용.
    private int atchParentNo;               /* 부모글의 PK  */
    private String atchCategory;            /* 상위글 분류(BOARD, FREE, QNA, PDS 등) */
    //DB에 파일의 고유한 이름
    private String atchFileName;            /* 실제 저장된 파일명 */
    //사용자가 파일을 받을때 나타나는 이름
    private String atchOriginalName;        /* 사용자가 올린 원래 파일명 */
    private long atchFileSize;               /* 파일 사이즈 */
    //파일 사이즈 명시할 때, kb가 아니라 MB 이렇게 표시하는거...
    private String atchFancySize;           /* 팬시 사이즈 */
    private String atchContentType;         /* 컨텐츠 타입 */
    private String atchPath;                /* 저장 경로(board/2020)  */
    //정부24 같은 사이트 보면 첨부파일 다운로드 횟수 명시함.
    private int atchDownHit;                /* 다운로드 횟수 */
    private String atchDelYn;               /* 삭제여부(스케쥴에 의해서 파일삭제처리) */
    private String atchRegDate;             /* 등록일 */



    public int getAtchNo() {
        return atchNo;
    }

    public void setAtchNo(int atchNo) {
        this.atchNo = atchNo;
    }

    public int getAtchParentNo() {
        return atchParentNo;
    }

    public void setAtchParentNo(int atchParentNo) {
        this.atchParentNo = atchParentNo;
    }

    public String getAtchCategory() {
        return atchCategory;
    }

    public void setAtchCategory(String atchCategory) {
        this.atchCategory = atchCategory;
    }

    public String getAtchFileName() {
        return atchFileName;
    }

    public void setAtchFileName(String atchFileName) {
        this.atchFileName = atchFileName;
    }

    public String getAtchOriginalName() {
        return atchOriginalName;
    }

    public void setAtchOriginalName(String atchOriginalName) {
        this.atchOriginalName = atchOriginalName;
    }

    public long getAtchFileSize() {
        return atchFileSize;
    }

    public void setAtchFileSize(long atchFileSize) {
        this.atchFileSize = atchFileSize;
    }

    public String getAtchFancySize() {
        return atchFancySize;
    }

    public void setAtchFancySize(String atchFancySize) {
        this.atchFancySize = atchFancySize;
    }

    public String getAtchContentType() {
        return atchContentType;
    }

    public void setAtchContentType(String atchContentType) {
        this.atchContentType = atchContentType;
    }

    public String getAtchPath() {
        return atchPath;
    }

    public void setAtchPath(String atchPath) {
        this.atchPath = atchPath;
    }

    public int getAtchDownHit() {
        return atchDownHit;
    }

    public void setAtchDownHit(int atchDownHit) {
        this.atchDownHit = atchDownHit;
    }

    public String getAtchDelYn() {
        return atchDelYn;
    }

    public void setAtchDelYn(String atchDelYn) {
        this.atchDelYn = atchDelYn;
    }

    public String getAtchRegDate() {
        return atchRegDate;
    }

    public void setAtchRegDate(String atchRegDate) {
        this.atchRegDate = atchRegDate;
    }


    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString
                (this, ToStringStyle.MULTI_LINE_STYLE);
    }
}
