<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<title>重置密码 - {$config["appName"]}</title>
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
										<h1 class="card-heading">重置密码</h1>
									</div>
								</div>
								<div class="card-inner">
								<div align="center" style="color:red">重置邮件可能被误判为垃圾邮件，注意查看垃圾箱邮件！</div>
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="email">账户邮箱</label>
													<input class="form-control" id="email" type="text">
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<button id="reset" type="submit" class="btn btn-block btn-brand waves-attach waves-light">发送重置邮件</button>
												</div>
											</div>
										</div>
								</div>
							</div>
						</div>
						<div class="clearfix" align="center">
							<a class="btn btn-flat btn-brand waves-attach" href="/auth/login">已有账户？点此登录</a> | <a class="btn btn-flat btn-brand waves-attach" href="/auth/register">还没账户？点此注册</a>
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
        function reset(){
			$("#result").modal();
            $("#msg").html("正在发送，请稍候。。。");
            $.ajax({
                type:"POST",
                url:"/password/reset",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                },
                success:function(data){
                    if(data.ret == 1){
                        $("#result").modal();
                        $("#msg").html(data.msg);
                       // window.setTimeout("location.href='/auth/login'", 2000);
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error:function(jqXHR){
                    $("#result").modal();
                    $("#msg").html(data.msg);
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                login();
            }
        });
        $("#reset").click(function(){
            reset();
        });
    })
</script>