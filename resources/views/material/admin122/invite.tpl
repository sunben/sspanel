{include file='admin/main.tpl'}
<main class="content">
	<div class="content-header ui-content-header"></div>
	<div class="container">
		<section class="content-inner margin-top-no">
			<div class="card">
				<div class="card-main">
					<div class="card-inner">
						<p>推广链接</p>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-main">
					<div class="card-inner">
						<div class="form-group form-group-label" style="display:none">
							<label class="floating-label" for="prefix">邀请码前缀</label>
							<input class="form-control" id="prefix" type="text">
						</div>
						<div class="form-group form-group-label">
							<label class="floating-label" for="uid">推广链接类别（0为公开，其他数字为对应用户的ID）</label>
							<input class="form-control" id="uid" type="text">
						</div>
						<div class="form-group form-group-label">
							<label class="floating-label" for="prefix">数量</label>
							<input class="form-control" id="num" type="number">
						</div>
					</div>
					<div class="card-action">
						<div class="card-action-btn pull-left">
							<a class="btn btn-flat waves-attach" id="invite"><span class="icon">check</span>&nbsp;生成</a>
						</div>
					</div>
				</div>
			</div>
			<div class="card margin-bottom-no">
				<div class="card-main">
					<div class="card-inner">
						<p class="card-heading">推广记录</p>
						<p>{include file='table/checkbox.tpl'}</p>
						<div class="card-table">
							<div class="table-responsive">
								{include file='table/table.tpl'}
							</div>
						</div>
					</div>
				</div>
			</div>
			{include file='dialog.tpl'}
	</div>
</main>
{include file='admin/footer.tpl'}
<script>
{include file='table/js_1.tpl'}
$("#invite").click(function () {
    $.ajax({
        type: "POST",
        url: "/admin/invite",
        dataType: "json",
        data: {
            prefix: $("#prefix").val(),
            uid: $("#uid").val(),
            num: $("#num").val()
        },
        success: function (data) {
            if (data.ret) {
                $("#result").modal();
                $("#msg").html(data.msg);
                window.setTimeout("location.href='/admin/invite'", {$config['jump_delay']});
						}
            else
						{
							$("#result").modal();
	                        $("#msg").html(data.msg+"。");
						}
            // window.location.reload();
        },
        error: function (jqXHR) {
            alert("发生错误：" + jqXHR.status);
        }
    })
});
$(document).ready(function(){
 	{include file='table/js_2.tpl'}
});
</script>