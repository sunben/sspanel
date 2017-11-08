<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#f44336">
	<title>管理面板 - {$config["appName"]}</title>
	<link href="/backend/css/admin/base.css" rel="stylesheet">
	<link href="/backend/css/admin/project.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="//cdn.staticfile.org/material-design-lite/1.1.0/material.min.css" rel="stylesheet">
	<link href="//cdn.staticfile.org/datatables/1.10.13/css/dataTables.material.min.css" rel="stylesheet">
</head>
<body class="page-red">
	<header class="header header-red header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<div>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">menu</span>
				</a>
			</div>
		</ul>
	</header>
	<nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">
				<div class="menu-logo">管理面板</div>
				<ul class="nav">
					<li><a href="/admin">系统概览</a></li>
<!--
					<li><a href="/admin/user">用户列表</a></li>
					<li><a href="/admin/node">节点列表</a></li>
-->
					<li><a href="/admin/trafficlog">流量记录</a></li>
					<li><a href="/admin/shop">套餐列表</a></li>
					<li><a href="/admin/bought">购买记录</a></li>
					<li><a href="/admin/invite">推广链接</a></li>
					<li><a href="/admin/code">充值代码</a></li>
					<li><a href="/admin/coupon">优惠代码</a></li>
					<li><a href="/user">用户中心</a></li>
				</ul>
			</div>
		</div>
	</nav>