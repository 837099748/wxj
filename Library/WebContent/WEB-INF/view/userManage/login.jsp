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
        <a href="../opac/book_cart.php">暂存书架(<span id="bookcartCount">0</span>)</a> | <font color="blue"></font> <a href="#" style="color:#ff0000;">登录</a></p>
       </div>
</div>
<div id="menubar">
    <ul id="menu_top">
    		  	<li><a href="index.dhtml" target="_self" >书目检索</a></li>
	  		  	<li><a href="../top/top_lend.php" target="_self" >热门推荐</a></li>
	  		  	<li><a href="../browse/cls_browsing.php" target="_self" >分类浏览</a></li>
	  		  	<li><a href="../newbook/newbook_cls_browse.php" target="_self" >新书通报</a></li>
	  		  	<li><a href="../peri/peri_nav_e.php" target="_self" >期刊导航</a></li>
	  		  	<li><a href="../asord/asord_hist.php" target="_self" >读者荐购</a></li>
	  		  	<li><a href="../shelf/curriculum_browse.php" target="_self" >学科参考</a></li>
	  		  	<li><a href="../info/info_guide.php" target="_self" >信息发布</a></li>
	  		  	<li><a class="menu_top_on" style="color:#6C5B23;"	href="../reader/redr_info.php" target="_self" >我的图书馆</a></li>
	  		  	         <div class="clear"></div>
    </ul>
</div>
<div id="submenu">
	        <div class="clear"></div>
</div>

		<script language="JavaScript" type="text/javascript">
	$(function(){
	});
</script>

<div id="mainbox">
   <div id="container">
      <div id="left_tab">
      <h5 class="box_bgcolor"><strong>登录我的图书馆</strong></h5>
      	<form action="myLib.dhtml" name="frm_login" method="POST">
        <table width="95%" border="0" cellpadding="3" cellspacing="1">
          <tr>
            <td width="150" align="right">用户名： </td>
            <td colspan="2" align="left"><input class="input" id="number" name="number" type="text" size="20" style="width:150px" ></td>
          </tr>
          <tr>
            <td height="40" align="right">密码： </td>
            <td colspan="2" align="left"><input class="input" name="passwd" type="password" size="20" style="width:150px" ></td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td colspan="2" align="left">
            	<input  type="Radio" name="select" value="cert_no" checked="checked" />证件号
				<input type="Radio" name="select" value="bar_no" />条码号
				<input type="Radio" name="select" value="email" />Email
			</td>
          </tr>
		  <tr>
		  	<td></td>
		  	<td></td>
		  	<td></td>
		  </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td colspan="2" align="left"><input class="btn btn-danger" type="submit"   value="登录"><input type="hidden" name="returnUrl" value="" />
            <input class="btn" type="button" value="密码重置" onclick="javascript:location.href='get_pwd.php' " />			</td>
          </tr>
		  <tr>
		  	<td></td>
		  	<td colspan="2"><font color="red"></font></td>
	  	  </tr>
        </table>
        </form>  	 
      </div>
      
      <div id="right_con">
          <h5>提示</h5>
          <div id="content_note">
            <ul>
               <li >读者用户名为读者的证件号,条码号或者您的Email,具体可以自行选择</li>
               <li style="list-style-type: none;"><br/></li>
               <li >读者信息查询的初始密码有两种可能情况：<br/>
               	<br>1.读者证件号（一般即为您的学号）
               	<br>2.借书证上的条形码号
               </li>
               <li style="list-style-type: none;"><br/></li>
               <li>密码在进入系统后可由读者重新设置</li>
               <li style="list-style-type: none;"><br/></li>
               <li>Email由您自行设定，登陆后可以修改</li>
               <li style="list-style-type: none;"><br/></li>
               <li>密码取回需要您首先验证您的Email</li>
            </ul>
        </div>
      </div>
      <div class="clear"></div>
   </div>	
   <div class="clear"></div>		  	 
</div><div id="footer"><div id="copy"><p> 吉林工程技术师范学院图书馆&nbsp;&nbsp; OPAC v5.5.15.12.03  &nbsp;&nbsp;</p><p>&copy; 1999-2015 <a target="_blank" href="http://www.libsys.com.cn">Jiangsu Huiwen Software Ltd. 江苏汇文软件有限公司</a></p></div></div></body></html>