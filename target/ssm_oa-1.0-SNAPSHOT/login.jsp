<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>协同办公平台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <!-- load css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/layui/css/layui.css"
          media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/login.css"
          media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/verify.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>

</head>
<body class="layui-bg-black">
<div class="layui-canvs"></div>
<div class="layui-layout layui-layout-login">
    <form method="post">
        <h1>
            <strong>协同办公平台</strong> <em>Tick-tock Office System</em>
        </h1>
        <div class="layui-user-icon larry-login">
            <input type="text" id="no" placeholder="账号" class="login_txtbx" name="no"
                   value="mww" />
        </div>
        <div class="layui-pwd-icon larry-login">
            <input type="password" id="pass" placeholder="密码" name="pass" value="111"
                   class="login_txtbx" />
        </div>
        <input type="hidden" name="ip" id="ip1"> <input type="hidden"
                                                        name="city" id="cy1">
        <div class="feri-code">
            <div id="mpanel4"></div>
        </div>
        <div class="layui-submit larry-login">
            <input type="button" id="btn1" onclick="empLogin()" disabled="disabled" value="立即登陆" class="submit_btn" />
        </div>
    </form>
    <div class="layui-login-text">
        <p>© 2016-2018 北京协同科技有限公司  版权所有</p>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/login.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/media/js/verify.min.js"></script>

<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<!--使用了JQuery，需要导入JS-->
<script type="text/javascript">
    var ip = "";
    var city = "";

  $(function () {
      ip = returnCitySN["cip"];//获取IP
      $.ajax({
          url: 'http://api.map.baidu.com/location/ip?ak=ia6HfFL660Bvh43exmH9LrI6',
          type: 'POST',
          dataType: 'jsonp',
          success: function (data) {
              console.log(data);
              city = data.content.address_detail.province + data.content.address_detail.city;//获取城市

          }
      });
  })

</script>

<script type="text/javascript">
    $(function() {
        //滑动验证码
        $('#mpanel4').pointsVerify({
            defaultNum : 1, //默认的文字数量
            checkNum : 1, //校对的文字数量  原始是 3 个文字；
            vSpace : 5, //间隔
            imgName : [ '1.jpg','2.jpg','mn2.jpg','mn3.jpg'],
            imgSize : {
                width : '400px',
                height : '200px',
            },
            barSize : {
                width : '400px',
                height : '40px',
            },
            ready : function() {
            },
            success : function() {
                //......后续操作
                $("#btn1").attr("disabled", false);
            },
            error : function() {
            }
        });
    });

    function empLogin() {
        var no = $("#no").val();
        var pass = $("#pass").val();
        $.ajax({
            type: "POST",
            data: {"no":no,"pass":pass,"ip":ip,"city":city},
            dataType: "json",
            url: "${pageContext.request.contextPath}/emplogin",
            success: function (data) {
                if (data.code == 200){
                    location.href = "${pageContext.request.contextPath}/topage/index";
                }else{
                    alert(data.msg);
                }
            },
            error: function (index) {
                alert("ajax发生了系统性错误！");
            }
        });
    }
</script>
</body>
</html>
