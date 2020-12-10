<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>滴答办公系统-学员列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/media/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>
</head>
<body>
<div class="layui-container">
    <div class="layui-row" style="margin-top: 10px">
        <form id="fm" action="${pageContext.request.contextPath}/queryStudentsPage/1/${pb3.pageSize}" method="post">

            <div class="layui-col-xs3" style="margin-right: 20px">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <%--学生的姓名--%>
                        <input type="text" id="no" name="name" value="${name}" class="layui-input" placeholder="学生姓名">
                    </div>
                </div>
            </div>

            <div class="layui-col-xs3" style="margin-right: 20px">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">班级：</label>
                    <div class="layui-input-block">
                        <select class="layui-input" id="bg" name="classId">
                            <option value="0">--请选择班级--</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="layui-col-xs2">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" onclick="queryStudents();"><i class="layui-icon layui-icon-search">搜索</i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="layui-col-xs2">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <a class="layui-btn layui-btn-mini layui-btn-mini" href="javascript:exceptExcel();"
                           lay-event="detail">导出Excel</a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="layui-container">
    <table class="layui-table" id="tbdata" lay-filter="tbop">
        <thead>
        <tr>
            <td>序号</td>
            <td>学号</td>
            <td>姓名</td>
            <td>班级</td>
            <td>性别</td>
            <td>手机号</td>
            <td>邮箱</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody>
		<c:forEach items="${pb3.recodes}" var="stu">
        	<tr>
            <td>${stu.id}</td>
            <td>${stu.no}</td>
            <td>${stu.name}</td>
            <td>${stu.c.className}</td>
            <td>${stu.sex}</td>
            <td>${stu.phone}</td>
            <td>${stu.email}</td>
            <td><a class="layui-btn layui-btn-mini" href="studentupdate.html">编辑</a>
                <a class="layui-btn layui-btn-mini layui-btn-mini" href="studentdetails.html"
                   lay-event="detail">查看详情</a>
                <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del" onclick="deleteCourse();">删除</a>
            </td>
        </tr>
		</c:forEach>
        </tbody>
    </table>
	<div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1">

<%--		<a href="${pageContext.request.contextPath}/queryStudentsPage/1/${pb3.pageSize}" class="layui-laypage-prev data-page="0">--%>
		<a href="javascript:jumpPage(1)" class="layui-laypage-prev data-page="0">
		<i class="layui-icon">首页</i>
		</a>

		<c:if test="${pb3.pageNo != 1}">
<%--			<a href="${pageContext.request.contextPath}/queryStudentsPage/${pb3.pageNo - 1}/5" class="layui-laypage-prev &lt;%&ndash;layui-disabled"&ndash;%&gt; data-page="0">--%>
			<a href="javascript:jumpPage(${pb3.pageNo - 1})" class="layui-laypage-prev <%--layui-disabled"--%> data-page="0">
			<i class="layui-icon">上页</i>
			</a>
		</c:if>

		<c:forEach begin="${pb3.startno}" end="${pb3.endno}" step="1" var="no">
			<c:if test="${pb3.pageNo == no}">
				<span style="color:#009688;font-weight: bold;">${no}</span>
			</c:if>

			<c:if test="${pb3.pageNo != no}">
<%--				<a href="${pageContext.request.contextPath}/queryStudentsPage/${no}/${pb3.pageSize}">${no}</a>--%>
				<a href="javascript:jumpPage(${no})">${no}</a>
			</c:if>
		</c:forEach>

		<c:if test="${pb3.pageNo != pb3.totalPages}">
<%--			<a href="${pageContext.request.contextPath}/queryStudentsPage/${pb3.pageNo + 1}/${pb3.pageSize}" class="layui-laypage-next &lt;%&ndash;layui-disabled"&ndash;%&gt; data-page="2">--%>
			<a href="javascript:jumpPage(${pb3.pageNo + 1})" class="layui-laypage-next <%--layui-disabled"--%> data-page="2">
			<i class="layui-icon">下页</i>
			</a>
		</c:if>
<%--		<a href="${pageContext.request.contextPath}/queryStudentsPage/${pb3.totalPages}/${pb3.pageSize}" class="layui-laypage-prev data-page="0">--%>
		<a href="javascript:jumpPage(${pb3.totalPages})" class="layui-laypage-prev data-page="0">
		<i class="layui-icon">尾页</i>
		</a>
		<span class="layui-laypage-skip">到第
								<input type="number" min="1" max="${pb3.totalPages}"
									   onblur="checkNo(this.value,${pb3.totalPages},${pb3.pageSize})" value="1" class="layui-input">页
								<button type="button"  class="layui-laypage-btn">确定</button>
							</span>
		<span class="layui-laypage-count">共 ${pb3.totalCount} 条</span>
		<span class="layui-laypage-limits">
								<%--绑定一个改变事件，当发生改变时，就会去执行函数--%>
							    <select lay-ignore="" onchange="changePage(this.value)">
							        <option value="5" ${pb3.pageSize == 5? "selected":""}>5 条/页</option>
									<option value="10" ${pb3.pageSize == 10? "selected":""}>10 条/页</option>
									<option value="15" ${pb3.pageSize == 15? "selected":""}>15 条/页</option>
									<option value="30" ${pb3.pageSize == 30? "selected":""}>30 条/页</option>
							</select>
							</span>
	</div>
</div>

<script src="${pageContext.request.contextPath}/media/layui/layui.js"></script>

<script type="text/javascript">

    function exceptExcel() {
        var url = "${pageContext.request.contextPath}/dbExportToExcel";
        $("#fm").prop("action", url);
        $("#fm").submit();
    }



    function queryStudents() {
        $("#fm").prop("action", url);
        $("#fm").submit();
    }


    function jumpPage(pageNo) {
        // alert(666);
        //    获取表单
        var url = "${pageContext.request.contextPath}/queryStudentsPage/" + pageNo + "/${pb3.pageSize}";
        $("#fm").prop("action", url);
        $("#fm").submit();
    }



    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/getAllClass",
            type: "POST",
            dataType: "JSON",
            success: function (result) {
                // alert("林忆莲！");
                console.log(result);
                $.each(result,function (index,res) {
                    console.log(res);
                    if (res.id == ${classId}) {
                        <%--alert(${classId});--%>
                        $("#bg").append("<option selected value=" + res.id + ">" + res.className + "</option>");
                    } else {
                        $("#bg").append("<option value=" + res.id + ">" + res.className + "</option>");
                    }
                })
            }
        });
    });



    /*no 是 想要跳转去的当前面的页数，    tp是总的页数     ts是每一页显示的条灵敏*/
function checkNo(no,tp,ps) {
    var url = "";
    if ( no < 1 || no > tp){
        alert("页码超出的有效范围！");
        url = "${pageContext.request.contextPath}/queryStudentsPage/1/"+ps;
    }else{
        url = "${pageContext.request.contextPath}/queryStudentsPage/"+no+"/"+ps;
    }
    $("#fm").prop("action", url);
    $("#fm").submit();
}


function changePage(num) {
    // alert(num);
    var url  = "${pageContext.request.contextPath}/queryStudentsPage/1/"+num;
    $("#fm").prop("action", url);
    $("#fm").submit();
}
    function deleteCourse() {
        layui.use('table', function () {
            layer.confirm('是否确认删除学生?', function (index) {
                layer.msg("删除成功", {icon: 6});
                layer.msg("删除失败", {icon: 5});
            });
        });
    }
</script>


</body>
</html>