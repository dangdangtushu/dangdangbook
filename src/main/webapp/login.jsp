<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.oraclewdp.ddbookmarket.model.Admin" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<!-- 1告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 2css -->
<!--<link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />-->
<link href="bower_components/bootswatch/dist/united/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container-fluid" style="width: 60%">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<%--
							Map<String,String> errors= (Map<String, String>) request.getAttribute("errors");
							if(errors!=null){
								Set<String> keySet=errors.keySet();
								for (String key:
										keySet) {
									out.print(key+"------>"+errors.get(key));%>
								}
							}
						--%>
						<form method="post" autocomplete="off" action="login" id="loginForm">
						<%
							Map<String,String> errors= (Map<String, String>) request.getAttribute("errors");
						Admin admin =(Admin)request.getAttribute("admin");
						if(admin !=null){
						%>

							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">用户名</label>
								<div class="col-sm-10">
									<%
										if(errors!=null&&errors.get("name")!=null){
										%>
									<input type="text" class="form-control is-invalid" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()%>">
									<div class="invalid-feedback">
										<%=errors.get("name")%>
									</div>
									<%
									}else{
										%>
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()==null?"":admin.getName()%>">
									<%
									}
									%>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
								<div class="col-sm-10">
									<%
										if(errors!=null&&errors.get("pwd")!=null){
									%>
									<input type="password" class="form-control is-invalid" id="inputPwd" placeholder="密码" name="pwd" <%=admin.getName()%>>
									<div class="invalid-feedback">
										<%=errors.get("pwd")%>
									</div>
									<%
									}else{
									%>
									<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd" <%=admin.getName()%>>
									<%
										}
									%>
								</div>
							</div>
							<!--jcaptcha:图片式验证码-->
							<div class="form-group row">
								<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
								<div class="col-sm-5">
									<%
										if(errors!=null&&errors.get("vcode")!=null){
									%>
									<input type="password" class="form-control is-invalid" id="inputVcode" placeholder="验证码" name="vcode">
									<div class="invalid-feedback">
										<%=errors.get("vcode")%>
									</div>
									<%
									}else{
									%>
									<input type="password" class="form-control" id="inputVcode" placeholder="验证码" name="vcode">
									<%
										}
									%>

								</div>
								<div class="col-5">
									<img src="/vcode.png" id="vcodeImg" title="点击切换图片">
								</div>
								<div class="valid-feedback">
									<%
										if(request.getAttribute("msg")!=null){
										    %>
									<%=request.getAttribute("msg")%>
									<%
										}
									%>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登录</button>
									<!-- <img src="-4c9e59fffa8e6d5e.jpg" width="60%" height="auto"> -->
								</div>
							</div>
							<%
						}else{
							%>
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="inputVcode" placeholder="验证码" name="vcode">
								</div>
								<div class="col-5">
									<img src="/vcode.png" id="vcodeImg" title="点击切换图片">
								</div>
								<div class="valid-feedback">
									<%
										if(request.getAttribute("msg")!=null){
									%>
									<%=request.getAttribute("msg")%>
									<%
										}
									%>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登录</button>
									<!-- <img src="-4c9e59fffa8e6d5e.jpg" width="60%" height="auto"> -->
								</div>
							</div>
							<%
						}
						%>
						</form>
							
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#vcodeImg").click(function () {
				//不加入不能换图片
				$(this).attr("src","vcode.png?="+Math.random());
            })
        });
	</script>
	<!--先导入js-->
	<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
	<script type="text/javascript">
        $(function () {
            $("#loginForm").validate({
                rules:{//验证规则
                    name:{
                        required:true,//必须显示
                        maxlength:20,
						minlength:3
                    },
                    pwd:{
                        required:true,
                        maxlength:16,
                        minlength:3
                    },
                    vcode:{
                        required:true,
                    }

                },
                messages:{//验证不通过，应该显示的消息:  如果不写，就会用默认的消息

                },
                errorElement:"div",
                errorClass:"invalid-feedback",
                highlight:function (element,errorClass,validClass) {//显示高亮
                    $(element).addClass("is-invalid").removeClass(validClass);
                },
                unhighlight:function (element,errorClass,validClass) {//取消高亮
                    $(element).removeClass("is-invalid").addClass(validClass);
                },
                validClass:"is-valid"
            });
        });
	</script>
</body>
</html>