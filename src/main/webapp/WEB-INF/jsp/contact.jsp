<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<title>Black &amp; White</title>
<%@include file="../jsp/base/web.jsp"%>
<!-- meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=$root%>/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="<%=$root%>/css/simdtor/simditor.css" />
<link rel="stylesheet" type="text/css" href="<%=$root%>/css/font-awesome.css" />
<script type="text/javascript" src="<%=$root%>/js/simdtor/jquery.min.js"></script>
<script type="text/javascript" src="<%=$root%>/js/simdtor/mobilecheck.js"></script>
</head>
<body id="page">
	<div class="container">
		<header id="site-header">
			<div class="row">
				<div class="col-md-4 col-sm-5 col-xs-8">
					<div class="logo">
						<h1>
							<a href="index.html"><b>Black</b> &amp; White</a>
						</h1>
					</div>
				</div>
				<!-- col-md-4 -->
				<div class="col-md-8 col-sm-7 col-xs-4">
					<nav class="main-nav" role="navigation">
						<div class="navbar-header">
							<button type="button" id="trigger-overlay" class="navbar-toggle">
								<span class="ion-navicon"></span>
							</button>
						</div>

						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right">
								<li class="cl-effect-11"><a href="<%=$root%>/"
									data-hover="Home">Home</a></li>
								<li class="cl-effect-11"><a href="full-width.html"
									data-hover="Blog">Blog</a></li>
								<li class="cl-effect-11"><a href="about.html"
									data-hover="About">About</a></li>
								<li class="cl-effect-11"><a href="contact.html"
									data-hover="Contact">Contact</a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</nav>
					<div id="header-search-box">
						<a id="search-menu" href="#"><span id="search-icon"
							class="ion-ios-search-strong"></span></a>
						<div id="search-form" class="search-form">
							<form role="search" method="get" id="searchform" action="#">
								<input type="search" placeholder="Search" required>
								<button type="submit">
									<span class="ion-ios-search-strong"></span>
								</button>
							</form>
						</div>
					</div>
				</div>
				<!-- col-md-8 -->
			</div>
		</header>
	</div>

	<div class="content-body">
		<div class="container">
			<div class="row">
				<main class="col-md-12"> <!-- <h1 class="page-title">Contact</h1> -->
				<article class="post">
					<div class="entry-content clearfix">
						<form action="#" method="post" class="contact-form">
							<div class="row">
								<div class="col-md-11 col-md-offset-1">
									<input type="text" name="title" placeholder="标题" required autofocus>
									<input type="text" name="tag" placeholder="标签（可以使用','隔开）">
									<textarea id="editor" placeholder="这里输入内容" data-autosave="editor-content" required></textarea>
									<button class="btn-send btn-5 btn-5b ion-ios-paperplane">
										<span>Drop Me a Line</span>
									</button>
								</div>
							</div>
							<!-- row -->
						</form>
					</div>
				</article>
				</main>
			</div>
		</div>
	</div>
	<footer id="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<p class="copyright">&copy; 2014 ThemeWagon.com</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- Mobile Menu -->
	<div class="overlay overlay-hugeinc">
		<button type="button" class="overlay-close">
			<span class="ion-ios-close-empty"></span>
		</button>
		<nav>
			<ul>
				<li><a href="index.html">Home</a></li>
				<li><a href="full-width.html">Blog</a></li>
				<li><a href="about.html">About</a></li>
				<li><a href="contact.html">Contact</a></li>
			</ul>
		</nav>
	</div>
</body>
<script src="<%=$root%>/js/blog/script.js"></script>
<script type="text/javascript" src="<%=$root%>/js/simdtor/module.js"></script>
<script type="text/javascript" src="<%=$root%>/js/simdtor/uploader.js"></script>
<script type="text/javascript" src="<%=$root%>/js/simdtor/hotkeys.js"></script>
<script type="text/javascript" src="<%=$root%>/js/simdtor/simditor.js"></script>
<script type="text/javascript" src="<%=$root%>/js/simdtor/page-doc.js"></script>
<script type="text/javascript">
	var editor = new Simditor({
		textarea : $('#editor')
	});
</script>
</html>
