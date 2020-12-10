<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<title>滴答办公系统-学员详细</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/media/layui/css/layui.css" media="all">
<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>
</head>
<body>
	<div class="layui-container" style="margin-top: 5px">
		<form class="layui-form" action="studentadd.do" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">学员姓名</label>
				<div class="layui-input-block">
					<div class="layui-form-mid layui-word-aux">小张</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">所属班级</label>
				<div class="layui-input-block">
					<div class="layui-form-mid layui-word-aux">JAVAEE1805</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<div class="layui-form-mid layui-word-aux">男</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-inline">
					<div class="layui-form-mid layui-word-aux">345353543@qq.com</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<div class="layui-form-mid layui-word-aux">144576800324</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">QQ</label>
				<div class="layui-input-inline">
					<div class="layui-form-mid layui-word-aux">34543556765</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">身份证号</label>
				<div class="layui-input-inline">
					<div class="layui-form-mid layui-word-aux">144576768768768768800324</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">毕业学校</label>
				<div class="layui-input-inline">
					<div class="layui-form-mid layui-word-aux">哈佛大学</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">学历</label>
				<div class="layui-input-inline">
					<div class="layui-form-mid layui-word-aux">博士后</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">出生日期</label>
				<div class="layui-input-inline">
					<div class="layui-form-mid layui-word-aux">1994-10-10</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">入学日期</label>
				<div class="layui-input-inline">
					<div class="layui-form-mid layui-word-aux">2016-10-10</div>
				</div>
			</div>
		</form>
	</div>


	<script src="${pageContext.request.contextPath}/media/layui/layui.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
	    var form;
		layui.use(
					[ 'form','upload', 'layedit', 'laydate' ],
					function() {
						form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
						var upload = layui.upload;
						//日期
						laydate.render({
							elem : '#date1'
						});
						laydate.render({
							elem : '#date2'
						});
			 initData();
		});
		$("#cds").html(s);
		var s="<option value="-1">--请选择班级--</option>";
			for(var i=0;i<result.length;i++){
				
				s=s+"<option value='"+result[i].id+"'>"+result[i].name+"</option>";
	</script>
</body>
</html>