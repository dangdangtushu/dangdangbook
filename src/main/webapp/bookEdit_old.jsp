<%--
	if( session.getAttribute("hasLogined")==null||!(Boolean) session.getAttribute("hasLogined")){//没有登录
		response.sendRedirect("login.jsp");
		return;
	}
--%>
<%@ page import="com.oraclewdp.ddbookmarket.model.Book" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书类编辑</title>
<!-- 1告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 2css -->
<!--<link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />-->
<link href="bower_components/bootswatch/dist/united/bootstrap.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.custom-file-label::after {
	content: "浏览"
}
</style>
</head>
<body>
	<!-- 响应式设计 -->
	<div class="container-fluid" style="width: 60%">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<form method="post" autocomplete="off" action="doBookEdit" enctype="multipart/form-data">
							<%
								Book book= (Book) request.getAttribute("book");
								SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
							%>
							<input type="hidden" name="id" value="<%=book.getId()%>">
							<div class="form-group row">
								<!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
								<label for="inputBid" class="col-sm-2 col-form-label text-right">大类</label>
								<div class="col-sm-10">
									<select name="bid" class="form-control" id="inputBid">
										<option value="-1">-----请选择-----</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
								<label for="inputSid" class="col-sm-2 col-form-label text-right">小类</label>
								<div class="col-sm-10">
									<select name="sid" class="form-control" id="inputSid">

									</select>
								</div>
							</div>
							
							<div class="form-group row">
								<!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
								<label for="inputName" class="col-sm-2 col-form-label text-right">书名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="书名" name="name" value="<%=book.getName()%>">
								</div>
							</div>
							<div class="form-group row">
								<!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
								<label for="inputPrice" class="col-sm-2 col-form-label text-right">价格</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputPrice" placeholder="价格" name="price" value="<%=book.getPrice()%>">
								</div>
							</div>
							<div class="form-group row">
								<!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
								<label for="inputAuthor" class="col-sm-2 col-form-label text-right">作者</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputAuthor" placeholder="作者" name="author" value="<%=book.getAuthor()%>">
								</div>
							</div>
							<div class="form-group row">
								<!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
								<label for="inputCbs" class="col-sm-2 col-form-label text-right">出版社</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputCbs" placeholder="出版社" name="cbs" value="<%=book.getCbs()%>">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputCbDate" class="col-sm-2 col-form-label text-right">出版时间</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputCbDate" placeholder="出版时间" name="cbDate" readonly="readonly" value="<%=sdf.format(book.getCbDate())%>">
								</div>
							</div>
							<div class="form-group row">
								<!-- label作用是当你点击它内部的文字，for告诉那个输入框获取输入焦点 -->
								<label for="inputDescri" class="col-sm-2 col-form-label text-right">简介:</label>
								<div class="col-sm-10">
								<textarea class="form-control" id="inputDescri" placeholder="简介" name="descri"><%=book.getDescri()%></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPhoto" class="col-sm-2 col-form-label text-right">图片</label>
								<div class="col-sm-10">
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="inputPhoto" aria-describedby="inputPhoto" name="photo"> <label
											class="custom-file-label" for="inputPhoto">请选择文件</label>
									</div>
									<img src="upload/<%=book.getPhoto()%>">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">修改</button>
									<!-- <img src="-4c9e59fffa8e6d5e.jpg" width="60%" height="auto"> -->
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
	<script type="text/javascript">
	/*var xhr = new XMLHttpRequest();
		xhr.open("GET", "findAllBigType");//开始拨号
		xhr.send();//点击拨打
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {//请求完全接收到了
				if (xhr.status == 200) {//请求成功
					//console.dir(xhr.responseText);
					//让字符串中JavaScript代码执行
					eval(xhr.responseText);
				}
			}
		}*/
		function fillSel(types) {
			for (var i = 0; i < types.length; i++) {
				var op=new Option(types[i].name,types[i].id);
				document.getElementById("inputBid").appendChild(op);
			}
            $("#inputBid").val('<%=request.getAttribute("bid")%>');
            //因为你产生该事件，让小类填充
            $("#inputBid").trigger("change");
		}
		function fillSmallSel(types) {
			//添加之前清除所有
			document.getElementById("inputSid").innerHTML="";
			for (var i = 0; i < types.length; i++) {
				var op=new Option(types[i].name,types[i].id);
				document.getElementById("inputSid").appendChild(op);
			}
            $("#inputSid").val('<%=book.getSid()%>');
		}
		//动态创建script元素
		//var script=document.createElement("script");
		//script.src="findAllBigType";
		//document.body.appendChild(script);
		$.ajax({
			url:"findAllBigType",
			dataType:"jsonp",
			jsonpCallback:"fillSel"
			});
		//给大类change
		$("#inputBid").change(function() {
			$.ajax({
				url:"findAllSmallType",
				dataType:"jsonp",
				data:"bid="+$(this).val(),
				jsonpCallback:"fillSmallSel"
				});
		});
		
	</script>
	
	<!-- 一个Script标签只能拿一次数据 -->
	<!-- <script type="text/javascript" src="findAllBigType"></script> -->
	<script type="text/javascript">
	$('#inputCbDate').datepicker({
		format: 'yyyy-mm-dd',
		language: 'zh-CN',
		autoclose: true,
		defaultViewDate:{
			year:new Date().getFullYear()-18
			}
		});
	
	</script>
</body>
</html>





























