package com.PhoenixHospital.common.util;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class IPCheckInterceptor extends HandlerInterceptorAdapter {
    // 특정 아이피만 들어올 수 있게 함 -> 블랙리스트에 있는 사람 못 들어오게...
    private Map<String, Boolean> ipDeniedMap = new HashMap<>();
    public IPCheckInterceptor(){
        for(int i =3 ; i<100; i++){
            ipDeniedMap.put("192.168.0."+i,true);
        }
        ipDeniedMap.put("192.168.0.30",false);
        ipDeniedMap.put("0:0:0:0:0:0:0:1",false);
        ipDeniedMap.put("127.0.0.1",false);
    }
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String remoteAddr = request.getRemoteAddr();
        //System.out.println(remoteAddr); 본인의 IP 확인용
        boolean denied = ipDeniedMap.get(remoteAddr);
        if(denied){
            response.sendError(HttpServletResponse.SC_NOT_ACCEPTABLE, "허용되지 않은 IP입니다.");
            return false;
        }
        return true;
    }
}
