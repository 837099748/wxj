<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>吉林工程技术师范学院图书馆v5.5书目检索系统 </title>
<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/style.css">
<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/mylib.css" />
<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/ui-lightness/jquery-ui-1.8.13.custom.css">
<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/font-awesome.css">
<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${basePath}/styles/css/reader-info.css">
<script  type="text/javascript" src="${basePath}/styles/js/jquery.1.7.1.min.js"></script>
<script  type="text/javascript" src="${basePath}/styles/js/jquery-ui-1.8.13.custom.min.js"></script>
<script  type="text/javascript" src="${basePath}/styles/js/highlighter.js"></script>

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
      <p class="header_right_font">       </p>
      <p style="margin-top:60px;" class="header_right_font">
        <a href="../opac/book_cart.php">暂存书架(<span id="bookcartCount">0</span>)</a> | <font color="blue"></font> <a href="login.dhtml" style="color:#ff0000;">登录</a></p>
       </div>
</div>
<div id="menubar">
    <ul id="menu_top">
    		  	<li><a class="menu_top_on" style="color:#6C5B23;"	href="index.dhtml" target="_self" >书目检索</a></li>
	  		  	<li><a href="../top/top_lend.php" target="_self" >热门推荐</a></li>
	  		  	<li><a href="../browse/cls_browsing.php" target="_self" >分类浏览</a></li>
	  		  	<li><a href="../newbook/newbook_cls_browse.php" target="_self" >新书通报</a></li>
	  		  	<li><a href="../peri/peri_nav_e.php" target="_self" >期刊导航</a></li>
	  		  	<li><a href="../asord/asord_hist.php" target="_self" >读者荐购</a></li>
	  		  	<li><a href="../shelf/curriculum_browse.php" target="_self" >学科参考</a></li>
	  		  	<li><a href="../info/info_guide.php" target="_self" >信息发布</a></li>
	  		  	<li><a href="../reader/redr_info.php" target="_self" >我的图书馆</a></li>
	  		  	         <div class="clear"></div>
    </ul>
</div>
<div id="submenu">
	  	
	  	<a href="../opac/search.php" target="_self" >简单检索</a>
	  	
	  	<a href="../opac/search_adv.php" target="_self" >全文检索</a>
	  	
	  	<a href="../opac/search_more.php" target="_self" >多字段检索</a>
	        <div class="clear"></div>
</div>


<div id="mainbox">
   <div id="container">
		<p name="ebook_tag" class="box_bgcolor">纸本图书检索结果[<font color="#ccc">0</font>]
            <p style="font-size:14px; margin:5px 0 20px 10px;"><span style="color:#f00;">本馆没有您检索的图书</span>　本馆没有您要检索的图书<a href="index.dhtml" class="blue" >重新检索</a>　|　<a href="../asord/asord_record.php?title=aa" class="blue" >到征订目录中检索</a>　|　<a href="../asord/asord_redr.php?title=aa" class="blue" >推荐图书馆购买</a></p>

       </div>
</div>

<div id="footer"><div id="copy"><p> 吉林工程技术师范学院图书馆&nbsp;&nbsp; OPAC v5.5.15.12.03  &nbsp;&nbsp;</p><p>&copy; 1999-2015 <a target="_blank" href="http://www.libsys.com.cn">Jiangsu Huiwen Software Ltd. 江苏汇文软件有限公司</a></p></div></div></body></html>