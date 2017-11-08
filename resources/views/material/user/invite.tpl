<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#ff9800">
	<title>推广获利 - {$config["appName"]}</title>
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
								<p style="font-size:18px">当前您还可以生成 <code style="font-size:18px">{$user->invite_num}</code> 个推广链接，当他人通过您的推广链接注册后您可获得其 10% 的充值提成！<a href="/user/profile" target="_blank">点击查看推广记录</a></p>
								{if $user->invite_num }
								<div class="form-group form-group-label">
									<button id="invite" class="btn btn-green waves-attach">生成专属推广链接</button>
								</div>
								{/if}
							</div>
						</div>
					</div>
				</div>
				<div class="card margin-bottom-no">
					<div class="card-main">
						<div class="card-inner">
							<div class="card-table">
								<div class="table-responsive">
								{$codes->render()}
									<table class="table">
										<thead>
										<tr>
											<th>###</th>
											<th>推广链接（点右键复制链接地址）</th>
											<th>状态</th>
										</tr>
										</thead>
										<tbody>
										{foreach $codes as $code}
											<tr>
												<td><b>{$code->id}</b></td>
												<td><a href="/auth/register?code={$code->code}" target="_blank">https://www.52yao.net/auth/register?code={$code->code}</a>
												</td>
												<td>可用</td>
											</tr>
										{/foreach}
										</tbody>
									</table>
								{$codes->render()}
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
        $("#invite").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/invite",
                dataType: "json",
                success: function (data) {
                    window.location.reload();
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>