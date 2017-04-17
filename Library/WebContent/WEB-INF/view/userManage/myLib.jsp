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
        <a href="../opac/book_cart.php">暂存书架(<span id="bookcartCount">0</span>)</a> | 				
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
    		  	<li><a href="index.dhtml" target="_self" >书目检索</a></li>
	  		  	<li><a href="../top/top_lend.php" target="_self" >热门推荐</a></li>
	  		  	<li><a href="../browse/cls_browsing.php" target="_self" >分类浏览</a></li>
	  		  	<li><a href="../newbook/newbook_cls_browse.php" target="_self" >新书通报</a></li>
	  		  	<li><a href="../peri/peri_nav_e.php" target="_self" >期刊导航</a></li>
	  		  	<li><a href="../asord/asord_hist.php" target="_self" >读者荐购</a></li>
	  		  	<li><a href="../shelf/curriculum_browse.php" target="_self" >学科参考</a></li>
	  		  	<li><a href="../info/info_guide.php" target="_self" >信息发布</a></li>
	  		  	<li><a class="menu_top_on" style="color:#6C5B23;"	href="#" target="_self" >我的图书馆</a></li>
	  		  	         <div class="clear"></div>
    </ul>
</div>
<div id="submenu">
	        <div class="clear"></div>
</div>

		



<div id="mainbox">
	<div id="container">
		<div id="navsidebar">
			<ul id="nav_mylib">
				<li id="nav_mylibhome"><a href="redr_info.php" >我的首页</a></li><li><a href="redr_info_rule.php" >证件信息</a></li><li><a href="book_lst.php" >当前借阅</a></li><li><a href="book_hist.php" >借阅历史</a></li><li><a href="asord_lst.php" >荐购历史</a></li><li><a href="preg.php" >预约信息</a></li><li><a href="relegate.php" >委托信息</a></li><li><a href="book_shelf.php" >我的书架</a></li><li><a href="book_loss.php" >书刊遗失</a></li><li><a href="redr_lost.php" >读者挂失</a></li><li><a href="account.php" >帐目清单</a></li><li><a href="fine_pec.php" >违章缴款</a></li><li><a href="book_rv.php" >我的书评</a></li><li><a href="search_hist.php" >检索历史</a></li><li><a href="reader_curriculum.php" >我的课程</a></li><li><a href="credit_detail.php" >我的积分</a></li>
			</ul>
		</div>

		<!--证件信息开始-->
    <div class="main-content">
      <div class="page-content">
        <div class="page-header">
          <h1>证件信息</h1>
        </div>
        <!--身份信息第一块开始-->
        <div class="profile">
          <div class="profile_left">
            <div class="profile-bg"> 
            <span class="profile-picture">
				            		<img src="${basePath}/styles/images/man.png" class="img-responsive" />
            	            </span>
            <span class="profile-name">王欣健</span> </div>
            <div class="mT5 center">
              <input type="button" onClick="javascript:location.href='change_passwd.php'" value="修改密码" class="btn btn-success">
              <input type="button" onClick="javascript:location.href='change_email.php'" value="修改信息" class="btn btn-success">
            </div>
          </div>
          <!--profile_left结束-->
          
          <div class="profile_content">
            <div class="profile-info-row">
              <div class="profile-info-name">证件开始日期：</div>
              <div class="profile-info-value"><span>2013-10-15</span></div>
            </div>
            <!--profile-info-row结束-->
            
            <div class="profile-info-row">
              <div class="profile-info-name">证件结束日期：</div>
              <div class="profile-info-value"><span>2017-07-01</span></div>
            </div>
            <!--profile-info-row结束-->
            
            <div class="profile-info-row">
              <div class="profile-info-name">Email：</div>
              <div class="profile-info-value"> 
              	<span></span> 
              	               		<img src="${basePath}/styles/images/exclamation.png"><font class="red">未验证</font>&nbsp;&nbsp;
               		<a class="blue" href="email_con.php">点击验证</a>
               	              </div>
            </div>
            <!--profile-info-row结束--> 
            
          </div>
          <!--profile_content结束-->
          
          <div class="profile_right"> 
          	<span class="btn btn-app btn-sm btn-danger"> 
	          	<span class="bigger-170"> 25 </span><br />
	            <span class="text"> 最多可借 </span> 
            </span> 
            <span class="btn btn-app btn-sm btn-success no-hover"> 
	            <span class="bigger-170"> 5 </span><br />
	            <span class="text"> 最多可预约 </span> 
            </span> 
            <span class="btn btn-app btn-sm btn-primary no-hover"> 
	            <span class="bigger-170"> 0 </span><br />
	            <span class="text"> 最多可委托 </span> 
            </span> 
                        <span class="btn btn-app btn-sm btn-warning no-hover"> 
	            <span class="bigger-170"> 2 </span><br />
	            <span class="text"> 总积分</span> 
            </span> 
            <span class="btn btn-app btn-sm btn-info no-hover"> 
	            <span class="bigger-170"> 2 </span><br />
	            <span class="text"> 可用积分</span> 
            </span> 
                       </div>
        </div>
        <!--身份信息第一块结束-->
        
        <div class="space-6"></div>
        
        <!--超期图书+委托到书+预约到书+推购采纳开始-->
                <div class="row-fluid infobox-container"> 
                  <!--超期图书开始-->
                  <div class="span3 infobox infobox-green">
                    <div class="infobox-icon"><i class="icon-chao"></i></div>
                    <div class="infobox-data">
                      <div class="infobox-content">超期图书</div>
                      <span class="infobox-data-number">0</span></div>
                    <div class="infobox-book">
                     
                    </div>
                    <!--infobox-book结束-->
                  </div>
                  <!--超期图书结束--> 
                  
                  <!--委托到书开始-->
                  <div class="span3 infobox infobox-blue">
                    <div class="infobox-icon"><i class="icon-wei"></i></div>
                    <div class="infobox-data">
                      <div class="infobox-content">委托到书</div>
                      <span class="infobox-data-number">0</span></div>
                    <div class="infobox-book">
	                                        </div>
                    <!--infobox-book结束--> 
                  </div>
                  <!--委托到书结束--> 
                  
                  <!--预约到书开始-->
                  <div class="span3 infobox infobox-red">
                    <div class="infobox-icon"><i class="icon-yu"></i></div>
                    <div class="infobox-data">
                      <div class="infobox-content">预约到书</div>
                      <span class="infobox-data-number">0</span></div>
                      <div class="infobox-book">
                                        </div>
                    <!--infobox-book结束--> 
                  </div>
                  <!--预约到书结束--> 
                  
                  <!--荐购图书开始-->
                  <div class="span3 infobox infobox-orange">
                    <div class="infobox-icon"><i class="icon-jian"></i></div>
                    <div class="infobox-data">
                      <div class="infobox-content">荐购图书</div>
                      <span class="infobox-data-number"></span></div>
                    <div class="infobox-book">
	                                        </div>
                    <!--infobox-book结束--> 
                  </div>
                  <!--荐购采纳结束--> 
                </div>
        <!--超期图书+委托到书+预约到书+推购采纳结束-->
        
        
        
      </div>
      <!--page-content结束--> 
    </div>
    <!--main-content结束-->

		<div class="clear"></div>
	</div>
</div><div id="footer"><div id="copy"><p> 吉林工程技术师范学院图书馆&nbsp;&nbsp; OPAC v5.5.15.12.03  &nbsp;&nbsp;</p><p>&copy; 1999-2015 <a target="_blank" href="http://www.libsys.com.cn">Jiangsu Huiwen Software Ltd. 江苏汇文软件有限公司</a></p></div></div></body></html>