<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<title>滴答办公系统-学员导入</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/media/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>
</head>
<body>
	<div class="layui-container" style="margin-top: 5px">
		<form class="layui-form" action="${pageContext.request.contextPath}/excelImportToDB" method="post" enctype="multipart/form-data">
		<div class="layui-form-item">
				<label class="layui-form-label">下载模板</label>
				<div class="layui-input-block">
					<div class="layui-form-mid layui-word-aux">
						<a href="${pageContext.request.contextPath}/media/tem/template.xlsx">批量导入学员模板.xls</a>
					</div>
				</div>
				
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">选择文件</label>
				<div class="layui-input-block">
					<input type="file" name="file" id="no1" class="layui-input">
				</div>
			</div>
		    <div class="layui-form-item">
				<input class="layui-btn" style="margin-left: 10%"  id="btn1" type="submit" value="确认导入">
			</div>
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/media/layui/layui.js"></script>
	<script>
</script>
</body>
</html>