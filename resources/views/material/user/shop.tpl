<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#ff9800">
	<title>套餐列表 - {$config["appName"]}</title>
	<link href="/backend/css/base.min.css" rel="stylesheet">
	<link href="/backend/css/project.min.css" rel="stylesheet">
	<link href="/backend/css/font.css" rel="stylesheet">
</head>
<body class="page-orange">
	<main class="content">
		<div class="col-md-10 col-sm-12 col-md-push-1">
			<section class="content-inner margin-top-no">
				<hr />
				<div align="center" style="font-weight:bold; font-size:18px"><p>====== 您的当前账户余额为 <code style="font-size:18px">{$user->money}</code> 元，余额不足时请<a href="/user/code" target="_blank" style="color:blue">点此充值</a> ======</p></div>
				<div align="center" style="font-weight:bold; color:red">（为保证服务质量，游戏线路仅限季付或年付套餐用户使用）</div>
				<div class="table-responsive">
					{$shops->render()}
					<table class="table ">
                        <thead>
							<tr>
								<th>序号</th>
								<th>套餐名称</th>
								<th>套餐价格</th>
								<th>套餐内容</th>
								<th>续费重置流量</th>
								<th>购买</th>
							</tr>
						</thead>
						<tbody>
							{foreach $shops as $shop}
							<tr>
								<td>NO.{$shop->id}</td>
								<td>{$shop->name}</td>
								<td>{$shop->price} 元</td>
								<td>{$shop->content()}</td>
								{if $shop->auto_reset_bandwidth==0}<td>不重置</td>{else}<td>自动重置</td>{/if}
								<td><a class="btn btn-green" href="javascript:void(0);" onClick="buy('{$shop->id}',{$shop->auto_renew},{$shop->auto_reset_bandwidth})">购买</a></td>
							</tr>
                            {/foreach}
						</tbody>
                    </table>
					{$shops->render()}
				</div>
				<div aria-hidden="true" class="modal modal-va-middle fade" id="coupon_modal" role="dialog" tabindex="-1">
					<div class="modal-dialog modal-xs">
						<div class="modal-content">
							<div class="modal-heading">
								<a class="modal-close" data-dismiss="modal">×</a>
								<h2 class="modal-title">您有优惠码吗？</h2>
							</div>
							<div class="modal-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="coupon">有的话，请在这里输入。没有的话，直接下一步吧！</label>
									<input class="form-control" id="coupon" type="text">
								</div>
							</div>
							<div class="modal-footer">
								<p class="text-right"><button class="btn btn-flat btn-brand waves-attach" data-dismiss="modal" id="coupon_input" type="button">下一步</button></p>
							</div>
						</div>
					</div>
				</div>
				<div aria-hidden="true" class="modal modal-va-middle fade" id="order_modal" role="dialog" tabindex="-1">
					<div class="modal-dialog modal-xs">
						<div class="modal-content">
							<div class="modal-heading">
								<a class="modal-close" data-dismiss="modal">×</a>
								<h2 class="modal-title">订单确认</h2>
							</div>
							<div class="modal-inner">
								<p id="name">套餐名称：</p>
								<p id="credit">优惠额度：</p>
								<p id="total">总金额：</p>
								<p id="auto_reset" style="color:red">新套餐会取代旧套餐，套餐不会叠加，切勿重复购买！</p>
								<div class="checkbox switch" id="autor">
									<label for="autorenew">
										<input checked class="access-hide" id="autorenew" type="checkbox"><span class="switch-toggle"></span>自动续费
									</label>
								</div>
							</div>
							<div class="modal-footer">
								<p class="text-right"><button class="btn btn-flat btn-brand waves-attach" data-dismiss="modal" id="order_input" type="button">确认支付</button></p>
							</div>
						</div>
					</div>
				</div>
				{include file='dialog.tpl'}
		</div>
	</main>
{include file='user/footer.tpl'}
<script>
function buy(id,auto,auto_reset) {
	auto_renew=auto;
	if(auto==0)
	{
		document.getElementById('autor').style.display="none";
	}
	else
	{
		document.getElementById('autor').style.display="";
	}
	if(auto_reset==0)
	{
		document.getElementById('auto_reset').style.display="none";
	}
	else
	{
		document.getElementById('auto_reset').style.display="";
	}
	shop=id;
	$("#coupon_modal").modal();
}
$("#coupon_input").click(function () {
		$.ajax({
			type: "POST",
			url: "coupon_check",
			dataType: "json",
			data: {
				coupon: $("#coupon").val(),
				shop: shop
			},
			success: function (data) {
				if (data.ret) {
					$("#name").html("商品名称："+data.name);
					$("#credit").html("优惠额度："+data.credit);
					$("#total").html("总金额："+data.total);
					$("#order_modal").modal();
				} else {
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error: function (jqXHR) {
				$("#result").modal();
                $("#msg").html(data.msg+"  发生了错误！");
			}
		})
	});
$("#order_input").click(function () {
		if(document.getElementById('autorenew').checked)
		{
			var autorenew=1;
		}
		else
		{
			var autorenew=0;
		}	
		$.ajax({
			type: "POST",
			url: "buy",
			dataType: "json",
			data: {
				coupon: $("#coupon").val(),
				shop: shop,
				autorenew: autorenew
			},
			success: function (data) {
				if (data.ret) {
					$("#result").modal();
					$("#msg").html(data.msg);
					window.setTimeout("location.href='/user/shop'", {$config['jump_delay']});
				} else {
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error: function (jqXHR) {
				$("#result").modal();
                $("#msg").html(data.msg+"  发生了错误！");
			}
		})
	});
</script>