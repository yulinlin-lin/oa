<%--
  Created by IntelliJ IDEA.
  User: huang
  Date: 2020/12/4
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/> <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #container{height:100%}
    </style>
    <!--引入地图包，地图包网址的ak属性是你在百度地图开放平台上申请的秘钥-->
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=DZnhuUQiSq5QWgmIsx2g4omFi4jAs3EX"></script>
    <!--引入jquery-->
<%--    <script src="http://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>
    <title>地址解析</title>
</head>
<body>
<div id="container" style="width: 800px;height: 500px;"></div>
<script type="text/javascript">
    var map = new BMap.Map("container"); // 创建地图实例
    var point = new BMap.Point(110.668442,21.668293); // 创建点坐标 郑州市坐标113.631349, 34.753488
    map.centerAndZoom(point, 15); // 初始化地图，设置中心点坐标和地图级别
    // map.enableScrollWheelZoom(true);      //开启鼠标滚轮缩放
    map.enableScrollWheelZoom();
    map.addControl(new BMap.NavigationControl());
    map.addControl(new BMap.ScaleControl());
    map.addControl(new BMap.OverviewMapControl());
    map.addControl(new BMap.MapTypeControl());
    var dw=new BMap.GeolocationControl({enableAutoLocation:true});//自动定位控件
    map.addControl(dw);
    var dwxx=dw.GeolocationControl;
    dw.addEventListener("locationSuccess",function(){
        alert(dwxx);
    });
    dw.addEventListener("locationError",function(){
        alert("定位失败");
    });
    //alert(dwxx);
    var marker = new BMap.Marker(new BMap.Point(113.631349, 34.753488)); // 创建标注
    map.addOverlay(marker);
    map.addControl(new BMap.GeolocationControl());//定位控件
    map.setCurrentCity("北京");

    var companyName = {
       width: 80,     // 信息窗口宽度
        height: 30,     // 信息窗口高度
        title: "海天酒店"  // 信息窗口标题
    }

    var infoWindow = new BMap.InfoWindow("四川酒店",companyName);  // 创建信息窗口对象
    map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口


</script>
</body>
</html>
