<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<title>注册 - {$config["appName"]}</title>
	<link href="/backend/css/base.min.css" rel="stylesheet">
	<link href="/backend/css/project.min.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="/backend/css/font.css" rel="stylesheet" />
</head>
<body class="page-brand">
<main class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
					<section class="content-inner">
						<div class="card">
							<div class="card-main">
								<div class="card-header">
									<div class="card-inner">
										<h1 class="card-heading">注册账户</h1>
									</div>
								</div>
								<div class="card-inner">
									{if $enable_invite_code == 'true'}
									<div class="form-group form-group-label">
										<div class="row">
											<div class="col-md-6 col-md-push-1">
												<label class="floating-label" for="code">邀请码</label>
												<input class="form-control" id="code" type="text" value="{$code}">
											</div>
											<div class="col-md-4 col-md-push-1">
												<div style="cursor: pointer;" onclick="window.location='/code';"><button class="btn btn-block btn-red waves-attach waves-light">获取邀请码</button></div>
											</div>
										</div>
									</div>
									{/if}
									<div class="form-group form-group-label">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<label class="floating-label" for="name">账户昵称（不可用于登录）</label>
												<input class="form-control" id="name" type="text">
											</div>
										</div>
									</div>
									<div class="form-group form-group-label">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<label class="floating-label" for="email">账户邮箱（使用临时邮箱注册一律删除）</label>
												<input class="form-control" id="email" type="text">
											</div>
										</div>
									</div>
									{if $enable_email_verify == 'true'}
									<div class="form-group form-group-label">
										<div class="row">
											<div class="col-md-6 col-md-push-1">
												<label class="floating-label" for="email_code">邮箱验证码</label>
												<input class="form-control" id="email_code" type="text">
											</div>
											<div class="col-md-4 col-md-push-1">
												<button id="email_verify" class="btn btn-block btn-green waves-attach waves-light">获取验证码</button>
											</div>
										</div>
									</div>
									{/if}
									<div class="form-group form-group-label">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<label class="floating-label" for="passwd">账户密码（尽量不要使用常用密码）</label>
												<input class="form-control" id="passwd" type="password">
											</div>
										</div>
									</div>
									<div class="form-group form-group-label">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<label class="floating-label" for="repasswd">确认密码</label>
												<input class="form-control" id="repasswd" type="password">
											</div>
										</div>
									</div>
									<div class="form-group form-group-label" style="display:none">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<label class="floating-label" for="imtype">选择联系方式</label>
												<select class="form-control" id="imtype">
													<option value="2">QQ</option>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group form-group-label">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<label class="floating-label" for="wechat">QQ账户（请如实填写，售后的保证）</label>
												<input class="form-control" id="wechat" type="text">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<button id="tos" type="submit" class="btn btn-block btn-brand waves-attach waves-light">注册</button>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<p>注册即代表同意本站<a href="/tos" target="_blank">服务条款</a>，同意遵守相关法律！</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix" align="center">
							<a class="btn btn-flat btn-brand waves-attach" href="/auth/login">已经注册？点此登录</a>
						</div>
						{include file='dialog.tpl'}
						<div aria-hidden="true" class="modal modal-va-middle fade" id="tos_modal" role="dialog" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-heading">
										<h2 class="modal-title">注册须知</h2>
									</div>
									<div class="modal-inner">
										{include file='reg_tos.tpl'}
									</div>
									<div class="modal-footer">
										<p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal" type="button" id="cancel">我不服</button><button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal" id="reg" type="button">同意</button></p>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>
{include file='footer.tpl'}
<script>
    $(document).ready(function(){
        function register(){
			document.getElementById("tos").disabled = true; 
            $.ajax({
                type:"POST",
                url:"/auth/register",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                    name: $("#name").val(),
                    passwd: $("#passwd").val(),
                    repasswd: $("#repasswd").val(),
					wechat: $("#wechat").val(),
					imtype: $("#imtype").val(){if $enable_invite_code == 'true'},
					code: $("#code").val(){/if}{if $enable_email_verify == 'true'},
					emailcode: $("#email_code").val(){/if}
                },
                success:function(data){
                    if(data.ret == 1){
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='/auth/login'", {$config['jump_delay']});
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
			document.getElementById("tos").disabled = false; 
                    }
                },
                error:function(jqXHR){
			$("#msg-error").hide(10);
			$("#msg-error").show(100);
			$("#msg-error-p").html("发生错误："+jqXHR.status);
			document.getElementById("tos").disabled = false; 
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                $("#tos_modal").modal();
            }
        });
		$("#reg").click(function(){
            register();
        });
		$("#tos").click(function(){
            $("#tos_modal").modal();
        });
    })
</script>
{if $enable_email_verify == 'true'}
<script>
var wait=60;
function time(o) {
		if (wait == 0) {
			o.removeAttr("disabled");			
			o.text("获取验证码");
			wait = 60;
		} else {
			o.attr("disabled","disabled");
			o.text("重新发送(" + wait + ")");
			wait--;
			setTimeout(function() {
				time(o)
			},
			1000)
		}
	}
    $(document).ready(function () {
        $("#email_verify").click(function () {
			time($("#email_verify"));
			
            $.ajax({
                type: "POST",
                url: "send",
                dataType: "json",
                data: {
                    email: $("#email").val()
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
			$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>
{/if}