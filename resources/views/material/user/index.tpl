<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>用户中心 - {$config["appName"]}</title>
	<link rel="stylesheet" type="text/css" href="/backend/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/backend/css/style.min.css" />
	<link rel="shortcut icon" href="/favicon.ico">
	<link rel="apple-touch-icon" href="/favicon.png">
</head>
<body>
	<hr />
	<table class='table table-bordered definewidth'>
		<thead>
			<tr>
				<th colspan="6">使用需知</th>	
				<th><div align="center">账户余额</div></th>
			</tr>
		</thead>
		<tr>
			<td colspan="6" width="87.5%">1. 请保管好您自己的帐号，为了服务器的稳定运行，切勿泄露服务器地址及配置二维码</td>
			<td rowspan="3" width="12.5%">
				<p>&nbsp;</p><div align="center" style="font-size:40px; color:#FF9601">{$user->money}</div>
			</td>
		</tr>
		<tr>
			<td colspan="6">2. 每天凌晨4点整为服务器自动重启维护时间，每次重启会断网 2~3 分钟，请注意使用时间安排</td>		
		</tr>
		<tr>
			<td colspan="6">3. 向他人成功推荐购买本站服务后，您可获赠其 10% 的充值提成，官方 QQ 群 <font color="red">你的QQ群（推荐加入，获取最新优惠）</font></td>		
		</tr>
		<tr style="font-weight:bold">
			<td><div align="center"><a href="/user/shop" target="_blank">套餐列表</a></div></td>
			<td><div align="center"><a href="/download.html" target="_blank">软件下载</a></div></td>
			<td><div align="center"><a href="/tutorial.html" target="_blank">使用教程</a></div></td>
			<td><div align="center"><a href="/user/invite" target="_blank">推广获利</a></div></td>
			<td><div align="center"><a href="/user/edit" target="_blank">资料编辑</a></div></td>
			<td><div align="center"><a href="/user/bought" target="_blank">购买记录</a></div></td>
			<td><div align="center"><a href="/user/code" target="_blank">账户充值</a>{if $user->isAdmin()} | <a href="/admin">后台</a>{/if}</div></td>
		</tr>
	</table>
	<form class='form-inline definewidth m20'>
		<font style="color:gray; font-weight:bold">帐户信息：</font>
	</form>
	<table class='table table-bordered table-hover definewidth m10'>
		<thead>
			<tr>
				<th>帐户编号</th>
				<th>账户邮箱</th>
				<th>连接端口<font color=brown>(参数二)</font></th>
				<th>连接密码<font color=brown>(参数三)</font></th>
				<th>今日流量</th>
				<th>已用流量</th>
				<th>剩余流量</th>
				<th>套餐到期时间</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>NO.0130{$user->id}</td>
				<td>{$user->email}</td>
				<td>{$user->port}</td>
				<td>{$user->passwd}</td>
				<td>{$user->TodayusedTraffic()}</td>
				<td>{$user->usedTraffic()}</td>
				<td>{$user->unusedTraffic()}</td>
				<td>{$user->class_expire}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="8"><div align="center"><font style="color:red; font-weight:bold">!!! 截 图 请 务 必 给 四 个 参 数 打 马 赛 克 !!!　!!! 截 图 请 务 必 给 四 个 参 数 打 马 赛 克 !!!</font></div></td>
			</tr>
		</tfoot>
	</table>
	<form class='form-inline definewidth m20'>
		<font style="color:gray; font-weight:bold">节点信息：</font>
	</form>
	<table class='table table-bordered table-hover definewidth m10'>
		<thead>
			<tr>
				<th>服务器组群</th>
				<th>服务器地址<font color=brown>(参数一)</font></th>
				<th>加密方式<font color=brown>(参数四)</font></th>
				<th>线路类型</th>
				<th>在线人数</th>
				<th>节点状态</th>
				<th>流量负载(已用/总量)</th>
				<th>配置二维码</th>
			</tr>
		</thead>
		{if {$user->unusedTraffic()} > 0}
		<tbody>
			{$id=0}
			{foreach $node_prefix as $prefix => $nodes}
				{$id=$id+1}
				<tr>
					{foreach $nodes as $node}
					<td>{$node->name}</td>
					<td>{$node->server}</td>
					<td>{$user->method}</td>
					<td>{$node->info}</td>
					<td>{$node_alive[$prefix]}</td>
					<td>{$node_heartbeat[$prefix]}</td>
					<td>{$node_bandwidth[$prefix]}</td>
					<td><img src="/backend/img/qr.png" style ="position:relative; top:-1px" /> <a href="/user/node/{$node->id}?ismu=0&relay_rule=0#ss_qrcode" target="_blank">点击查看</td>
					{/foreach}
				</tr>
			{/foreach}
		</tbody>
		{else}
		<tbody>
			<tr><td>普通1 - 香港一</td><td>***.***.***.***</td><td>CHACHA20-IETF</td><td>在线视频</td><td colspan='4'><div align="center" style="color:brown">信息已隐藏，购买套餐后可见！<a href="/user/shop" target="_blank">点此购买</a></div></td></tr>
			<tr><td>普通2 - 日本一</td><td>***.***.***.***</td><td>CHACHA20-IETF</td><td>在线视频</td><td colspan='4'><div align="center" style="color:brown">信息已隐藏，购买套餐后可见！<a href="/user/shop" target="_blank">点此购买</a></div></td></tr>
			<tr><td>普通3 - 日本二</td><td>***.***.***.***</td><td>CHACHA20-IETF</td><td>网页浏览</td><td colspan='4'><div align="center" style="color:brown">信息已隐藏，购买套餐后可见！<a href="/user/shop" target="_blank">点此购买</a></div></td></tr>
			<tr><td>普通4 - 美国一</td><td>***.***.***.***</td><td>CHACHA20-IETF</td><td>在线视频</td><td colspan='4'><div align="center" style="color:brown">信息已隐藏，购买套餐后可见！<a href="/user/shop" target="_blank">点此购买</a></div></td></tr>
			<tr><td>普通5 - 美国二</td><td>***.***.***.***</td><td>CHACHA20-IETF</td><td>网页浏览</td><td colspan='4'><div align="center" style="color:brown">信息已隐藏，购买套餐后可见！<a href="/user/shop" target="_blank">点此购买</a></div></td></tr>
			<tr><td>普通6 - 荷兰一</td><td>***.***.***.***</td><td>CHACHA20-IETF</td><td>网页浏览</td><td colspan='4'><div align="center" style="color:brown">信息已隐藏，购买套餐后可见！<a href="/user/shop" target="_blank">点此购买</a></div></td></tr>
			<tr><td>高级1 - 香港二</td><td>***.***.***.***</td><td>CHACHA20-IETF</td><td>游戏专用</td><td colspan='4'><div align="center" style="color:brown">信息已隐藏，购买套餐后可见！<a href="/user/shop" target="_blank">点此购买</a></div></td></tr>
			<tr><td>高级2 - 新加坡</td><td>***.***.***.***</td><td>CHACHA20-IETF</td><td>在线视频</td><td colspan='4'><div align="center" style="color:brown">信息已隐藏，购买套餐后可见！<a href="/user/shop" target="_blank">点此购买</a></div></td></tr>
			<tr><td>高级3 - 北京一</td><td>***.***.***.***</td><td>CHACHA20-IETF</td><td>网页浏览</td><td colspan='4'><div align="center" style="color:brown">信息已隐藏，购买套餐后可见！<a href="/user/shop" target="_blank">点此购买</a></div></td></tr>
		</tbody>
		{/if}
		<tfoot>
			<td colspan='7'><font style="color:red; font-weight:bold">注意：本站所有节点线路均不相同，请依次测试后选取最佳节点！！！&gt;&gt;&gt;&gt;<a href="" target="_blank">节点可用性监测</a>&lt;&lt;&lt;&lt;</font></td>
			<td colspan='1'><a href='/user/logout'><font style="font-weight:bold">退出登录</font></a></td>
		</tfoot>
	</table>

	<hr />
	<p align='center'>2017 &copy; <a href='/' target="_blank">呵呵呵</a> 保留所有权利.</p>
</body>
</html>