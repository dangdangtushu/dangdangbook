<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<!-- 1告诉浏览器不要缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 2css -->
<!--<link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />-->
<link rel="stylesheet" type="text/css" id="themeLink"/>
<!-- 
	通常情况下JavaScript设置body结束标签之前，但是这里要避免二次绘制，需要提前到这里
 -->
<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
<script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
<script type="text/javascript">
//这里切记不要等到文档加载完毕，如果等到文档加载完毕还是两次绘制，不要$(function(){})
	if ($.cookie("bootstarpTheme")) {//如果用户已经设置过主题，就用它设置的
		$("#themeLink").attr("href","bower_components/bootswatch/dist/"+$.cookie("bootstarpTheme")+"/bootstrap.css");

	} else {//如果没有设置过，就用默认
		$("#themeLink").attr("href","bower_components/bootswatch/dist/united/bootstrap.css");
	}
	
</script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="#">Home</a>
					</li>
					<li class="breadcrumb-item">
						<a href="#">Library</a>
					</li>
					<li class="breadcrumb-item active">
						Data
					</li>
					<li>
					  	<a class="nav-link" href="javascript:void(0)">
							更换主题：
							<select id="themeSel" class="custom-select">
								<option>united</option>
								<option>lux</option>
								<option>pulse</option>
								<option>yeti</option>
							</select>
						</a>
					</li>
				</ol>
			</nav>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="carousel slide" id="carousel-344417">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-344417" class="active">
					</li>
					<li data-slide-to="1" data-target="#carousel-344417">
					</li>
					<li data-slide-to="2" data-target="#carousel-344417">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
						<div class="carousel-caption">
							<h4>
								First Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="carousel-control-prev" href="#carousel-344417" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-344417" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			 
			<button type="button" class="btn btn-success">
				Button
			</button>
		</div>
	</div>
</div>
<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function() {
        $("#themeSel").val($.cookie("bootstarpTheme"));
		$("#themeSel").change(function(evt){
			$("#themeLink").attr("href","bower_components/bootswatch/dist/"+$(evt.target).val()+"/bootstrap.css");
			$.cookie("bootstrapTheme",$(evt.target).val(),{expires: 30});
			});
		
	});
</script>
</body>
</html>































