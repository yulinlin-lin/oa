package com.sgu;

import com.wxapi.WxApiCall.WxApiCall;
import com.wxapi.model.RequestModel;

import java.util.HashMap;
import java.util.Map;

/**
 * @author huang
 * @date 2020/11/30 19:44
 */
public class Demo {

    public static void main(String[] args) {


        RequestModel model = new RequestModel();
        model.setGwUrl("https://way.jd.com/jisuapi/weather");
        model.setAppkey("2142850432f4bd7a073771d42d525b85");
        Map queryMap = new HashMap();
        queryMap.put("city", "韶关"); //访问参数
        model.setQueryParams(queryMap);
        WxApiCall call = new WxApiCall();
        call.setModel(model);
        String s = call.request();
        System.out.println("==============================================");
        System.out.println(s);
    }



}
