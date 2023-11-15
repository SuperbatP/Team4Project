package com.PhoenixHospital.about;

//import com.google.common.base.CaseFormat;

import java.util.HashMap;

public class MyCanelHashMap extends HashMap {

    @Override
    public Object put(Object key, Object value) {
        String mykey = (String) key;
        //mykey를 p_no에서 pNo가 되도록 변경하는 코드
//        return super.put(CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, mykey), value);
        //UPPER_UNDERSCORE ; p_no -> P_NO
        //LOWER_CAMEL ; p_No
        return  null;
    }
}
