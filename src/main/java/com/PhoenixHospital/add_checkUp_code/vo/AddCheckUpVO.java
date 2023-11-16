package com.PhoenixHospital.add_checkUp_code.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class AddCheckUpVO {
    private String addCheckupCode;
    private String addCheckupName;

    //getter/setter toString
    @Override
    public String toString() {
        return ToStringBuilder
                .reflectionToString
                        (this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public String getAddCheckupCode() {
        return addCheckupCode;
    }

    public void setAddCheckupCode(String addCheckupCode) {
        this.addCheckupCode = addCheckupCode;
    }

    public String getAddCheckupName() {
        return addCheckupName;
    }

    public void setAddCheckupName(String addCheckupName) {
        this.addCheckupName = addCheckupName;
    }
}
