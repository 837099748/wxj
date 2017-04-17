<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- 引入jstl核心标签库 -->    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!-- 引入函数标签库 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>吉林工程技术师范学院图书馆v5.5书目检索系统</title>
<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/style.css">
<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/mylib.css" />
<link type="text/css" rel="stylesheet"
	href="${basePath}/styles/css/ui-lightness/jquery-ui-1.8.13.custom.css">
<link type="text/css" rel="stylesheet"
	href="${basePath}/styles/css/font-awesome.css">
<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/reader-info.css">
<script type="text/javascript" src="${basePath}/styles/js/jquery.1.7.1.min.js"></script>
<script type="text/javascript"
	src="${basePath}/styles/js/jquery-ui-1.8.13.custom.min.js"></script>
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
				<a href="book_cart.php">暂存书架(<span id="bookcartCount">0</span>)
				</a> | <font color="blue"></font> <a href="login.dhtml"
					style="color: #ff0000;">登录</a>
			</p>
		</div>
	</div>
	<div id="menubar">
		<ul id="menu_top">
			<li><a class="menu_top_on" style="color: #6C5B23;"
				href="search.php.htm" target="_self">书目检索</a></li>
			<li><a href="../top/top_lend.php" target="_self">热门推荐</a></li>
			<li><a href="../browse/cls_browsing.php" target="_self">分类浏览</a></li>
			<li><a href="../newbook/newbook_cls_browse.php" target="_self">新书通报</a></li>
			<li><a href="../peri/peri_nav_e.php" target="_self">期刊导航</a></li>
			<li><a href="../asord/asord_hist.php" target="_self">读者荐购</a></li>
			<li><a href="../shelf/curriculum_browse.php" target="_self">学科参考</a></li>
			<li><a href="../info/info_guide.php" target="_self">信息发布</a></li>
			<li><a href="../reader/redr_info.php" target="_self">我的图书馆</a></li>
			<div class="clear"></div>
		</ul>
	</div>
	<div id="submenu">

		<a href="search.php.htm" target="_self">简单检索</a> <a
			href="search_adv.php" target="_self">全文检索</a> <a
			href="search_more.php" target="_self">多字段检索</a>
		<div class="clear"></div>
	</div>


	<style type="text/css">
.prompt {
	position: relative;
	border: 1px dot #EDD28B;
	background: #FFFDEE;
	box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15);
	border-radius: 1px;
	padding: 9px;
}

.tooltip s {
	margin-left: 2px;
	border: 4px dashed;
	border-color: #005A9D transparent transparent;
	border-top-style: solid;
}

.tooltip s, .tooltip i {
	display: inline-block;
	line-height: 0;
	font-size: 0;
	height: 0;
	overflow: hidden;
	vertical-align: middle;
}
</style>
	<div id="mainbox">
		<div id="container">
			<div id="sidebar">
				<div class="left_content left_content_line">
					<h4>参考翻译</h4>
					<p>
						<span id="dict"></span>
					</p>
				</div>
				<div class="left_content left_content_line">
					<h4>缩小检索范围</h4>
					<dl class="s_l_list">
						<dd>
							<b>分类：</b>
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3a47b">工业技术</a>(2270)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3966d">经济</a>(369)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3986f">语言、文字</a>(367)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d39a71">艺术</a>(295)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d39f76">数理科学与化学</a>(279)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d39970">文学</a>(168)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d39269">哲学、宗教</a>(115)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3976e">文化、科学、教育、体育</a>(99)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d39b72">历史、地理</a>(96)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3936a">社会科学总论</a>(44)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3946b">政治、法律</a>(37)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3a57c">交通运输</a>(32)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3a178">生物科学</a>(27)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3a279">医药、卫生</a>(20)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3956c">军事</a>(16)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3a077">天文学、地球科学</a>(11)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3a87f">环境科学,安全科学</a>(6)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3aa81">综合性图书</a>(6)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3a67d">航空、航天</a>(6)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d3a37a">农业科学</a>(5)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc0125d39e75">自然科学总论</a>(5)
						</dd>
						<dd>
							&middot;<a href="default.htm"></a>(未知类 14)
						</dd>
					</dl>
					<dl class="s_l_list">
						<dt>
							<strong>文献类型： </strong>
						</dt>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_date&onlylendable=no&with_ebook=on&hist_cont=hist&doctype=01">中文图书</a>(3800)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_date&onlylendable=no&with_ebook=on&hist_cont=hist&doctype=02">西文图书</a>(434)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_date&onlylendable=no&with_ebook=on&hist_cont=hist&doctype=12">西文期刊</a>(50)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_date&onlylendable=no&with_ebook=on&hist_cont=hist&doctype=11">中文期刊</a>(1)
						</dd>
					</dl>
					<dl class="s_l_list">
						<dt>
							<strong>馆藏地： </strong>
						</dt>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da06476e128f">第四书库</a>(2230)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da06476e6593">第三书库</a>(833)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da06476e1390">第二书库</a>(565)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da06476e118e">第一书库</a>(419)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da06476e6896">高新校区图书馆</a>(294)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da06476e1592">第三阅览室</a>(204)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da06476e618f">经技图书馆</a>(192)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da0476f556d7">工商管理学院</a>(60)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da0476f550d1">教育中心</a>(20)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da0476f559da">外语教研部</a>(20)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da0476f521d3">杂志社</a>(16)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da0476f551d2">机电工程学院</a>(15)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da0476f522d4">传媒研究所</a>(13)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da0476f552d3">信息工程学院</a>(11)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da076f557102">临时调拨库(泰来校区)</a>(9)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da0476f523d5">职业教育学院</a>(5)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da0476f553d4">生物与食品工程系</a>(5)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da0476f557d8">基础教研部</a>(4)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da076f557203">文化传媒学院</a>(4)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da06eea8b94a">不定馆藏地</a>(3)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da0476f554d5">艺术学院</a>(3)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da06476e1491">外文库</a>(2)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da06476e1895">检索室</a>(1)
						</dd>
						<dd>
							&middot;<a
								href="openlink.php@title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_da06476e1693">中文过刊室</a>(1)
						</dd>
					</dl>
					<dl class="s_l_list">
						<dt>
							<strong>主题：</strong>
						</dt>
						<dd>
							&middot;<a
								href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc01ae26a190">点击展开</a>(结果集过多)
						</dd>
					</dl>
				</div>
			</div>

			<div id="content">
				<div class="book_article">
					<div class="search_form bulk-actions">
						<p style="font-size: 14px;">
							检索到 <strong class="red">${blist.size() }</strong> 条 　${sn}=<font color="red">${strText }</font>
							 的结果 &nbsp;&nbsp;&nbsp;<a target="_blank"
								href="search_rss.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_date&onlylendable=yes&with_ebook=on&with_ebook=on"><img
								src="${basePath}/styles/images/rss.gif" title="此检索条件下的结果RSS源" border="0" /></a>
						</p>
					</div>
					<div class="search_form bulk-actions">
						<form name="form" method="post">
							<p>
								<c:set value="${blist }" var="blist" scope="session"></c:set>
								<select name="searchType" class="option" size="1">
									<option value="name" selected="selected">题&nbsp;&nbsp;名</option>
									<option value="author">责任者</option>
									<option value="isbn">ISBN/ISSN</option>
									<option value="coden">分类号</option>
									<option value="publisher">出版社</option>
								</select> 
								<input type="text" maxlength="250" name="strText" id="s2_text" value="" style="width: 330px;" /> 
								<input type="submit" class="btn btn-primary" value="在结果中检索" onclick="searchInResult()"/>&nbsp;
								<input class="btn btn-primary" value="重新检索" type="submit" onclick="newSearch()">
								<input type="hidden" id="search_bar" name="search_bar" value="result" />
								<input name="title" type="hidden" value="a" /> 
								<input type="hidden" name="doctype" value="ALL" /> 
								<input type="hidden" name="with_ebook" value="on" /> 
								<input type="hidden" name="match_flag" value="forward" /> 
								<input type="hidden" name="showmode" value="list" /> 
								<input type="hidden" name="location" value="ALL" />
							</p>
						</form>
					</div>
				</div>

				<div class="book_article">
					<br />
				</div>
				<div class="book_article">
					<p class="booktab_line">
						<span class="booktab_current"><a href="#">所有图书</a></span> <span
							class="booktab"><a
							href="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_date&onlylendable=yes&with_ebook=on&with_ebook=on">可借图书</a></span>
					</p>
					<div id="num">
						<span class="pagination"> 上一页 <b><font color=red>1</font>
								/ <font color=black>215</font></b> &nbsp;<a class=blue
							href='openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_date&onlylendable=no&count=4285&with_ebook=on&page=2'>下一页</a>
							到第 <select name='topage' size='1'
							onchange='window.location="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_date&onlylendable=no&count=4285&with_ebook=on&page="+this.value'>
								<option value='1' selected>1</option>
						</select>页
						</span>
						<div class="bulk-actions">
							<form action="openlink.php" method="get">
								<div class="num">
									<label for="sortField"> 按照：</label> <select name="sort"
										name="dropdown">
										<option value="M_TITLE">题名</option>
										<option value="M_AUTHOR">责任者</option>
										<option value="M_CALL_NO">索书号</option>
										<option value="M_PUBLISHER">出版社</option>
										<option value="M_PUB_YEAR">出版日期</option>
										<option value="CATA_DATE" selected="selected">入藏日期</option>
									</select> <select name="orderby" name="dropdown">
										<option value="ASC">升序</option>
										<option value="DESC" selected="selected">降序</option>
									</select> <input type="submit" name="pailie" class="btn btn-success"
										value="排列" /> <input type="hidden" name="title" value="a" />
									<input type="hidden" name="doctype" value="ALL" /> <input
										type="hidden" name="match_flag" value="forward" /> <input
										type="hidden" name="showmode" value="list" /> <input
										type="hidden" name="with_ebook" value="on" /> <input
										type="hidden" name="onlylendable" value="" /> <input
										type="hidden" name="location" value="ALL" />
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="book_article">
					<ol id="search_book_list">
					<c:forEach items="${blist }" var="bl" begin="0" end="${blist.size() }" varStatus="i">
						<li class="book_list_info">
							<h3>
								<span>${bl.get('bdtname') }</span>
								<a href="bookDetails.dhtml?tittle=${bl.get('bid') }">
									<c:out value="${i.index+1 }"></c:out>.
									<c:if test="${bl.get('bname').indexOf(strText) ge 0 }">
										<c:set value="<em style='color:#F00;'>${strText }</em>" var="colorName"></c:set>
										<c:out value="${bl.get('bname').replace(strText,colorName) }" escapeXml="false"></c:out>
									</c:if>
									<c:if test="${bl.get('bname').indexOf(strText) lt 0 }">
										<c:set value="<em style='color:#F00;'>${strText }</em>" var="colorName"></c:set>
										<c:out value="${bl.get('bname').replace(strText,colorName) }" escapeXml="false"></c:out>
									</c:if>
								</a>
								<c:out value="${bl.get('btype') }"></c:out>
							</h3>
							<p>
								<span>馆藏复本：${bl.get('num') } <br> 可借复本：2
								</span>
								<c:if test="${bl.get('bwriter').indexOf(strText) ge 0 }">
									<c:set value="<em style='color:#F00;'>${strText }</em>" var="colorName"></c:set>
									<c:out value="${bl.get('bwriter').replace(strText,colorName) }" escapeXml="false"></c:out>
								</c:if>
								<c:if test="${bl.get('bwriter').indexOf(strText) lt 0 }">
									<c:set value="<em style='color:#F00;'>${strText }</em>" var="colorName"></c:set>
									<c:out value="${bl.get('bwriter').replace(strText,colorName) }" escapeXml="false"></c:out>
								</c:if>
								 编著
								<br />
								<c:if test="${bl.get('bpub').indexOf(strText) ge 0 }">
									<c:set value="<em style='color:#F00;'>${strText }</em>" var="colorName"></c:set>
									<c:out value="${bl.get('bpub').replace(strText,colorName) }" escapeXml="false"></c:out>
								</c:if>
								<c:if test="${bl.get('bpub').indexOf(strText) lt 0 }">
									<c:set value="<em style='color:#F00;'>${strText }</em>" var="colorName"></c:set>
									<c:out value="${bl.get('bpub').replace(strText,colorName) }" escapeXml="false"></c:out>
								</c:if>
							</p>
						</li>
						</c:forEach>
					</ol>

					<div class="clear"></div>
				</div>
				<div class="book_article numstyle">
					<span class="num_prev"> 上一页 <b><font color=red>1</font>
							/ <font color=black>215</font></b> &nbsp;<a class=blue
						href='openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_date&onlylendable=no&count=4285&with_ebook=on&page=2'>下一页</a>
						到第 <select name='topage' size='1'
						onchange='window.location="openlink.php@location=all&title=a&doctype=all&lang_code=all&match_flag=forward&displaypg=20&showmode=list&orderby=desc&sort=cata_date&onlylendable=no&count=4285&with_ebook=on&page="+this.value'>
							<option value='1' selected>1</option>
					</select>页
					</span>
				</div>
				<hr style="background-color: green; size: 2px;" />
				<div class="clear"></div>
			</div>
		</div>
		<div class="go_top_r">
			<a href="javascript:;" onclick="javascript:parent.scroll(0,0);"><img
				alt="返回顶部" title="返回顶部" src="${basePath}/styles/images/top.png"></a>
		</div>

	</div>

	<script type="text/javascript">
	
	<!--
		$("#dict").load("ajax_dict.php@type=title&q=a.htm");
		MarkHighLight(document.getElementById("content"), 'a');

		function showDetail(marcNo) {
			$("#detail" + marcNo).load("ajax_item.php@marc_no=.htm" + marcNo);
			$("#detail" + marcNo).addClass("prompt");
			$("#detail" + marcNo).show();
		}

		function hideDetail(marcNo) {
			$("#detail" + marcNo).hide();
		}

		function my_submit(search_type) {
			var s_text = document.getElementById('s2_text').value;
			if (s_text.replace(/(\s*$)/g, "") == "") {
				alert('请输入检索词');
				return;
			}
			document.getElementById('search_bar').value = search_type;
			document.forms.f.submit();
		}

		$("#ebook")
				.load(
						"ajax_ebook.php@total=0&match=forward&type=title&q=a&start=1.htm",
						function(html) {
							MarkHighLight(document.getElementById("ebook"), 'a');
						});

		var ebookpage = 1;
		function showEbook(page) {
			ebookpage = ebookpage + page;
			$("#ebook").load(
					"ajax_ebook.php@total=0&match=forward&type=title&q=a&start=.htm"
							+ ebookpage, function() {
						MarkHighLight(document.getElementById("ebook"), 'a');
					});
		}

		if (document.documentElement.clientHeight < document.documentElement.offsetHeight - 6) {
			$(".go_top_r").show();
		} else {
			$(".go_top_r").hide();
		}

		-->
		function searchInResult(){
			document.form.action="searchInResult.dhtml";  
		}
		function newSearch(){
			document.form.action="search.dhtml";
		}

	</script>
	<div id="footer">
		<div id="copy">
			<p>吉林工程技术师范学院图书馆&nbsp;&nbsp; OPAC v5.5.15.12.03 &nbsp;&nbsp;</p>
			<p>
				&copy; 1999-2015 <a target="_blank"
					href="../../www.libsys.com.cn/default.htm">Jiangsu Huiwen
					Software Ltd. 江苏汇文软件有限公司</a>
			</p>
		</div>
	</div>
</body>
</html>
