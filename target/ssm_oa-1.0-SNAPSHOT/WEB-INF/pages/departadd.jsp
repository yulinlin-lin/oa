<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<title>滴答办公系统-部门新增</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/media/layui/css/layui.css" media="all">
<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>
</head>
<body>

	<div class="layui-container" style="margin-top: 5px">
<%--		同步的情况--%>
<%--		<form class="layui-form" action="${pageContext.request.contextPath}/addDepart" method="post">--%>
<%--		异步发送请求的情况--%>
	<form class="layui-form" id="fm">
			<%--<div class="layui-form-item">
				<label class="layui-form-label">部门编号</label>
				<div class="layui-input-block">
					<input type="text" name="name" readonly lay-verify="name" autocomplete="off"
						 class="layui-input">
				</div>
			</div>--%>
			
			<div class="layui-form-item">
				<label class="layui-form-label">部门名称</label>
				<div class="layui-input-block">
					<input type="text" name="name" lay-verify="name" autocomplete="off"
						placeholder="请输入部门周期" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">创立日期</label>
				<div class="layui-input-block">
				 <input type="text" name="createtime" placeholder="请输入创立日期" id="date" autocomplete="off" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
					<%--同步的请求方式--%>
<%--				<input class="layui-btn" style="margin-left: 10%" onclick="addDept()" type="submit" value="确认新增">--%>
				<%--异步请求的方式--%>
				<input class="layui-btn" style="margin-left: 10%" onclick="addDept()" type="button" value="确认新增">
			</div>
		</form>
	</div>

	<script>
		function addDept() {
			//序列表格中的数据为字符串，下面的方法；
			var fm = $("#fm").serialize();
			console.log(fm);
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/addDepartAjax",
				data: fm,
				dataType: "json",
				success: function (result) {
					if (result.code == 0){
						alert(result.msg);
					}else{
						alert(result.msg);
					}
				},
				error: function () {
					alert("ajax代码有错！！");
				}
			});
		}
	</script>


	<script src="${pageContext.request.contextPath}/media/layui/layui.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>

		layui.use(
						[ 'form', 'laydate' ],
						function() {
							var form = layui.form, layer = layui.layer, laydate = layui.laydate;

							//日期
							laydate.render({
								elem : '#date'
							});
							

							//自定义验证规则
							form.verify({
								title : function(value) {
									if (value.length < 5) {
										return '标题至少得5个字符啊';
									}
								},
								pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
								content : function(value) {
									layedit.sync(editIndex);
								}
							});
		});
	</script>
</body>
</html>