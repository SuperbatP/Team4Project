package com.PhoenixHospital.dna_test_code.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class DNATestVO {
    private String dnaTestCode;
    private String dnaTestName;

    //getter/setter toString
    @Override
    public String toString() {
        return ToStringBuilder
                .reflectionToString
                        (this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public String getDnaTestCode() {
        return dnaTestCode;
    }

    public void setDnaTestCode(String dnaTestCode) {
        this.dnaTestCode = dnaTestCode;
    }

    public String getDnaTestName() {
        return dnaTestName;
    }

    public void setDnaTestName(String dnaTestName) {
        this.dnaTestName = dnaTestName;
    }
}
