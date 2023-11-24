package com.PhoenixHospital.member.vo;

import com.PhoenixHospital.excel.ExcelColumn;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@Data
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
    private String memEmail;                 /* 회원이메일 */
    private String memDelYn;                /* 회원삭제여부 */
    private String memRole;                /* admin / user */
    private String googleid;                   /* 소셜로그인 */
    private String naverid;                    /* 소셜로그인 */
    private String remember;                  /* 아이디정보 기억하기 */

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString
                (this, ToStringStyle.MULTI_LINE_STYLE);
    }

}
