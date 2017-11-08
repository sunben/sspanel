<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#ff9800">
	<title>推广记录 - {$config["appName"]}</title>
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
								<p class="card-heading">推广记录</p>
								<div class="card-table">
									<div class="table-responsive">
										{$paybacks->render()}
										<table class="table">
											<thead>
												<tr>
													<th>###</th>
													<th>推广用户</th>
													<th>返利金额</th>
												</tr>
											</thead>
											<tbody>
												{foreach $paybacks as $payback}
												<tr>
													<td><b>{$payback->id}</b></td>
													{if $payback->user()!=null}<td>{$payback->user()->user_name}</td>{else}<td>已注销</td>{/if}
													<td>{$payback->ref_get}元</td>
												</tr>
												{/foreach}
											</tbody>
										</table>
										{$paybacks->render()}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
{include file='user/footer.tpl'}