{include file='admin/main.tpl'}
	<main class="content">
		<div class="content-header ui-content-header">
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>下面是系统运行情况简报。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ui-card-wrap">
					<div class="row" style="font-size:20px">
						<div class="col-lg-12 col-sm-12">
							<font style="font-weight:bold">用户总数 {$sts->getTotalUser()} 人、节点总数 {$sts->getTotalSSNode()} 个</font><br /><br />
							当前在线 {$sts->getOnlineUser(60)} 人、今日在线 {$sts->getOnlineUser(86400)} 人、往期在线 {($sts->getTotalUser()-$sts->getOnlineUser(86400)-$sts->getUnusedUser())} 人、从未在线 {$sts->getUnusedUser()} 人<br /><br />
							今日流量 {$sts->getTodayTrafficUsage()}、已用流量 {$sts->getTrafficUsage()}
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
{include file='admin/footer.tpl'}