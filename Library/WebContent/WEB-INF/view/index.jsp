<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- 引入jstl核心标签库 -->    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!-- 引入函数标签库 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>吉林工程技术师范学院图书馆v5.5书目检索系统</title>
	<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/style.css">
	<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/mylib.css">
	<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/ui-lightness/jquery-ui-1.8.13.custom.css">
	<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/font-awesome.css">
	<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/reader-info.css">
	<script type="text/javascript" src="${basePath}/styles/js/jquery.1.7.1.min.js"></script>
	<script type="text/javascript" src="${basePath}/styles/js/jquery-ui-1.8.13.custom.min.js"></script>
	<script type="text/javascript" src="${basePath}/styles/js/highlighter.js"></script>
	
	<script type="text/javascript" src="${basePath}/styles/js/raphael.2.1.0.min.js"></script>
	<script type="text/javascript" src="${basePath}/styles/js/justgage.js"></script>
</head>
<body>
	<div id="header_opac">
		<h1 class="header_opac_img">
			<div class="header_opac_logo">
				吉林工程技术师范学院图书馆书目检索系统<br>
				<p>Online Public Access Catalogue</p>
			</div>
		</h1>
		<div class="header_right header_right_top">
			<p class="header_right_font"></p>
			<p style="margin-top: 60px;" class="header_right_font">
				<a href="http://tushu.jltiet.net:8080/opac/book_cart.php">暂存书架(<span id="bookcartCount">0</span>)
				</a> |  
				<c:if test="${userInfo ne null }">
					<font color="blue">${userInfo.get("uname") }</font> <strong><a href="logout.dhtml" style="color:#ff0000;">注销</a></strong>
				</c:if>
				<c:if test="${userInfo eq null }">
					<a href="login.dhtml" style="color: #ff0000;">登录</a>
				</c:if>
			</p>
		</div>
	</div>
	<div id="menubar">
		<ul id="menu_top">
			<li><a class="menu_top_on" style="color: #6C5B23;" href="#" target="_self">书目检索</a></li>
			<li><a href="http://tushu.jltiet.net:8080/top/top_lend.php" target="_self">热门推荐</a></li>
			<li><a href="http://tushu.jltiet.net:8080/browse/cls_browsing.php" target="_self">分类浏览</a></li>
			<li><a href="http://tushu.jltiet.net:8080/newbook/newbook_cls_browse.php" target="_self">新书通报</a></li>
			<li><a href="http://tushu.jltiet.net:8080/peri/peri_nav_e.php" target="_self">期刊导航</a></li>
			<li><a href="http://tushu.jltiet.net:8080/asord/asord_hist.php" target="_self">读者荐购</a></li>
			<li><a href="http://tushu.jltiet.net:8080/shelf/curriculum_browse.php" target="_self">学科参考</a></li>
			<li><a href="http://tushu.jltiet.net:8080/info/info_guide.php" target="_self">信息发布</a></li>
			<li><a href='<c:if test="${userInfo eq null }">login.dhtml</c:if><c:if test="${userInfo ne null }">myLib.dhtml</c:if>' target="_self">我的图书馆</a></li>
			<div class="clear"></div>
		</ul>
	</div>
	<div id="submenu">
		<a href="http://tushu.jltiet.net:8080/opac/search.php" target="_self"><strong style="">简单检索</strong></a> 
		<a href="http://tushu.jltiet.net:8080/opac/search_adv.php" target="_self">全文检索</a>
		<a href="http://tushu.jltiet.net:8080/opac/search_more.php" target="_self">多字段检索</a>
		<div class="clear"></div>
	</div>

	<div id="mainbox">
		<div id="container">
			<fieldset>
				<legend>
					<img src="${basePath}/styles/images/s_f_1.jpg" width="190" height="18">
				</legend>
				<div style="text-indent: 2em; margin: 4px">
					<form action="search.dhtml" method="post" name="f" onsubmit="return chkForm(this)" id="f">
						<div class="search_bgimg">
							<select class="option" name="searchType" size="1" style="width: 100px;">
								<option value="name" selected="selected">题&nbsp;&nbsp;名</option>
								<option value="author">责任者</option>
								<option value="isbn">ISBN/ISSN</option>
								<option value="coden">分类号</option>
								<option value="publisher">出版社</option>
							</select> 
							<select class="option" name="matchFun" size="1" style="width: 100px;" onchange="matchFlagCheck(this);">
								<option value="forward" selected="selected">前方一致</option>
								<option value="full">完全匹配</option>
								<option value="any">任意匹配</option>
							</select> 
							<input id="historyCount" name="historyCount" value="1" type="hidden">
							<input style="width: 34%;" size="45" name="strText" id="strText" type="text">
							<input class="btn btn-primary" value="&nbsp;检&nbsp;索&nbsp;" size="30" type="submit">
							<input id="btnShowMore" onclick="showMore()" class="btn btn-success" value="更多限制" size="30" type="button"><br>
							<p>
								<span id="msg" style="color: red"></span><br>
							</p>
							<p>
								<input name="doctype" value="ALL" checked="checked" type="radio">所有书刊 
								<input name="doctype" value="01" type="radio"> 中文图书
								<input name="doctype" value="02" type="radio"> 西文图书 
								<input name="doctype" value="11" type="radio"> 中文期刊 
								<input name="doctype" value="12" type="radio"> 西文期刊 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="with_ebook" checked="checked" type="checkbox">显示电子书刊
							</p>
							<div id="child1" class="childl" style="display: none;">
								<p>
									<strong>显示方式：</strong>
									<select class="option" name="displaypg" size="1" style="width: 100px;">
										<option value="20" selected="selected">20条</option>
										<option value="30">30条</option>
										<option value="50">50条</option>
										<option value="100">100条</option>
									</select> 
									<input name="showmode" value="list" checked="checked" type="radio"> 详细显示 
									<input name="showmode" value="table" type="radio"> 表格显示
								</p>
								<p>
									<strong>排序方式：</strong>
									<select class="option" name="sort" size="1" style="width: 100px;">
										<option value="CATA_DATE" selected="selected">入藏日期</option>
										<option value="M_TITLE">题&nbsp;&nbsp;名</option>
										<option value="M_AUTHOR">责任者</option>
										<option value="M_CALL_NO">索书号</option>
										<option value="M_PUBLISHER">出版社</option>
										<option value="M_PUB_YEAR">出版日期</option>
									</select> <input name="orderby" value="asc" type="radio"> 升序排列 
									<input name="orderby" value="desc" checked="checked" type="radio"> 降序排列
								</p>
								<p>
									<strong>检索范围：</strong>
									<select class="option" id="location" name="location" size="1" style="width: 100px;">
										<option value="ALL" selected="selected">所有馆藏地</option>
										<option value="01   ">第一书库</option>
										<option value="02   ">第四书库</option>
										<option value="03   ">第二书库</option>
										<option value="05   ">第三阅览室</option>
										<option value="06   ">中文过刊室</option>
										<option value="15   ">第三书库</option>
									</select>
								</p>
							</div>
							<p></p>
							<div id="hottag" style="padding: 10px 0;">
								<strong>热门检索：</strong><span id="topten"> 
								<a href="#" onclick="input_me('旅游管理')">旅游管理</a> | 
								<a href="#" onclick="input_me('平凡的世界')">平凡的世界</a> | 
								<a href="#" onclick="input_me('小姨多鹤')">小姨多鹤</a> | 
								<a href="#" onclick="input_me('活着')">活着</a> | 
								<a href="#" onclick="input_me('长恨歌')">长恨歌</a> | 
								<a href="#" onclick="input_me('创意写作')">创意写作</a> | 
								<a href="#" onclick="input_me('倾城之恋')">倾城之恋</a> | 
								<a href="#" onclick="input_me('台北人')">台北人</a> | 
								<a href="#" onclick="input_me('文学')">文学</a> | 
								<a href="#" onclick="input_me('洗澡')">洗澡</a> | 
								<a href="#" onclick="input_me('文献检索')">文献检索</a> | 
								<a href="#" onclick="input_me('创意')">创意</a> | 
								<a href="#" onclick="input_me('家')">家</a> | 
								<a href="#" onclick="input_me('论科技')">论科技</a> | 
								<a href="#" onclick="input_me('多媒体')">多媒体</a> | 
								<a href="#" onclick="input_me('呼啸山庄')">呼啸山庄</a> | 
								<a href="#" onclick="input_me('财务管理')">财务管理</a> | 
								<a href="#" onclick="input_me('编辑出版')">编辑出版</a> | 
								<a href="#" onclick="input_me('文化创意')">文化创意</a> | 
								<a href="#" onclick="input_me('针织')">针织</a> |
								</span>
							</div>
							<br> <a href="http://tushu.jltiet.net:8080/opac/top100.php">查看30天内的热门检索词</a>
							<p></p>
						</div>
					</form>
				</div>
			</fieldset>
		</div>

		<script src="${basePath}/styles/js/swfobject.js"></script>
		<div id="search_container">
			<div id="search_container_left">
				<h3>热门检索词</h3>
				<p>
					<object type="application/x-shockwave-flash" allowscriptaccess="always" wmode="transparent" id="swf" data="${basePath}/styles/opac/tagcloud.swf" style="visibility: visible;" width="250" height="200">
						<param name="flashvars" value="mode=tags&distr=false&tcolor=0x00ff00&hcolor=0x000000&speed=50&tagcloud=&lt;tags&gt;${hotText }&lt;/tags&gt;">
					</object>
				</p>
			</div>
			<span id="top_lend_shelf">
				<div id="search_container_right">
					<h3>热门借阅</h3>
					<p></p>
					<ul>
						<li><a target="_blank" href="http://tushu.jltiet.net:8080/opac/item.php?marc_no=0000166876"><span>被禁止的真相:对当今...</span></a></li>
						<li><a target="_blank" href="http://tushu.jltiet.net:8080/opac/item.php?marc_no=0000140615"><span>西方经济学.微观部分...</span></a></li>
						<li><a target="_blank" href="http://tushu.jltiet.net:8080/opac/item.php?marc_no=0000203314"><span>一战二战经典战役全纪...</span></a></li>
						<li><a target="_blank" href="http://tushu.jltiet.net:8080/opac/item.php?marc_no=0000220155"><span>如果世上不再有猫</span></a></li>
						<li><a target="_blank" href="http://tushu.jltiet.net:8080/opac/item.php?marc_no=0000221631"><span>Bootstrap基...</span></a></li>
						<li><a target="_blank" href="http://tushu.jltiet.net:8080/opac/item.php?marc_no=0000215697"><span>新手必备多肉植物养护...</span></a></li>
						<li><a target="_blank" href="http://tushu.jltiet.net:8080/opac/item.php?marc_no=0000185288"><span>轻松瘦身</span></a></li>
						<li><a target="_blank" href="http://tushu.jltiet.net:8080/opac/item.php?marc_no=0000073307"><span>生物化学.下册</span></a></li>
						<li><a target="_blank" href="http://tushu.jltiet.net:8080/opac/item.php?marc_no=0000141311"><span>宇宙未解之谜</span></a></li>
						<li><a target="_blank" href="http://tushu.jltiet.net:8080/opac/item.php?marc_no=0000174095"><span>高等数学全程学习指导...</span></a></li>
					</ul>
					<p></p>
				</div>
				<div id="search_container_center">
					<h3>热门图书</h3>
					<p></p>
					<ul>
						${hotBook }
					</ul>
					<p></p>
				</div>
			</span>
		</div>
		<div class="clear"></div>
	</div>

	<script type="text/javascript">
	<!--
		var bShow = false;

		function input_me(str) {
			$("#strText").val(str);
			$("#historyCount").val("0");
			document.f.submit();
		}

		function showMore() {
			bShow = !bShow;
			if (bShow) {
				$("#btnShowMore").val("取消限制");
				$("#location").val('ALL');
			} else {
				$("#btnShowMore").val("更多限制");
			}
			$("#child1").toggle(bShow);
		}

		$(function() {
			$("#topten").load("ajax_topten.php");
			$("#top_lend_shelf").load("ajax_top_lend_shelf.php");
			$.get("ajax_topkeywords.php", function(taglist) {
				var attributes = {
					'allowScriptAccess' : 'always',
					'wmode' : 'transparent',
					'id' : 'swf'
				};
				var flashvars = {
					'mode' : 'tags',
					'distr' : 'false',
					'tcolor' : '0x00ff00',
					'hcolor' : '0x000000',
					'speed' : 50
				};
				flashvars["tagcloud"] = "<tags>" + taglist + "</tags>";
				swfobject.embedSWF("${basePath}/styles/opac/tagcloud.swf", "swf", 250, 200,
						'10', '', flashvars, {}, attributes);
			});

			$("#child1").hide();
			$("#location").val('ALL');

		});

		function chkForm(theForm) {
			if (theForm.strText.value == "") {
				alert("［查询内容］不能为空");
				theForm.strText.focus();
				return (false);
			}
		}

		function matchFlagCheck(obj) {
			if (obj.value == 'any') {
				$('#msg').html('任意匹配检索将会以全文检索的方式进行，限制检索的条件将不起作用');
			} else
				$('#msg').html('');
		}
	</script>

	<div id="footer">
		<div id="copy">
			<p>吉林工程技术师范学院图书馆</p>
			<p>
				© 1994-2017 <a target="_blank" href="http://www.libsys.com.cn/">China WXJ Feature Technology Ltd. 王欣健未来科技有限公司</a>
			</p>
		</div>
	</div>
</body>
</html>