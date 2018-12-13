<%--
	if( session.getAttribute("hasLogined")==null||!(Boolean) session.getAttribute("hasLogined")){//没有登录
		response.sendRedirect("login.jsp");
		return;
	}
--%>
<%@page import="com.oraclewdp.ddbookmarket.model.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书籍列表</title>
<!-- 1告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 2css -->
<!--<link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />-->
	<link rel="stylesheet" type="text/css" href="bower_components/fontawesome/web-fonts-with-css/css/fontawesome-all.css">
<link rel="stylesheet" type="text/css" id="themeLink" />
<!-- 
	通常情况下JavaScript设置body结束标签之前，但是这里要避免二次绘制，需要提前到这里
 -->
<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
<script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
<script type="text/javascript">
	//这里切记不要等到文档加载完毕，如果等到文档加载完毕还是两次绘制，不要$(function(){})
	if ($.cookie("bootstarpTheme")) {//如果用户已经设置过主题，就用它设置的
		$("#themeLink").attr(
				"href",
				"bower_components/bootswatch/dist/"
						+ $.cookie("bootstarpTheme") + "/bootstrap.css");
		$("#themeSel").val($.cookie("bootstarpTheme"));
	} else {//如果没有设置过，就用默认
		$("#themeLink").attr("href",
				"bower_components/bootswatch/dist/united/bootstrap.css");
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item"><a href="#">Library</a></li>
						<li class="breadcrumb-item active">Data</li>
						<li><a class="nav-link" href="javascript:void(0)"> 更换主题： <select id="themeSel"
																								  class="custom-select">
						<option>united</option>
						<option>lux</option>
						<option>pulse</option>
						<option>yeti</option>
						<option>cerulean</option>
					</select>
					</a></li>
						<li class="nav-item dropdown">
							<a class="nav-link fa fa-window-close" href="exit.jsp" id="navbarDropdownMenuLink" title="下班回家">
								退出
							</a>
						</li>

					</ol>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card border-success">
				
					<div class="card-header">
					
						<form class="form-inline" action="bookList" method="post" id="searchFrm">
							<label class="sr-only" for="inputName">书名</label> 
							<input type="text" class="form-control mb-2 mr-sm-2" id="inputName" placeholder="书名" name="name" value="<%=request.getParameter("name")==null?"":request.getParameter("name")%>">
							<label class="sr-only" for="inlineFormInputGroupUsername2">大类</label>
							<div class="input-group mb-2 mr-sm-2">
								<select class="form-control" id="inputBid" name="bid">
									<option value="-1">---请选择---</option>
								</select>
							</div>
							<label class="sr-only" for="inlineFormInputGroupUsername2">小类</label>
							<div class="input-group mb-2 mr-sm-2">
								<select class="form-control" id="inputSid" name="sid">
									<option value="-1">---请选择---</option>
								</select>
							</div>

							<button type="submit" class="btn btn-primary mb-2">搜索</button>
						</form>
					</div>
					
					<div class="card-body" style="padding: 0px;">
						<div class="col-md-12" style="padding: 0px;">
							<table class="table table-condensed table-bordered table-hover" style="margin-bottom: 0px ">
								<thead>
									<tr>
										<th>#</th>
										<th>书名</th>
										<th>价格</th>
										<th>作者</th>
										<th>出版社</th>
										<th>出版时间</th>
										<th>简介</th>
										<th>小类</th>
										<th>图片</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<%
										List<Book> ls = (List<Book>) request.getAttribute("ls");
									if(ls!=null){
										for (Book book : ls) {
									%>
									<tr>
										<td><%=book.getId()%></td>
										<td><%=book.getName()%></td>
										<td><%=book.getPrice()%></td>
										<td><%=book.getAuthor()%></td>
										<td><%=book.getCbs()%></td>
										<td><%=book.getCbDate()%></td>
										<td style="max-width: 300px"><%=book.getDescri()%></td>
										<td><%=book.getSid()%></td>
										<td><img src="upload/<%=book.getPhoto()%>"></td>
										<td>
											<a href="#modal-container-385680" data-toggle="modal" onclick="window.delId='<%=book.getId()%>'" class="fa fa-trash fa-1x " title="删除"></a>
											&nbsp;&nbsp;&nbsp;
											<a class="fa fa-edit fa-1x" title="修改" href="toBookEdit?id=<%=book.getId()%>"></a>
										</td>
									</tr>
									<%
										}
									}else{
										%>
										<tr>
											<td colspan="9">无数据</td>
										</tr>
										<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
					<!-- card footer -->
					<div class="card-footer" style="padding:0px">
						<nav>
							<ul class="pagination" style="margin-bottom: 0px;">
								<%
									//获取总页数
									int totalPage = (Integer) request.getAttribute("totalPage");
									//获取当前页
									int currentPage = (Integer) request.getAttribute("currentPage");
									//如果是第一页，点击没有效果；否则当前页减1
									if (currentPage == 1) {
								%>
								<li class="page-item disabled"><a class="page-link" href="#">上一页</a></li>
								<%
									} else {
								%>
								<li class="page-item"><a class="page-link"
									href="bookList?currentPage=<%=currentPage - 1%>">上一页</a></li>
								<%
									}
								%>

								<!-- 1)如果总页数totalPage<=5
															   有几页就显示几页
															2）否则
															   2.1 如果currentPage<=3
															      显示：
																       1 2 3 4 ...totalPage
															   2.2 否则 如果 currentPage<=totalPage-3
															       1...   currentPage-1 currentPage currentPage+1 ...totalPage
															   2.3 否则 
															       1...               totalPage-3 totalPage-2 totalPage-1 totalPage
													 -->
								<%
									if (totalPage <= 5) {//总页数<=5
										for (int i = 1; i <= totalPage; i++) {
								%>
								<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=i%>"><%=i%></a></li>
								<%
									}
									} else if (currentPage <= 3) {//当前页数<=3
								%>
								<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1</a></li>
								<li class="page-item"><a class="page-link" href="bookList?currentPage=2">2</a></li>
								<li class="page-item"><a class="page-link" href="bookList?currentPage=3">3</a></li>
								<li class="page-item"><a class="page-link" href="bookList?currentPage=4">4</a></li>
								<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>">...<%=totalPage%></a></li>
								<%
									} else if (currentPage <= totalPage - 3) {//当前页数<=总页数-3
								%>
								<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1...</a></li>
								<li class="page-item"><a class="page-link"
									href="bookList?currentPage=<%=currentPage - 1%>"><%=currentPage - 1%></a></li>
								<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage%>"><%=currentPage%></a></li>
								<li class="page-item"><a class="page-link"
									href="bookList?currentPage=<%=currentPage + 1%>"><%=currentPage + 1%></a></li>
								<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>">...<%=totalPage%></a></li>
								<%
									} else {
								%>
								<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1...</a></li>
								<li class="page-item"><a class="page-link"
									href="bookList?currentPage=<%=totalPage - 3%>"><%=totalPage - 3%></a></li>
								<li class="page-item"><a class="page-link"
									href="bookList?currentPage=<%=totalPage - 2%>"><%=totalPage - 2%></a></li>
								<li class="page-item"><a class="page-link"
									href="bookList?currentPage=<%=totalPage - 1%>"><%=totalPage - 1%></a></li>
								<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>"><%=totalPage%></a></li>
								<%
									}
								%>

								<!-- 如果是最后一页，点击没有效果；否则当前页加1 -->
								<%
									if (currentPage == totalPage) {
								%>
								<li class="page-item disabled"><a class="page-link" href="#">下一页</a></li>
								<%
									} else {
								%>
								<li class="page-item"><a class="page-link"
									href="bookList?currentPage=<%=currentPage + 1%>">下一页</a></li>
								<%
									}
								%>

							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">

				<button type="button" class="btn btn-success">Button</button>
			</div>
		</div>
	</div>
	<!-- 删除确认框 -->
	<div class="modal fade" id="modal-container-385680" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								删除确认
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							你真的要删除该条记录吗？
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" onclick="exeDel(event)">
								确认
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								取消
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#themeSel").change(
					function(evt) {
						$("#themeLink").attr(
								"href",
								"bower_components/bootswatch/dist/"
										+ $(evt.target).val()
										+ "/bootstrap.css");
						$.cookie("bootstrapTheme", $(evt.target).val(), {
							expires : 30
						});
					});
			
			//指示哪个是当前页
			$('a[href="bookList?currentPage=<%=currentPage%>"]').parent("li").addClass("active");
			
		});
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
			document.getElementById("inputSid").innerHTML='<option value="-1">---请选择---</option>';
			for (var i = 0; i < types.length; i++) {
				var op=new Option(types[i].name,types[i].id);
				document.getElementById("inputSid").appendChild(op);
			}
			$("#inputSid").val('<%=request.getAttribute("sid")%>');
		}
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
		//分页链接缺少表单的值
		$('a[class="page-link"][href^="bookList?currentPage="]').click(function () {
			$(this).attr("href",$(this).attr("href")+"&"+$("#searchFrm").serialize());
		});

		//删除确认
		function exeDel(event){
			window.location.href="bookDel?id="+window.delId;
		}
	</script>
</body>
</html>































