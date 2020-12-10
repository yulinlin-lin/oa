<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery全国城市天气预报API查询代码</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/media/css/iconfont.css" />
<style>
	*{margin:0;padding:0;}
	ul,li{list-style: none;}
	a{text-decoration: none;}
	html,body{width:100%;height:100%;background:#CCE8E9;}
	input{border:none;outline:none;}
	.clearfix:after { content: "";height: 0;line-height: 0;display: block; clear: both;}
	.clearfix {zoom: 1;}
	.wrap{width:600px;min-height:300px;position:fixed;left:50%;top:50%;margin-left:-300px;margin-top:-150px;}
	.wrap .header{width:100%;height:40px;position:relative;line-height:40px;border:1px solid #fff;border-radius:4px;}
	.wrap .header .intCity{width:80%;height:40px;line-height:40px;font-size:16px;text-indent: 10px;}
	.wrap .header .seachBtn{width:19%;height:40px;line-height:40px;font-size:16px;color:#fff;text-align: center;background:#00BFFF;font-weight:600;cursor:pointer;}
	.wrap .left{width:200px;min-height:300px;float:left;text-align: left;padding-top:20px;}
	.wrap .left li{height:40px;line-height:40px;font-size:16px;color:#fff;}
	.wrap .left li i{font-size:22px;color:yellow;}
	.wrap .left li .span2{margin-left:20px;color: #0C0C0C;}
	.wrap .left li .cityName{font-size:20px;}
	
	.wrap .right{width:400px;text-align: center;float:right;}
	.wrap .right ul{margin-top:20px;color:#fff;font-size:16px;}
	.wrap .right .data1{width:50%;float:left;}
	.wrap .right .data2{width:50%;float:left;}
	.wrap .right .data3{width:100%;}
	input{outline:none;border:none;height:30px;}
</style>
</head>
<body><script src="/demos/googlegg.js"></script>
<div class="wrap clearfix">
	<div class="header">
		<input class="intCity" type="text" placeholder="Please enter the city" value="成都">
		<input class="seachBtn" type="button" value="Seach">
	</div>
	<div class="left">
		<ul>
			<li><span><i class="icon iconfont icon-chengshi"></i></span><span class="cityName span2" id="sp1"></span></li>
			<li><span><i class="icon iconfont icon-riqi"></i></span><span class="left_data span2" id="sp2"></span></li>
			<li><span><i class="icon iconfont icon-weather2"></i></span><span class="left_weather span2" id="sp3"></span></li>
			<li><span><i class="icon iconfont icon-wendu"></i></span><span class="left_temp span2" id="sp4"></span></li>
			<li><span><i class="icon iconfont icon-fengxiang"></i></span><span class="left_wind1 span2" id="sp5"></span></li>
			<li><span><i class="icon iconfont icon-qixiang-fengli"></i></span><span class="left_wind2 span2" id="sp6"></span></li>
		</ul>
	</div>
	<div class="right">
		<ul class="data1"></ul>
		<ul class="data2"></ul>
		<ul class="dataOne"></ul>
	</div>
</div>

<script src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>

<script src="http://webapi.amap.com/subway?v=1.0&key=a6414d65323db9e2718b31e525a1337d&callback=cbk"></script>
<script>
	function getWeather(location,type,el){
		var url = "${pageContext.request.contextPath}/query_weather";
		$.ajax({
			url:url,
			type:type,
			data: {"city":location},
			success:function(data){
				// console.log(status);
				$("#sp1").html(data.result.result.city);
				$("#sp2").html(data.result.result.date);
				$("#sp3").html(data.result.result.weather);
				$("#sp4").html(data.result.result.temp);
				$("#sp5").html(data.result.result.winddirect);
				$("#sp6").html(data.result.result.windpower);
			},
			error:function(status){
			}
		})
	}
	$(".seachBtn").click(function(){
		getWeather($(".intCity").val(),"post",".box1");
	})
	function addHtmlTwo(){
		
	}
	function addHtmlOne(){
		
	}
	
	
</script>

</body>
</html>

