package com.PhoenixHospital.excel;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

//특정한 column을 지정해서 가져오려고. 다양한 방법이 있는데 우리는 @로 배운다고.
//어노테이션 만든거임 ㅇ0ㅇ!
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ExcelColumn {
    public String hearName() default "";

}
