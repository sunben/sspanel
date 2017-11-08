<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<title>账户充值 - {$config["appName"]}</title>
	<link href="/backend/css/base.min.css" rel="stylesheet">
	<link href="/backend/css/project.min.css" rel="stylesheet">
	<link href="/backend/css/font.css" rel="stylesheet">
</head>
<body>
	<main class="content">
		<div class="col-md-10 col-sm-12 col-md-push-1">
			<section class="content-inner margin-top-no">
				<div class="card margin-bottom-no">
					<div class="card-main">
						<div class="card-inner">
							<div class="card-inner">
								<p style="font-size:18px">您的账户余额：<code style="font-size:20px">{$user->money}</code> 元，可在下方自主购买充值券充值或联系QQ充值（支付宝、微信、QQ）</p>
								<div class="form-group form-group-label">
									<div class="row">
										<div class="col-md-4">
											<label class="floating-label" for="code">输入充值券</label>
											<input class="form-control" id="code" type="text">
										</div>
										<div class="col-md-4">
											<button class="btn btn-green waves-attach" id="code-update" >立即充值</button>　<a href="发卡平台" target="_blank"><button class="btn btn-red waves-attach">没有充值码？前往购买</button></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				{if $pmw!=''}
				<div class="card margin-bottom-no">
					<div class="card-main">
						<div class="card-inner">
							<div class="card-inner">{$pmw}</div>
						</div>
					</div>
				</div>
				{/if}
				<div class="card margin-bottom-no">
					<div class="card-main">
						<div class="card-inner">
							<div class="card-inner">
								<div class="card-table">
									<div class="table-responsive">
										{$codes->render()}
										<table class="table table-hover">
											<tr>
												<th>###</th>
												<th>充值代码</th>
												<th>充值金额</th>
												<th>充值时间</th>
											</tr>
											{foreach $codes as $code}
											{if $code->type!=-2}
											<tr>
												<td>#{$code->id}</td>
												<td>{$code->code}</td>
												{if $code->type==-1}<td>{$code->number}元</td>{/if}
												<td>{$code->usedatetime}</td>
											</tr>
											{/if}
											{/foreach}
										</table>
										{$codes->render()}
									</div>
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
		$("#code-update").click(function () {
			$.ajax({
				type: "POST",
				url: "code",
				dataType: "json",
				data: {
					code: $("#code").val()
				},
				success: function (data) {
					if (data.ret) {
						$("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
					} else {
						$("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
					}
				},
				error: function (jqXHR) {
					$("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
				}
			})
		})
	timestamp = {time()}; 
	function f(){
		$.ajax({
			type: "GET",
			url: "code_check",
			dataType: "json",
			data: {
				time: timestamp
			},
			success: function (data) {
				if (data.ret) {
					clearTimeout(tid);
					$("#result").modal();
					$("#msg").html("充值成功！");
					window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
				}
			}
		});
		tid = setTimeout(f, 1000);
	}
	setTimeout(f, 1000);
})
</script>