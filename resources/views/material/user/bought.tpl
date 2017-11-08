<!DOCTYPE html>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<title>购买记录 - {$config["appName"]}</title>
	<link href="/backend/css/base.min.css" rel="stylesheet">
	<link href="/backend/css/project.min.css" rel="stylesheet">
	<link href="/backend/css/font.css" rel="stylesheet">
</head>
<body class="page-orange">
	<main class="content">
		<div class="col-md-10 col-sm-12 col-md-push-1">
			<section class="content-inner margin-top-no">
				<div class="table-responsive">
					{$shops->render()}
					<table class="table">
						<tr>
							<th>###</th>
							<th>商品名称</th>
							<th>内容</th>
							<th>价格</th>
							<th>续费时间</th>
							<th></th>
						</tr>
						{foreach $shops as $shop}
						<tr>
							<td>#{$shop->id}</td>
							<td>{$shop->shop()->name}</td>
							<td>{$shop->shop()->content()}</td>
							<td>{$shop->price} 元</td>
							{if $shop->renew==0}<td>不续费</td>{else}<td>在{$shop->renew_date()}续费</td>{/if}
							<td><a class="btn btn-brand" {if $shop->renew==0}disabled{else} href="javascript:void(0);" onClick="delete_modal_show('{$shop->id}')"{/if}>退订</a></td>
						</tr>
						{/foreach}
					</table>
					{$shops->render()}
				</div>
				<div aria-hidden="true" class="modal modal-va-middle fade" id="delete_modal" role="dialog" tabindex="-1">
					<div class="modal-dialog modal-xs">
						<div class="modal-content">
							<div class="modal-heading">
								<h2 class="modal-title">确认退订？</h2>
							</div>
							<div class="modal-footer">
								<p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="delete_input" type="button">确定</button><button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal" type="button">取消</button></p>
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
function delete_modal_show(id) {
	deleteid=id;
	$("#delete_modal").modal();
}
$(document).ready(function(){
	function delete_id(){
		$.ajax({
			type:"DELETE",
			url:"/user/bought",
			dataType:"json",
			data:{
				id: deleteid
			},
			success:function(data){
				if(data.ret){
					$("#result").modal();
					$("#msg").html(data.msg);
					window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
				}else{
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error:function(jqXHR){
				$("#result").modal();
				$("#msg").html(data.msg+"  发生错误了!");
			}
		});
	}
	$("#delete_input").click(function(){
		delete_id();
	});
})
</script>