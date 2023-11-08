package com.PhoenixHospital.member.vo;

import com.PhoenixHospital.excel.ExcelColumn;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MemberVO {
    @ExcelColumn(hearName = "아이디")
    private String memId;                   /* 회원아이디 */
    @ExcelColumn(hearName = "비밀번호")
    private String memPassword;                 /* 회원비밀번호 */
    @ExcelColumn(hearName = "이름")
    private String memName;                 /* 회원이름 */
    @ExcelColumn(hearName = "생년월일")
    private String memBir;                  /* 회원생년월일 */
    @ExcelColumn(hearName = "우편번호")
    private String memZip;                  /* 회원우편번호 */
    @ExcelColumn(hearName = "주소")
    private String memAdd1;                 /* 회원주소 */
    @ExcelColumn(hearName = "상세주소")
    private String memAdd2;                 /* 회원상세주소 */
    @ExcelColumn(hearName = "전화번호")
    private String memHp;                   /* 회원전화번호 */
    @ExcelColumn(hearName = "이메일")
    private String memMail;                 /* 회원이메일 */
    private String  memDelYn;                /* 회원삭제여부 */
    private String  memGender;                /* 회원성별 ; F/M */



    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getMemPass() {
        return memPassword;
    }

    public void setMemPass(String memPass) {
        this.memPassword = memPassword;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public String getMemBir() {
        return memBir;
    }

    public void setMemBir(String memBir) {
        this.memBir = memBir;
    }

    public String getMemZip() {
        return memZip;
    }

    public void setMemZip(String memZip) {
        this.memZip = memZip;
    }

    public String getMemAdd1() {
        return memAdd1;
    }

    public void setMemAdd1(String memAdd1) {
        this.memAdd1 = memAdd1;
    }

    public String getMemAdd2() {
        return memAdd2;
    }

    public void setMemAdd2(String memAdd2) {
        this.memAdd2 = memAdd2;
    }

    public String getMemHp() {
        return memHp;
    }

    public void setMemHp(String memHp) {
        this.memHp = memHp;
    }

    public String getMemMail() {
        return memMail;
    }

    public void setMemMail(String memMail) {
        this.memMail = memMail;
    }

    public String getMemDelYn() {
        return memDelYn;
    }

    public void setMemDelYn(String memDelYn) {
        this.memDelYn = memDelYn;
    }

    public MemberVO(String memId, String memPass, String memName, String memBir, String memZip, String memAdd1, String memAdd2, String memHp, String memMail, String memDelYn, String memGender) {
        this.memId = memId;
        this.memPassword = memPassword;
        this.memName = memName;
        this.memBir = memBir;
        this.memZip = memZip;
        this.memAdd1 = memAdd1;
        this.memAdd2 = memAdd2;
        this.memHp = memHp;
        this.memMail = memMail;
        this.memDelYn = memDelYn;
        this.memGender = memGender;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString
                (this, ToStringStyle.MULTI_LINE_STYLE);
    }

}
