<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/backend/css/qr.css" />
	<script src="//cdn.staticfile.org/jquery/2.2.1/jquery.min.js"></script>
</head>
<body>
	<br/><br /><br />
	<div aria-hidden="true" class="modal modal-va-middle fade" id="nodeinfo" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-full">
			<div class="modal-content">
				<iframe class="iframe-seamless" title="Modal with iFrame" id="infoifram"></iframe>
			</div>
		</div>
	</div>
	{$id=0}
	{foreach $node_prefix as $prefix => $nodes}
	{$id=$id+1}
		<div id="heading{$node_order->$prefix}">
			{foreach $nodes as $node}
				<div class="card-inner" align="center">
					节点名称：{$prefix}，<a href="javascript:void(0);" onClick="urlChange('{$node->id}',0,0)">点击查看二维码</a>
				</div>
			{/foreach}
		</div>
	{/foreach}
	<script src="/backend/js/base.min.js"></script>
</body>
</html>
<script>
function urlChange(id,is_mu,rule_id) {
    var site = './node/'+id+'?ismu='+is_mu+'&relay_rule='+rule_id;
	document.getElementById('infoifram').src = site;
	$("#nodeinfo").modal();
}
</script>