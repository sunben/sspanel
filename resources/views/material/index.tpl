<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>{$config["appName"]} - 世界那么大，抓紧去看看！</title>
	<link href="/frontend/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/frontend/css/styles.css" rel="stylesheet" />
	<link href="/frontend/css/animate.css" rel="stylesheet" />
	<link href="/frontend/css/common.css" rel="stylesheet" />
	<link href="/frontend/css/NeWorld.css" rel="stylesheet" />
	<link href="/frontend/css/font.css" rel="stylesheet" />
	<script src="/frontend/js/jquery.min.js"></script>
	<link href="/favicon.ico" rel="shortcut icon" />
	<link href="/favicon.png" rel="apple-touch-icon" sizes="114x114" />
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body class="nowhmcs">
	<header>
		<div class="wave-wrap">
			<div class="container">
				<nav class="navbar navbar-inverse nav-home">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse" aria-expanded="false">
						<label class="ac-gn-menuicon-label">
							<span class="ac-gn-menuicon-bread ac-gn-menuicon-bread-top">
								<span class="ac-gn-menuicon-bread-crust ac-gn-menuicon-bread-crust-top"></span>
							</span>
							<span class="ac-gn-menuicon-bread ac-gn-menuicon-bread-bottom">
								<span class="ac-gn-menuicon-bread-crust ac-gn-menuicon-bread-crust-bottom"></span>
							</span>
						</label>
					</button>
					<div class="navbar-header">
						<a class="navbar-brand" href="/">维奇加速</a>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/">网站首页</a></li>
							<li ><a href="http://wpa.qq.com/msgrd?v=3&uin=你的QQ&site=qq&menu=yes" target="_blank">在线客服</a></li>
							{if $user->isLogin}
							<li><a href="/user" class="btn btn-border">用户中心</a></li>
							{else}
							<li><a href="/auth/login">用户登录</a></li>
							<li><a href="/auth/register" class="btn btn-border">注册</a></li>
							{/if}
						</ul>
					</div>
				</nav>
				<div class="home-slider space3x">
					<div class="col-sm-6 col-md-5">
						<h2 class="wow fadeInDown">畅游世界，梯子护航</h2>
						<p class="wow fadeInDown">A secure socks5 proxy , designed to protect your Internet traffic.</p>
						<a href="/auth/register" class="btn btn-success btn-success2">立即注册</a>
					</div>
				</div>
			</div>
		</div>
	</header>
	<section class="home-pricing space">
		<div class="container">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 text-center">
					<h2 class="title-head">多种套餐供您选择</h2>
					<p class="desc">精选CN2线路，三网直连国内，按需选择，即刻加速！</p>
				</div>
			</div>
			<div class="empty_space" style="height: 30px"></div>
			<div class="pricing">
				<ul class="pricing-list">
					<li class="wow slideInLeft">
						<div class="package text-center">
							<div class="top">
								<h3>标准套餐</h3><h5>试用</h5>
							</div>
							<div class="info">
								<h4><span class="package-price">1 &yen;</span></h4>
								<p>试用流量 <strong>1GB</strong></p>
								<p>可用时间 <strong>24小时</strong></p>
								<p>高速线路 <strong>6条</strong></p>
								<p>UDP 支持</p>
							</div>
							<div class="btm"><a href="/auth/register" class="btn btn-border btn-block">立即购买</a></div>
						</div>
					</li>
					<li class="wow slideInLeft">
						<div class="package text-center">
							<div class="top">
								<h3>标准套餐</h3><h5>月付</h5>
							</div>
							<div class="info">
								<h4><span class="package-price">10 &yen;</span></h4>
								<p>每月流量 <strong>30GB</strong></p>
								<p>可用时间 <strong>30天</strong></p>
								<p>高速线路 <strong>6条</strong></p>
								<p>UDP 支持</p>
							</div>
							<div class="btm"><a href="/auth/register" class="btn btn-border btn-block">立即购买</a></div>
						</div>
					</li>
					<li class="wow slideInRight">
						<div class="package text-center">
							<div class="top">
								<h3>标准套餐</h3><h5>季付</h5>
							</div>
							<div class="info">
								<h4><span class="package-price">50 &yen;</span></h4>
								<p>每月流量 <strong>100GB</strong></p>
								<p>可用时间 <strong>90天</strong></p>
								<p>高速线路 <strong>9条</strong></p>
								<p>UDP 支持</p>
							</div>
							<div class="btm"><a href="/auth/register" class="btn btn-border btn-block">立即购买</a></div>
						</div>
					</li>
					<li class="wow slideInRight">
						<div class="package text-center">
							<div class="top">
								<h3>标准套餐</h3><h5>年付</h5>
							</div>
							<div class="info">
								<h4><span class="package-price">170 &yen;</span></h4>
								<p>每月流量 <strong>100GB</strong></p>
								<p>可用时间 <strong>365天</strong></p>
								<p>高速线路 <strong>9条</strong></p>
								<p>UDP 支持</p>
							</div>
							<div class="btm"><a href="/auth/register" class="btn btn-border btn-block">立即购买</a></div>
						</div>
					</li>
				</ul>
				<p class="tos text-center">购买产品 表示 同意遵守 LaiGeTiZi's <a href="/tos" target="_blank">服务条款</a></p>
			</div>
		</div>
	</section>
	<section class="slider-1 space">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<h2>快速 稳定 简单 安全</h2>
					<p>支持手机电脑平板路由器多终端同時在线，安全畅游CN2极速网络。<br>世界那么大，抓紧去看看！</p>
				</div>
			</div>
		</div>
	</section>
	<section class="home-features space2x">
		<div class="container text-center">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<h2 class="title-head">为什么选择我们？</h2>
					<p class="desc">我们有足够多的理由让您相信我们的服务值得信赖</p>
				</div>
			</div>
			<div class="empty_space" style="height: 30px"></div>
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="main">
						<img class="theme-gray size-lg mb1 wow zoomIn" src="/frontend/img/icons/icon-volumes.svg" />
						<h3>天下武功，唯快不破</h3>
						<p>精选针对国内网络优化CN2线路，节点覆盖美国、日本、香港、新加坡等地，让您的网络如虎添翼。</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="main">
						<img class="theme-gray size-lg mb1 wow zoomIn" src="/frontend/img/icons/recovery.svg" alt="">
						<h3>智能分流，轻盈飘逸</h3>
						<p>支持智能分流，自动识别并选择是否加速，同時国内网站不受任何影响，无时不刻地轻轻守护着您。</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="main">
						<img class="theme-gray size-lg mb1 wow zoomIn" src="/frontend/img/icons/drive.svg" alt="">
						<h3>隐私承诺，绝不动摇</h3>
						<p>来个梯子支持自定义加密方式、协议和混淆，因此使用本站服务还会让您的网络环境变得更加安全。</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="main">
						<img class="theme-gray size-lg mb1 wow zoomIn" src="/frontend/img/icons/template.svg" alt="">
						<h3>自动开通，极速支持</h3>
						<p>支持自助下单、自动开通，免去沟通的烦恼。我们有专业的客服团队在最短的时间内解决您的疑问。</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="slider-2 space2x text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<h2>试用套餐低至1元！还在犹豫什么？抓紧试一试吧！</h2>
					<p>如果您还有其他疑问，欢迎随时联系我们。</p>
					<a href="/auth/register" class="btn btn-success">立即试用</a>　<a href="http://wpa.qq.com/msgrd?v=3&uin=你的QQ&site=qq&menu=yes" target="_blank" class="btn btn-success">联系客服</a>
				</div>
			</div>
		</div>
	</section>
	<footer class="space2x">
		<div class="container">
			<a class="navbar-brand" href="/">SSv7.com</a>
			<p>2017 &copy; SSv7.com. 保留所有权利</p>
		</div>
	</footer>
	<script src="/frontend/js/bootstrap.min.js"></script>
	<script src="/frontend/js/wow.min.js"></script>
	<script src="/frontend/js/jquery.zclip.js"></script>
	<script src="/frontend/js/whmcs.js"></script>
</body>
</html>