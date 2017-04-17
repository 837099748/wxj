<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML><!-- saved from url=(0061)http://tushu.jltiet.net:8080/opac/item.php?marc_no=0000202400 --><meta http-equiv="X-UA-Compatible" content="IE=Edge" />

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
        <a href="book_cart.php">暂存书架(<span id="bookcartCount">0</span>)</a> | <font color="blue"></font> <a href="login.dhtml" style="color:#ff0000;">登录</a></p>
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
	  	
	  	<a href="search.php.htm" target="_self" >简单检索</a>
	  	
	  	<a href="search_adv.php" target="_self" >全文检索</a>
	  	
	  	<a href="search_more.php" target="_self" >多字段检索</a>
	        <div class="clear"></div>
</div>


﻿<script language="JavaScript" type="text/javascript">
	$(function(){
		$('#tabs1').tabs({
			spinner: '加载中...' 
		});
		$('#tabs2').tabs({
			spinner: '加载中...' 
		});
		
		$("#accordion").accordion({
	      heightStyle: "fill", active:false,collapisable:true
	    });
		
		$("#showMoreAnchor").click(function(){
			$("#book_info dl:gt(99)").show();
			$("#showMoreAnchor").hide();
		});
		
		if($("#book_info dl").length > 99 + 1){
			$("#book_info dl:gt(99)").hide();
			$("#showMoreAnchor").show();
		} else {
			$("#showMoreAnchor").hide();
		}
			
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		$( "#dialog-form" ).dialog({
			autoOpen: false,
			modal: true 
		});
		$( "#dialog-fav" ).dialog({
			autoOpen: false,
			modal: true ,
		      buttons: {
		        "确定": function() {
	        	  $("#favMsg").load("../reader/book_shelf_ajax_addbook.php@classid=.htm" + $("#favSel option:selected").val() + "&marc_no=0000202400&time=" + new Date().getTime());	
		          $(this).dialog( "close" );
		        },
		        "取消": function() {
		          $( this ).dialog( "close" );
		        }
		      }
		});
				
		 
		$("a[title^=login_]").click(function() {
			$("#returnUrl").val(escape(location.href));
			$('#tabs1').tabs("abort" );
			$('#tabs2').tabs("abort" );
			$("#dialog-form").dialog("open" );
		});
		$("#myFav").click(function() {
			$("#returnUrl").val(escape(location.href));
			$("#dialog-form").dialog("open" );
		}) ;
			
		
		$("#spanItemMore").click(function(){
			$("#item tr:gt(30)").show();
			$("#spanItemMore").hide();
		});
		
		if($("#item tr").length > 30 + 1){
			$("#item tr:gt(30)").hide();
			$("#spanItemMore").show();
		} else {
			$("#spanItemMore").hide();
		}

		$( "#dialog_add_addr" ).dialog({
			autoOpen: false,
			modal: true,
			width: 400 ,
			height: 180
		});
	});
	
</script>
<style>
 #accordion-resizer {
    padding: 10px;
    width: 100%;
    height: 220px;
  }
</style>
<div id="mainbox">
	<div id="container">
    	<div id="sidebar_item">  				
        	<div class="left_content">
                <h4>借阅关系图</h4>
                <p class="center">
                <a target="_blank" title="点击查看详细" href="../data/book_graph.php@id=0000202400">
				<img src="${basePath}/styles/images/visual.png" border="0" width="190" height="150"/></a>
				</p>
            </div>
            <div class="left_content">
                <h4>相关资源</h4>
               	<ul class="sharing_zy">
                                	<li><a href="../../book.douban.com/isbn/978-7-5366-9293-0/default.htm" target="_blank"><img src="${basePath}/styles/images/link/douban.jpg" border="0" /></a></li>
                                	<li><a href="../../books.google.cn/books@q=_25e4_25b8_2589_25e4_25bd_2593" target="_blank"><img src="${basePath}/styles/images/link/google.jpg" border="0"  /></a></li>
                                	<li><a href="../../searchb.dangdang.com/@key=_25e4_25b8_2589_25e4_25bd_2593" target="_blank"><img src="${basePath}/styles/images/link/dangdang.jpg" border="0" /></a></li>
                                </ul><div class="clear"></div>
            </div>
            <div class="left_content">
                  <h4>收藏此书的书架 </h4>
				    					<p><a href="show_user_shelf.php@classid=0000000057">小说(7)</a></p>
					            </div>
<!--
<div class="left_content">
		<p><img id="calis_eread" src="../calis_eread/calis_logo.gif" title="点击查看CALIS E读信息"/></p>
		<p id="calis_content"></p>
		<script>
			$("#calis_eread").mouseover(function(){
				if($("#calis_content").html() == ''){
					$("#calis_content").load("../calis_eread/book_info.php?marc_no=0000202400");
					$("#calis_eread").hide();
				}
			});					
		</script>
</div>
-->
            <div class="clear"></div> 
        </div>
        <div id="content_item">
        	<div class="book_article">
            	<p id="marc">
                <span></span>
				                MARC状态：已编　
								文献类型：中文图书　浏览次数：52　 </p>
            </div>
			<div id="tabs1" style="margin:10px auto;">
                  <ul>
                      <li><a href="#tabs-1" title="intro">书目信息</a></li>
					  <li><a href="show_format_marc.php@marc_no=066751605f3e07305433003402645131053b513c" title="marc_format"><span title="spinner">机读格式(MARC)</span></a></li>
				  	                   </ul>
                  <div id="tabs-1" class="tab_article">
                  	  <div class="book_article">
		        		<div id="book_info">
		                	<div class="book_article">
                            <div id="book_pic"><img id="book_img" width="105" height="155" style=" border:1px solid #efefef;" src="${basePath}/styles/images/bookPhoto/s2768378.jpg"/></div>
		                 	<div id="item_detail" style="float:left; width:80%;">
															<dl class="booklist">
									<dt>题名/责任者:</dt>
									<dd><a href="openlink.php@title=_25e4_25b8_2589_25e4_25bd_2593">&#x4e09;&#x4f53;</a>/&#x5218;&#x6148;&#x6b23;&#x8457;</dd>
								</dl>
															<dl class="booklist">
									<dt>出版发行项:</dt>
									<dd>&#x91cd;&#x5e86;:&#x91cd;&#x5e86;&#x51fa;&#x7248;&#x793e;,&#x0032;&#x0030;&#x0030;&#x0038;</dd>
								</dl>
															<dl class="booklist">
									<dt>ISBN及定价:</dt>
									<dd>&#x0039;&#x0037;&#x0038;&#x002d;&#x0037;&#x002d;&#x0035;&#x0033;&#x0036;&#x0036;&#x002d;&#x0039;&#x0032;&#x0039;&#x0033;&#x002d;&#x0030;/&#x0043;&#x004e;&#x0059;&#x0032;&#x0033;&#x002e;&#x0030;&#x0030;</dd>
								</dl>
															<dl class="booklist">
									<dt>载体形态项:</dt>
									<dd>&#x0033;&#x0030;&#x0032;&#x9875;:&#x56fe;;&#x0032;&#x0031;&#x0063;&#x006d;</dd>
								</dl>
															<dl class="booklist">
									<dt>并列正题名:</dt>
									<dd><a href="openlink.php@title=three-body">&#x0054;&#x0068;&#x0072;&#x0065;&#x0065;&#x002d;&#x0062;&#x006f;&#x0064;&#x0079;</a></dd>
								</dl>
															<dl class="booklist">
									<dt>丛编项:</dt>
									<dd><a href="openlink.php@series=_25e4_25b8_25ad_25e5_259b_25bd_25e7_25a7_2591_25e5_25b9_25bb_25e5_259f_25ba_25e7_259f_25b3_25e4_25b8_259b_25e4_25b9_25a6">&#x4e2d;&#x56fd;&#x79d1;&#x5e7b;&#x57fa;&#x77f3;&#x4e1b;&#x4e66;</a></dd>
								</dl>
															<dl class="booklist">
									<dt>丛编项:</dt>
									<dd><a href="openlink.php@series=_25e2_2580_259c_25e5_259c_25b0_25e7_2590_2583_25e5_25be_2580_25e4_25ba_258b_25e2_2580_259d_25e4_25b8_2589_25e9_2583_25a8_25e6_259b_25b2">&#x201c;&#x5730;&#x7403;&#x5f80;&#x4e8b;&#x201d;&#x4e09;&#x90e8;&#x66f2;</a>;&#x0031;</dd>
								</dl>
															<dl class="booklist">
									<dt>个人责任者:</dt>
									<dd><a href="openlink.php@author=_25e5_2588_2598_25e6_2585_2588_25e6_25ac_25a3">&#x5218;&#x6148;&#x6b23;</a> &#x8457;</dd>
								</dl>
															<dl class="booklist">
									<dt>学科主题:</dt>
									<dd><a href="openlink.php@keyword=_25e9_2595_25bf_25e7_25af_2587_25e5_25b0_258f_25e8_25af_25b4">&#x957f;&#x7bc7;&#x5c0f;&#x8bf4;</a>-&#x4e2d;&#x56fd;-&#x5f53;&#x4ee3;</dd>
								</dl>
															<dl class="booklist">
									<dt>学科主题:</dt>
									<dd><a href="openlink.php@keyword=_25e7_25a7_2591_25e5_25ad_25a6_25e5_25b9_25bb_25e6_2583_25b3_25e5_25b0_258f_25e8_25af_25b4">&#x79d1;&#x5b66;&#x5e7b;&#x60f3;&#x5c0f;&#x8bf4;</a>-&#x4e2d;&#x56fd;-&#x5f53;&#x4ee3;</dd>
								</dl>
															<dl class="booklist">
									<dt>中图法分类号:</dt>
									<dd><a href="openlink.php@coden=i247.55">&#x0049;&#x0032;&#x0034;&#x0037;&#x002e;&#x0035;&#x0035;</a></dd>
								</dl>
															<dl class="booklist">
									<dt>相关题名附注:</dt>
									<dd>&#x82f1;&#x6587;&#x5e76;&#x5217;&#x9898;&#x540d;&#x53d6;&#x81ea;&#x4e66;&#x810a;</dd>
								</dl>
														
							<!-- 添加随书光盘 -->
														
							<dl class="booklist"><dt></dt><dd><p id="asyn_link" ></p></dd></dl>
							<dl class="booklist" id="douban_content" style="display:none;"><dt>豆瓣简介：</dt><dd><p id="intro"></p><p id="author"></p></dd></dl>
							<div style="text-align:left;color:blue;" id="showMoreAnchor" ><strong>全部MARC细节信息>></strong></div>
							</div>

                            <div class="clear"></div>
                            </div>
			                  <div id="sharing">
                              	<div style="margin:5px auto 10px auto;"><a id="put2cart" class="btn" href="javascript:add2cart();">放入暂存书架</a>　
								   <a class="btn" href="book_cart.php" target="_blank">查看暂存书架(<span id="cartCount">0</span>)</a>
								   &nbsp;&nbsp;<a class="btn" id="myFav" >收藏</a><span id="favMsg"></span>
								</div>
								 
											                 </div>   
		           		</div>
		              </div>						
                   </div>
			 </div>
			 
         	<div id="tabs2" class="tabs_M">
                  <ul>
                      <li><a href="#tab_item" title="item">馆藏信息</a></li>
					                        <li><a href="userpreg.php@marc_no=0000202400" title="login_preg"><span title="spinner">预约申请</span></a></li>
					  					   
                      <li><a href="userrelegate.php@marc_no=0000202400" title="login_relegate"><span title="spinner">委托申请</span></a></li>
					  					  <li><a href="ajax_curriculum_list.php@marc_no=0000202400" title="shelf" name="shelf"><span title="spinner">参考书架</span></a></li>
                         
                      <li><a href="ajax_review_list.php@marc_no=0000202400" title="review" name="review"><span title="spinner">图书评论</span></a></li>
                         
                      <li><a href="ajax_lend_related.php@marc_no=0000202400&call_no=i247.55_2f12" title="related_lend"><span title="spinner">相关借阅</span></a></li>
                      <li><a href="ajax_shelf_related.php@marc_no=0000202400&call_no=i247.55_2f12" title="related_shelf"><span title="spinner">相关收藏</span></a></li>
				  </ul>
                  <div id="tab_item">
                  	  <div id="accordion" >
						 
					  </div>
					  <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" id="item">
					  					          					          <tr align="left" class="greytext1">
					            <td >索书号</td>
					            <td >条码号</td>
					            <td >年卷期</td>
					            <td >馆藏地</td>
					            <td >书刊状态</td>
													         </tr>
					          					          <tr align="left" class="whitetext" >
					            <td  width="10%"  >I247.55/12 </td>
					            <td  width="15%"  >0797639</td>
					            <td  width="15%"  >&nbsp;-</td>
					            <td  width="25%" title="第一书库">
					            第一书库</span>  &nbsp;&nbsp;&nbsp;
					            					            </td>
					            <td  width="25%"  ><font color=green>可借</font></td>
																					          </tr>
					          					          <tr align="left" class="whitetext" >
					            <td  width="10%"  >I247.55/12 </td>
					            <td  width="15%"  >0797640</td>
					            <td  width="15%"  >&nbsp;-</td>
					            <td  width="25%" title="第一书库">
					            第一书库</span>  &nbsp;&nbsp;&nbsp;
					            					            </td>
					            <td  width="25%"  >借出-应还日期：2017-04-17</td>
																					          </tr>
					          					          					          					      </table>
						  								<table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
																	</table>
						 						<div id="cadal_book"></div>
						
				<div style="color:#D4A639; border:1px solid #F9F2A7; background-color:#fffcdf; text-align:center;" id="spanItemMore" ><strong>显示全部馆藏信息</strong><br /></div>
            		</div>
         	</div>
			  <div class="book_article">
            	<h5><span class="cursor">同名作者的其他著作</span></h5>
				<div id="same_author_div" style="padding-bottom:15px;"></div>
            </div>
				<div id="same_author_div" style="padding-bottom:15px;">  <table cellspacing="0" cellpadding="2" width="100%" align="center" border="0">
			    <tbody><tr class="greytext1" align="left">
			      <td>题名</td>
			      <td>出版社</td>
			      <td> 出版年 </td>
			      <td>索书号</td>
			   </tr>
			           <tr class="whitetext" align="left">
			      <td width="48%"><a target="_blank" style="color:#1970DD;" href="item.php?marc_no=0000081417">产品设计模型制作</a></td>
			      <td width="23%">化学工业出版社</td>
			      <td width="14%">2004</td>
			      <td width="15%">TU205/3</td>
			    </tr>
			       </tbody></table> 
			</div>
		            
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="dialog-form" title="登录我的图书馆">
      	<form action="../reader/redr_verify.php" name="frm_login" method="POST">
      	<input type="hidden" id="returnUrl" name="returnUrl" value="" />
	        <table width="95%" border="0" cellpadding="3" cellspacing="1">
	          <tr>
	            <td align="right">用户名： </td>
	            <td align="left"><input class="input" name="number" type="text" size="20" style="width:150px" ></td>
	          </tr>
	          <tr>
	            <td align="right">密码： </td>
	            <td align="left"><input class="input" name="passwd" type="password" size="20" style="width:150px" ></td>
	          </tr>
			          <tr>
            <td align="right">验证码： </td>
            <td align="left"><input id="captcha" class="input" name="captcha" type="text" size="20" style="width:150px" placeholder="验证码">
            </td>
          </tr>          
          <tr>
            <td align="right"></td>
            <td align="left" id="captcha_tips" ><font size="2">请输入下面显示的内容</font><br/><img id="img" src="../reader/captcha.php" /></td>
          </tr> 
          	          <tr>
	            <td align="right">&nbsp;</td>
	            <td align="left"><input  type="Radio" name="select" value="cert_no" checked="checked" />证件号
							<input type="Radio" name="select" value="bar_no" />条码号 
							<input type="Radio" name="select" value="email" />Email </td>
	          </tr>
			  <tr>
            	<td align="right">&nbsp;</td>
            	<td align="left"><input type="submit"  value="登录"></td>
		  </tr>
	        </table>
        </form> 
</div>

<div id="dialog_add_addr" title="修改我的送书地">
     	<form action="../opac/ajax_send_addr.php" onsubmit="check_send_addr()" name="frm_login" method="POST">
     	<input type="hidden" id="marcNo" name="marcNo" value="" />
     	<input type="hidden" id="fromUrl" name="fromUrl" value="" />
        <table width="95%" border="0" cellpadding="3" cellspacing="1">
          <tr>
            <td align="right">姓名： </td>
            <td align="left"><input class="input" name="sendName" id="sendName" type="text" size="20" style="width:150px" value="" readonly="readonly"></td>
          </tr>
          <tr>
            <td align="right">手机号： </td>
            <td align="left"><input class="input" name="sendMobile" id="sendMobile" type="text" size="20" style="width:150px" value="" ></td>
          </tr>
          <tr>
            <td align="right">送 书 地： </td>
            <td align="left"><input class="input" name="sendAddr" id="sendAddr" type="text" size="20" style="width:250px" value=""></td>
          </tr>
		  <tr>
           	<td colspan="2" align="center"><input type="submit" value="保存"></td>
	  </tr>
        </table>
       </form> 
</div>

<div id="dialog-fav" title="添加到我的书架">
			  收藏到：
			  	<select id="favSel" name="favSel" >
								</select>
	 <a style="color:blue" href="../reader/book_shelf_man.php">管理书架</a>
</div>
<div id="nrms-operation"></div>

<script type="text/javascript">
	
	$("#asyn_link").load("../zplug/ajax_asyn_link.php@url=.htm");
	//$("#cadal_book").load("cadal_book.php@isbn=9787536692930");
	
	function add2cart(){
		$.ajax({
   			  url: "ajax_bookcart.php@action=add&id=0000202400.htm",
   			  success: function(html){
   			     $("#put2cart").html("已放入暂存架");
				 $("#put2cart").attr('disabled','disabled');
   				 $('#bookcartCount').html($.trim(html));
				 $('#cartCount').html($.trim(html));
   			  } 
    	});
	}

	function add2fav(){
		$("#dialog-fav").dialog("open");
	}
	
	function loadSameAuthorBook(id){
		$("#same_author_div").load("ajax_same_author.php@marc_no=0000202400.htm");
	}
	
	function loadLikehoodBook(id){
		$("#likehood_book_div").load("ajax_likehood_book.php@marc_no=0000202400.htm");
		$(id).click(function(){});
	}
	var rank = 1;
	function change_rating(rating){
		rank = rating;
		var w = 14*rating; 
		document.getElementById("div_rate").style.width = w+"px";
	}
	
	function back_white(){
		document.getElementById("div_rate").style.width = "0px";
	}

	function showMore(){
		$("#detail_more").show();
		$("#showMoreAnchor").hide();
	}

	function add2shelf(classid){
		$("#favMsg").load("../reader/book_shelf_ajax_addbook.php@classid=.htm" + classid + "&marc_no=0000202400&time=" + new Date().getTime());
	}
	
	function scoreIt(marcNo){
		$.ajax({
   			  url: "ajax_score_it.php@marc_no=.htm" + marcNo + "&rank=" + rank,
   			  success: function(html){
   			     $("#score").html(html);
   				 $('#div_rate').hide();
   				 $('#div_rate_star').hide();
   			  }
    	});
	}

	function modifySendAddr(marcNo,fromUrl)
	{
		$.ajax({
			  url: "ajax_get_address_info.php.htm",
			  success: function(html){
			  	var obj = eval('(' + html + ')');
			    $("#marcNo").val(marcNo);
			    $("#fromUrl").val(fromUrl);
			    $("#sendName").val(obj['name']);
			    $("#sendAddr").val(obj['sendAddr']);
			    $("#sendMobile").val(obj['mobile']);
			    $("#dialog_add_addr").dialog("open" );
			  }
		});
	}

	function check_send_addr()
	{
		if($("#sendMobile").val() == '' )
		{
			alert('手机号为空') ;
			return false ;
		}
		else if($("#sendAddr").val()  == '' )
		{
			alert('送书地为空') ;
			return false ;
		}
		else 
			return true ;
	}

	$(function(){
		$.getJSON("ajax_douban.php@isbn=9787536692930.htm",function(json){
			$("#intro").html(json.summary );
			$("#author").html(json.author_intro);
			$("#book_img").attr("src",json.image);
			if(json.summary.length > 0 || json.author_intro.length>0 )
				$("#douban_content").show();
		});
	});
	
	document.title = "三体";
</script><div id="footer"><div id="copy"><p> 吉林工程技术师范学院图书馆&nbsp;&nbsp; OPAC v5.5.15.12.03  &nbsp;&nbsp;</p><p class="red">您正在使用 IE6 浏览器，为了获取更好的浏览体验，请升级浏览器</p><p>&copy; 1999-2015 <a target="_blank" href="../../www.libsys.com.cn/default.htm">Jiangsu Huiwen Software Ltd. 江苏汇文软件有限公司</a></p></div></div></body></html>

