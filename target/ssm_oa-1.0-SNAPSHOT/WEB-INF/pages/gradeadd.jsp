<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<title>滴答办公系统-班级新增</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/media/layui/css/layui.css" media="all">

<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>
</head>
<body>
	<div class="layui-container" style="margin-top: 5px">
		<form class="layui-form" action="${pageContext.request.contextPath}/classAdd" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">班级名称</label>
				<div class="layui-input-block">
					<input type="text" name="className" lay-verify="name" autocomplete="off"
						placeholder="请输入名称" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">班级学科</label>
				<div class="layui-input-block">
					<select id="cds" name="majorId" >
						<option value="-1">--请选择学科--</option>
						<c:forEach items="${majors}" var="m">
							<option value="${m.id}">${m.majorName}</option>
						</c:forEach>
      				</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">开班日期</label>
				<div class="layui-input-block">
				 <input type="text" name="classDate" id="date" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">班级周期</label>
				<div class="layui-input-block">
					<input type="text" name="classTime" lay-verify="name" autocomplete="off"
						placeholder="请输入周期" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">班级地址</label>
				<div class="layui-input-block">
					<input type="text" name="classAddress" lay-verify="name" autocomplete="off"
						placeholder="请输入地址" class="layui-input">
				</div>
			</div>
		
			<div class="layui-form-item">
				<input class="layui-btn"  style="margin-left: 10%" type="submit" value="确认新增">
			</div>
		</form>
	</div>


	<script src="${pageContext.request.contextPath}/media/layui/layui.js"></script>

	<script>
		/*$(function () {
			$.ajax({
				type: "POST",
				url: "/queryAllMajor",
				dataType: "json",
				success: function (data) {
					$.each(data,function (index,res) {
						$("#cds").append("<option value="+res.id+">"+res.majorName+"</option>");
					});
				},
				error: function () {
					alert("ajax发生了严重性代码错误！");
				}
			})
		});*/
	</script>



	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
	    var form;
		layui.use([ 'form', 'laydate' ],
				function() {
					form = layui.form, layer = layui.layer, laydate = layui.laydate;
							//日期
							laydate.render({
								elem : '#date'
							});
							initData(); //初始化数据  下拉框
		});
		
		//初始化数据
		function initData() {
			$.get("发送异步的地址....",null,function(arr){
				for(i=0;i<arr.length;i++){
					$("#cds").append("<option value='"+arr[i].id+"'>"+arr[i].name+"</option>");
				}
				form.render("select"); //渲染下拉框
			})
		}
		
	</script>
</body>
</html>