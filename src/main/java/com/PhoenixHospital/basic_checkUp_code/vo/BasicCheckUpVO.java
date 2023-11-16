package com.PhoenixHospital.basic_checkUp_code.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class BasicCheckUpVO {
    private String basicCheckupCode;
    private String basicCheckupContent;
    private String basicCheckupName;

    //getter/setter toString
    @Override
    public String toString() {
        return ToStringBuilder
                .reflectionToString
                        (this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public String getBasicCheckupCode() {
        return basicCheckupCode;
    }

    public void setBasicCheckupCode(String basicCheckupCode) {
        this.basicCheckupCode = basicCheckupCode;
    }

    public String getBasicCheckupContent() {
        return basicCheckupContent;
    }

    public void setBasicCheckupContent(String basicCheckupContent) {
        this.basicCheckupContent = basicCheckupContent;
    }

    public String getBasicCheckupName() {
        return basicCheckupName;
    }

    public void setBasicCheckupName(String basicCheckupName) {
        this.basicCheckupName = basicCheckupName;
    }
}
