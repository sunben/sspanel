<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#ff9800">
	<title>资料编辑 - {$config["appName"]}</title>
	<link href="/backend/css/base.min.css" rel="stylesheet">
	<link href="/backend/css/project.min.css" rel="stylesheet">
	<link href="/backend/css/font.css" rel="stylesheet">
</head>
<body class="page-orange">
	<main class="content">
		<div class="col-md-10 col-sm-12 col-md-push-1">
			<section class="content-inner margin-top-no">
				<div class="card margin-bottom-no">
					<div class="card-main">
						<div class="card-inner">
							<div class="card-inner">
								<p class="card-heading">登录密码修改</p>
								<div class="form-group form-group-label">
									<label class="floating-label" for="oldpwd">当前密码</label>
									<input class="form-control" id="oldpwd" type="password">
								</div>
								<div class="form-group form-group-label">
									<label class="floating-label" for="pwd">新密码</label>
									<input class="form-control" id="pwd" type="password">
								</div>
								<div class="form-group form-group-label">
									<label class="floating-label" for="repwd">确认新密码</label>
									<input class="form-control" id="repwd" type="password">
								</div>
								<div class="form-group form-group-label">
									<button class="btn btn-green waves-attach" id="pwd-update">确认修改</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card margin-bottom-no">
					<div class="card-main">
						<div class="card-inner">
							<div class="card-inner">
								<p class="card-heading">连接密码修改</p>
								<p>当前连接密码：<code>{$user->passwd}</code></p>
								<div class="form-group form-group-label">
									<label class="floating-label" for="sspwd">新密码</label>
									<input class="form-control" id="sspwd" type="text">
								</div>
								<div class="form-group form-group-label">
									<button class="btn btn-green waves-attach" id="ss-pwd-update">确认修改</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card margin-bottom-no">
					<div class="card-main">
						<div class="card-inner">
							<div class="card-inner">
								<p class="card-heading">加密方式修改</p>
								<p>当前加密方式：<code>{$user->method}</code></p>
								<div class="form-group form-group-label">
									<label class="floating-label" for="method">加密方式</label>
									<select id="method" class="form-control">
										{$method_list = $config_service->getSupportParam('method')}
										{foreach $method_list as $method}
											<option value="{$method}" {if $user->method == $method}selected="selected"{/if}>[{if URL::CanMethodConnect($method) == 2}仅支持SS{else}支持SS/SSR{/if}] {$method}</option>
										{/foreach}
									</select>
								</div>
								<div class="form-group form-group-label">
									<button class="btn btn-green waves-attach" id="method-update">确认修改</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card margin-bottom-no">
					<div class="card-main">
						<div class="card-inner">
							<div class="card-inner">
								<p class="card-heading">协议及混淆修改</p>
								<p>当前协议：<code>{$user->protocol}</code></p>
								<div class="form-group form-group-label">
									<label class="floating-label" for="protocol">协议</label>
									<select id="protocol" class="form-control">
										{$protocol_list = $config_service->getSupportParam('protocol')}
										{foreach $protocol_list as $protocol}
											<option value="{$protocol}" {if $user->protocol == $protocol}selected="selected"{/if}>[{if URL::CanProtocolConnect($protocol) == 3}支持SS/SSR{else}仅支持SSR{/if}] {$protocol}</option>
										{/foreach}
									</select>
								</div>
							</div>
							<div class="card-inner">
								<p>当前混淆方式：<code>{$user->obfs}</code></p>
								<div class="form-group form-group-label">
									<label class="floating-label" for="obfs">混淆方式</label>
									<select id="obfs" class="form-control">
										{$obfs_list = $config_service->getSupportParam('obfs')}
										{foreach $obfs_list as $obfs}
											<option value="{$obfs}" {if $user->obfs == $obfs}selected="selected"{/if}>[{if URL::CanObfsConnect($obfs) >= 3}支持SS/SSR{else}{if URL::CanObfsConnect($obfs) == 1}仅支持SSR{else}仅支持SS{/if}{/if}] {$obfs}</option>
										{/foreach}
									</select>
								</div>
								<div class="form-group form-group-label">
									<button class="btn btn-green waves-attach" id="ssr-update">确认修改</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card margin-bottom-no">
					<div class="card-main">
						<div class="card-inner">
							<div class="card-inner">
								<p class="card-heading">连接端口修改</p>
								<p>当前连接端口：<code>{$user->port}</code></p>
								<div class="form-group form-group-label">
									<button class="btn btn-green waves-attach" id="portreset">重置端口</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			{include file='dialog.tpl'}
		</div>
	</main>
{include file='user/footer.tpl'}
<script>
    $(document).ready(function () {
        $("#portreset").click(function () {
            $.ajax({
                type: "POST",
                url: "resetport",
                dataType: "json",
                data: {
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误！");
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "password",
                dataType: "json",
                data: {
                    oldpwd: $("#oldpwd").val(),
                    pwd: $("#pwd").val(),
                    repwd: $("#repwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                         $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误！");
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#ssr-update").click(function () {
            $.ajax({
                type: "POST",
                url: "ssr",
                dataType: "json",
                data: {
                    protocol: $("#protocol").val(),
					obfs: $("#obfs").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误！");
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#ss-pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "sspwd",
                dataType: "json",
                data: {
                    sspwd: $("#sspwd").val()
                },
                 success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html("成功了");
                    } else {
                        $("#result").modal();
						$("#msg").html("失败了");
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误！");
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#method-update").click(function () {
            $.ajax({
                type: "POST",
                url: "method",
                dataType: "json",
                data: {
                    method: $("#method").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html("成功了");
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误！");
                }
            })
        })
    })
</script>