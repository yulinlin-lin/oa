package com.sgu.controller;

import com.wxapi.WxApiCall.WxApiCall;
import com.wxapi.model.RequestModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author huang
 * @date 2020/12/1 8:14
 */
@Controller
public class WeatherController {

    @ResponseBody
    @RequestMapping(value = "/query_weather", produces = "application/json;charset=utf-8")
    public String queryWeather(String city) {
        RequestModel model = new RequestModel();
        model.setGwUrl("https://way.jd.com/jisuapi/weather");
        model.setAppkey("2142850432f4bd7a073771d42d525b85");
        Map queryMap = new HashMap();
        queryMap.put("city", city); //访问参数
        model.setQueryParams(queryMap);
        WxApiCall call = new WxApiCall();
        call.setModel(model);
        String s = call.request();
//        System.out.println(s);
        return s;
    }



}
