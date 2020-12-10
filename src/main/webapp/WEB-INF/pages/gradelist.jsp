<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<title>滴答办公系统-班级列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/media/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>
</head>
<body>
	<div class="layui-container">
		<table class="layui-table" id="tbdata" lay-filter="tbop">
			<thead>
				<tr>
					<td>序号</td>
					<td>班级名称</td>
					<td>班级人数</td>
					<td>学科名称</td>
					<td>周数</td>
					<td>位置</td>
					<td>开班日期</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${pi.list}" var="c">
				<tr>
					<td>${c.id}</td>
					<td>${c.className}</td>
					<td>${c.classTime}</td>
					<td>${c.majorName}</td>
					<td>${c.classSize}</td>
					<td>${c.classAddress}</td>
					<td>${c.classDate}</td>
					<td><a class="layui-btn layui-btn-mini" href="gradeupdate.html">编辑</a>
						<a class="layui-btn layui-btn-danger layui-btn-mini"
						   lay-event="del" onclick="deleteCourse();">删除</a></td>
				</tr>
			</c:forEach>

			</tbody>
		</table>
		<div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1">

			<a href="${pageContext.request.contextPath}/queryClassPage/1/${pi.pageSize}" class="layui-laypage-prev data-page="0">
			<i class="layui-icon">首页</i>
			</a>

			<c:if test="${pi.pageNum != 1}">
				<a href="${pageContext.request.contextPath}/queryClassPage/${pi.pageNum - 1}/5" class="layui-laypage-prev <%--layui-disabled"--%> data-page="0">
				<i class="layui-icon">上页</i>
				</a>
			</c:if>

			<%--
			<span style="color:#009688;font-weight: bold;">1</span>
							    <a href="#">2</a>
							    <a href="#">3</a>
							    <a href="#">4</a>
							    <a href="#">5</a>
							    <a href="${pageContext.request.contextPath}/queryDepartPage/${no}/5">${no}</a>
			--%>


<%--			<c:forEach begin="${pi.pageNum}" end="${pi.navigate}" step="1" var="no">--%>
			<c:forEach items="${pi.navigatepageNums}"  step="1" var="no">
				<c:if test="${pi.pageNum == no}">
					<span style="color:#009688;font-weight: bold;">${no}</span>
				</c:if>

				<c:if test="${pi.pageNum != no}">
					<a href="${pageContext.request.contextPath}/queryClassPage/${no}/${pi.pageSize}">${no}</a>
				</c:if>
			</c:forEach>

			<c:if test="${pi.pageNum != pi.pages}">
				<a href="${pageContext.request.contextPath}/queryClassPage/${pi.pageNum + 1}/${pi.pageSize}" class="layui-laypage-next <%--layui-disabled"--%> data-page="2">
				<i class="layui-icon">下页</i>
				</a>
			</c:if>
			<a href="${pageContext.request.contextPath}/queryClassPage/${pi.pages}/${pi.pageSize}" class="layui-laypage-prev data-page="0">
			<i class="layui-icon">尾页</i>
			</a>
			<span class="layui-laypage-skip">到第
								<input type="number" min="1" max="${pi.pages}"
									   onblur="checkNo(this.value,${pi.pages},${pi.pageSize})" value="1" class="layui-input">页
								<button type="button"  class="layui-laypage-btn">确定</button>
							</span>
			<span class="layui-laypage-count">共 ${pi.total} 条</span>
			<span class="layui-laypage-limits">
								<%--绑定一个改变事件，当发生改变时，就会去执行函数--%>
							    <select lay-ignore="" onchange="changePage(this.value)">
							        <option value="5" ${pi.pageSize == 5? "selected":""}>5 条/页</option>
									<option value="10" ${pi.pageSize == 10? "selected":""}>10 条/页</option>
									<option value="15" ${pi.pageSize == 15? "selected":""}>15 条/页</option>
									<option value="30" ${pi.pageSize == 30? "selected":""}>30 条/页</option>
							</select>
							</span>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/media/layui/layui.js"></script>
	
	<script type="text/javascript">

		function checkNo(no,tp,ps) {
			if ( no < 1 || no > tp){
				alert("页码超出的有效范围！");
				location.href = "${pageContext.request.contextPath}/queryClassPage/1/"+ps;
			}else{
				location.href = "${pageContext.request.contextPath}/queryClassPage/"+no+"/"+ps;
			}
		}


		function changePage(num) {
			// alert(num);
			location.href = "${pageContext.request.contextPath}/queryClassPage/1/"+num;
		}


	   function deleteCourse(){
		   layui.use('table', function() {
			   layer.confirm('是否确认删除班级?',function(index) {
				   layer.msg("删除成功", {icon : 6});
				   layer.msg("删除失败", {icon : 5});
			   });
		   });
	   }
	</script>

</body>
</html>