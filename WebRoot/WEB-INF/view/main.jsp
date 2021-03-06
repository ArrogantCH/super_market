<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>主页面</title>
   	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<link type="text/css" rel="stylesheet" href="css/main.css"/>
	<style type="text/css">
		p a:hover{
			color:#00FFFF;
		}
	</style>
  </head>
  
  <body leftmargin="0" topmargin="0">
		<div id="main">
			<div id="top">
				<p>沃尔玛超市管理系统</p>
				<p>姶黎，欢迎登录！&nbsp;<a href="">安全退出</a></p>
			</div>
			<div id="left">
				<ul class="menu_main">
					<li class="menu_first"><a>员工管理</a>
						<ul>
							<li><a href='staff/staffList.do' target="right">员工列表</a></li>
							<li><a href='staff/addStaff.do' target="right">员工添加</a></li>
						</ul>
					</li>
					<li class="menu_first"><a>分类管理</a>
						<ul>		
							<li><a href='add_category.html' target="right">分类添加</a></li>
							<li><a href='list_category.html' target="right">分类列表</a></li>
						</ul>
					</li>
					<li class="menu_first"><a>商品管理</a>
						<ul>		
							<li><a href="" target="right">订单列表</a></li>
						</ul>
					</li>
					<li class="menu_first"><a>会员管理</a>
						<ul>
							<li><a href="" target="right">客户列表</a></li>
							<li><a href="" target="right">权限设置</a></li>
						</ul>
					</li>
					<li class="menu_first"><a>销售管理</a>
						<ul>
							<li><a href="" target="right">客户列表</a></li>
							<li><a href="" target="right">权限设置</a></li>
						</ul>
					</li>
					<li class="menu_first"><a>供应商管理</a>
						<ul>
							<li><a href="" target="right">客户列表</a></li>
							<li><a href="" target="right">权限设置</a></li>
						</ul>
					</li>
					<li class="menu_first"><a>入库管理</a>
						<ul>
							<li><a href="" target="right">客户列表</a></li>
							<li><a href="" target="right">权限设置</a></li>
						</ul>
					</li>
					<li class="menu_first"><a>出库管理</a>
						<ul>
							<li><a href="" target="right">客户列表</a></li>
							<li><a href="" target="right">权限设置</a></li>
						</ul>
					</li>
					<li class="menu_first"><a>仓库管理</a>
						<ul>
							<li><a href="" target="right">客户列表</a></li>
							<li><a href="" target="right">权限设置</a></li>
						</ul>
					</li>
					<li class="menu_first"><a>系统设置</a>
						<ul>
							<li><a href="" target="right">个人信息</a></li>
							<li><a href="modify_password.html" target="right">修改密码</a></li>
							<li><a href="add_admin.html" target="right">新增管理员</a></li>
							<li><a href="" target="right">管理员列表</a></li>
							<li><a href="" target="right">系统退出</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div id="right">
				<iframe src="welcome.html" name="right" width="100%" height="100%" frameborder="0"></iframe>
			</div>
		</div>
	</body>
	<script>
		$(function(){
			$(".menu_first > a").click(function(){
				var list = $(this).next("ul");
				list.slideToggle("fast");
			});
			
			$(".menu_first > ul > li").hover(
			function(){
				$(this).css('display','block');
				$(this).css('background','#B0C5E6');
				$(this).children('a').css('color','black');
			},function(){
				$(this).css('display','block');
				$(this).css('background-color','#F2F2F2');
				$(this).children('a').css('color','black');
			});
			$('.menu_first  li a').click(function(){
				if($(this).attr('href') == '' || $(this).attr('href')==null){
					alert('攻城狮正在东莞相亲,成功后功能将上线!!!');
					return false;
				}
			});
		});
	</script>
</html>
