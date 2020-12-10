<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<title>滴答办公系统-修改头像</title>
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
				<label class="layui-form-label">头像</label>
				<div class="layui-input-block">
					<div class="layui-form-mid layui-word-aux">
						<img src="${pageContext.request.contextPath}/media/uploads/${sessionScope.emp.photo}" />
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">选择文件</label>
				<div class="layui-input-block">
					<input type="file" name="mFile" id="no1" class="layui-input">
				</div>
			</div>
		    <div class="layui-form-item">
				<input class="layui-btn" style="margin-left: 10%"  id="btn1" type="submit" value="确认导入">
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
	</script>
</body>
</html>