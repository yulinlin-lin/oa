<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<title>滴答办公系统-员工新增</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/media/layui/css/layui.css" media="all">
<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.min.js"></script>
</head>
<body>
	<div class="layui-container" style="margin-top: 5px">
		<form id="fm" class="layui-form" method="post">

			<input type="hidden" name="id" value="${emp.id}">

			<div class="layui-form-item">
				<label class="layui-form-label">员工工号</label>
				<div class="layui-input-block">
					<input type="text" name="no" lay-verify="name" autocomplete="off"
						placeholder="${emp.no}" value="${emp.no}" id="no1" class="layui-input">
				</div>
			</div>


			<div class="layui-form-item">
				<label class="layui-form-label">员工姓名</label>
				<div class="layui-input-block">
					<input type="text" name="name" lay-verify="name" autocomplete="off"
						placeholder="${emp.name}" value="${emp.name}" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
            <label class="layui-form-label">所属部门</label>
	            <div class="layui-input-block">
	                <select name="did"  id="cds">
						<c:forEach items="${departs}" var="dept">
	       					<%--<option value="-1">--请选择部门--</option>--%>
							<c:if test="${dept.id == emp.did}">
								<option value="${dept.id}" selected>${dept.name}</option>
							</c:if>
							<c:if test="${dept.id != emp.did}">
								<option value="${dept.id}">${dept.name}</option>
							</c:if>
						</c:forEach>
	      			</select>
	            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
	            <div class="layui-input-block">
					<c:if test="${emp.sex == '男'}">
						<input type="radio" name="sex" value="男" title="男" checked>
						<input type="radio" name="sex" value="女" title="女">
					</c:if>

					<c:if test="${emp.sex == '女'}">
						<input type="radio" name="sex" value="男" title="男">
						<input type="radio" name="sex" value="女" title="女" checked>
					</c:if>
	            </div>
        	</div>
	  		<div class="layui-form-item">
	            <label class="layui-form-label">邮箱</label>
	            <div class="layui-input-inline">
	                <input type="text" name="email" lay-verify="required" placeholder="${emp.email}" value="${emp.email}" autocomplete="off" class="layui-input">
	            </div>
	        </div>
	  		<div class="layui-form-item">
	            <label class="layui-form-label">手机号</label>
	            <div class="layui-input-inline">
	                <input type="text" name="phone" lay-verify="required" value="${emp.phone}" placeholder="${emp.phone}" autocomplete="off" class="layui-input">
	            </div>
	        </div>
	  		<div class="layui-form-item">
	            <label class="layui-form-label">QQ</label>
	            <div class="layui-input-inline">
	                <input type="text" name="qq" lay-verify="required" value="${emp.qq}" placeholder="${emp.qq}" autocomplete="off" class="layui-input">
	            </div>
	        </div>
	  		<div class="layui-form-item">
	             <label class="layui-form-label">入职日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="createdate" id="date" value="${emp.createdate}" autocomplete="off" class="layui-input">
                </div>
	        </div>
 			<div class="layui-form-item">
 				 <label class="layui-form-label">照片</label>
 				 <button type="button" class="layui-btn" id="upfile">
				  <i class="layui-icon">&#xe67c;</i>上传图片
				</button>
				<input type="hidden" name="photo" id="p1">
 				 <div class="layui-input-block">
 				 	<img alt="个人一寸照片"
						 src="${pageContext.request.contextPath}/media/uploads/${emp.photo}"
						 id="img1" width="200px" height="300px">
 				 </div>
 			</div>
			<div class="layui-form-item">
				<input class="layui-btn"  style="margin-left: 10%"  id="btn1" disabled="disabled"
					   onclick="updateEmp()" type="button" value="确认修改">
			</div>
		</form>
	</div>


	<script src="${pageContext.request.contextPath}/media/layui/layui.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>

		function updateEmp() {
			var fm = $("#fm").serialize();
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/empUpdate",
				data: fm,
				dataType: "JSON",
				success: function (result) {
				//	判断是否已经更新成功
				//	如果更新成功，就跳转到员工列表，查询一次
					if(result.code == 0){
					 	alert(result.msg);
					 	location.href = "${pageContext.request.contextPath}/queryEmpPage/1/5";
					}else{
						alert(result.msg);
					}
				//	如果没有成功，给出提示信息；
				},
				error: function (jqXHR, textStatus, errorThrown) {
					alert("ajax函数发生了严重错误！！！    jqXHR.status   "+jqXHR.status);
				}
			});


		}


	</script>
	<script>
	var form;
		layui
				.use(
						[ 'form','upload', 'layedit', 'laydate' ],
						function() {
							form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
							var upload = layui.upload;
							   
							  //执行实例
							  var uploadInst = upload.render({
							    elem: '#upfile' //绑定元素
							    ,url: '${pageContext.request.contextPath}/photoupload' //上传接口
							    ,done: function(obj){
							      //上传完毕回调
									  console.log(obj.status);
									  console.log(obj.msg);
							      // if(obj.code==1000){
							    	  $("#p1").val(obj.msg);
								      $("#img1")[0].src="${pageContext.request.contextPath}/media/uploads/"+obj.msg;
							      	  $("#btn1").attr("disabled",false);
							      <%--}else{--%>
							    	<%--  $("#img1")[0].src="${pageContext.request.contextPath}/media/uploads/unknown.jpg";--%>
							      <%--}--%>
							      
							    }
							    ,error: function(){
							      //请求异常回调
							    }
							  });
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
					initData();
		});
		//初始化数据
		function initData() {
			$.get("departall.do",null,function(arr){
				for(i=0;i<arr.length;i++){
					$("#cds").append("<option value='"+arr[i].id+"'>"+arr[i].name+"</option>");
				}
				form.render("select");
			});
			$.get("staffno.do",null,function(obj){
				if(obj.msg=='null'){
					$("#no1").val("qf000001");
				}else{
					$("#no1").val(obj.msg+1);
				}
				
			})
		}
	</script>
</body>
</html>