<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<title>登录 - {$config["appName"]}</title>
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
						<div class="card-inner">
							<div class="tab-content">
								<div class="tab-pane fade active in" id="passwd_login">
									<div class="card">
										<div class="card-main">
											<div class="card-header">
												<div class="card-inner">
													<h1 class="card-heading">登录</h1>
												</div>
											</div>
											<div class="card-inner">
												<form action="javascript:void(0);"  method="POST">
													<div class="form-group form-group-label">
														<div class="row">
															<div class="col-md-10 col-md-push-1">
																<label class="floating-label" for="email">邮箱</label>
																<input class="form-control" id="email" type="text" name="Email">
															</div>
														</div>
													</div>
													<div class="form-group form-group-label">
														<div class="row">
															<div class="col-md-10 col-md-push-1">
																<label class="floating-label" for="passwd">密码</label>
																<input class="form-control" id="passwd" type="password" name="Password">
															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="row">
															<div class="col-md-10 col-md-push-1">
																<button id="login" type="submit" class="btn btn-block btn-brand waves-attach waves-light">登录</button>
															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="row">
															<div class="col-md-10 col-md-push-1">
																<div class="checkbox checkbox-adv">
																	<label for="remember_me">
																		<input class="access-hide" value="week" id="remember_me" name="remember_me" type="checkbox">记住我
																		<span class="checkbox-circle"></span><span class="checkbox-circle-check"></span><span class="checkbox-circle-icon icon">done</span>
																	</label>
																</div>
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix" align="center">
							<a class="btn btn-flat btn-brand waves-attach" href="/password/reset">忘记密码？点此重置</a> | <a class="btn btn-flat btn-brand waves-attach" href="/auth/register">没有账户？点此注册</a>
						</div>
						{include file='dialog.tpl'}
					</section>
				</div>
			</div>
		</div>
	</main>
{include file='footer.tpl'}
<script>
    $(document).ready(function(){
        function login(){
			document.getElementById("login").disabled = true;
            $.ajax({
                type:"POST",
                url:"/auth/login",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                    passwd: $("#passwd").val(),
					code: $("#code").val(),
                    remember_me: $("#remember_me:checked").val()
                },
                success:function(data){
                    if(data.ret == 1){
						$("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='/user'", {$config['jump_delay']});
                    }
					else{
						$("#result").modal();
                        $("#msg").html(data.msg);
						document.getElementById("login").disabled = false;
                    }
                },
                error:function(jqXHR){
					$("#msg-error").hide(10);
					$("#msg-error").show(100);
					$("#msg-error-p").html("发生错误："+jqXHR.status);
					document.getElementById("login").disabled = false;
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                login();
            }
        });
        $("#login").click(function(){
            login();
        });
		$('div.modal').on('shown.bs.modal', function() {
			$("div.gt_slider_knob").hide();
		});
		$('div.modal').on('hidden.bs.modal', function() {
			$("div.gt_slider_knob").show();
		});
    })
</script>