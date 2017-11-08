<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<title>邀请码 - {$config["appName"]}</title>
	<link href="/backend/css/base.min.css" rel="stylesheet">
	<link href="/backend/css/project.min.css" rel="stylesheet">
	<link href="/backend/css/font.css" rel="stylesheet" />
</head>
<body class="page-brand">
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
				</div>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="card">
					<div class="card-main">
						<div class="card-inner">
							<div style="color:red; font-size:16px; font-weight:bold">点击下方链接即可进入注册页面</div>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-main">
						<div class="card-inner margin-bottom-no">
							<div class="card-table">
								<div class="table-responsive">
									<table class="table">
										<tbody>
											{foreach $codes as $code}
											<tr>
												<td>#{$code->id}</td>
												<td><a href="/auth/register?code={$code->code}">{$code->code}</a></td>
												<td>可用</td>
											</tr>
											{/foreach}
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
{include file='footer.tpl'}