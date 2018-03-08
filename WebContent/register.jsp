<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<title>Cloud Store of iPhone</title>
		
	<!-- 	<script type="text/javascript">
			if(typeof jQuery !='undefined'){
				 
			    alert("jQuery library is loaded!");
			    
			 
			}else{
			 
			    alert("jQuery library is not found!");
			 
			}
		</script> -->
		
		<!-- <script type="text/javascript">
			function testing(){
				var $obj2=$('#test');
				alert("hhh"+$obj2.val());
			}
		</script> -->
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("input[type='button']").click(function(){
					var accountValue = $("input[name='account']").val();
					var passwordValue = $("input[name='password']").val();
					var confirmValue = $("input[name='confirm']").val();
					
					if(accountValue==""||passwordValue==""){//判断非空
						alert("账号与密码不能为空！");
					}else if(passwordValue!=confirmValue){
						alert("两次密码输入不同！");//清空输入框?
					}else{
						var type = "register";
						var exist = "1";//判断用户是否存在!
						
						$.ajax({
							type:"post",//提交需要处理的数据
							url:"server.jsp",
							async:false,//同步
							//&为占位符
							data:"type="+type+"&account="+accountValue+"&password="+passwordValue,
							success:function(data){
								exist=data[0];
								/* for(var i=0;i<30;i++){
									console.log(data[i]);
								} */
							},
							error:function(requset){
								alert("出错！");
							}
						});
						
						if(exist=="1"){
							alert("账号已存在！");//清空输入框?
						}else{
							alert("注册成功！");//跳转进入个人界面!
							window.location.href="file_u.jsp?account="+accountValue;
						}
					}
				});
			});
		</script>
		
		
		<style type="text/css">
			body{
				background-color:#7B68EE;
			    background: url('image/loginb.jpg');
			    repeat: no-repeat;
			    background-attachment:fixed;
			    background-size: cover;
			    /* text-align:center; */
			    height:auto;
			    filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='image/loginb.jpg', sizingMethod='scale');
			    -ms-filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='image/loginb.jpg', sizingMethod='scale');
			    -moz-background-size: cover;
			    -webkit-background-size: cover;
			}
			#loginbox{
				width:400px;
				height:420px;
				
				margin:auto;
				position:absolute;
				top:0;left:0;bottom:0;right:0;/*溢出达到居中目的*/
				
 				/* border-style:solid;
 				border-width:1px;
 				border-color:#7EC0EE;
 				border-radius:15px; */
			}
			.image{
				margin-top:25px;
				margin-left:50px;
			}
			.input{
				width:200px;
				height:30px;
				
				position:relative;
				top:-10px;
				left:20px;
				
				background-color:rgba(185,185,185,0.25);
				border: 1px solid #c8c8c8;
				border-radius:2px;
				
				font-size:16px;
				color:white;
			}
			.button{
				width:200px;
				height:38px;
				
				position:relative;
				top:20px;
				left:100px;
				
				border:0;
				border-radius:2px;
				box-shadow: 0 1px 2px #8AC1E2 inset,0 -1px 0 #316F96 inset;
				
				font-size:20px;
				font-weight:bold;
				letter-spacing: 8px;/*字间距 */
				color:#1384cf;
				
				cursor:pointer;
			}
			.submit{
				position:relative;
				top:22px;
				left:165px;
				
				font-size:15px;
				text-decoration:underline;
				color:#d1d1d1;
				cursor:pointer;
			}
			
		</style>
	</head>
	<body>
		<!--将背景图通过一个div显示，自适应浏览器窗口  -->
		<!-- <div id="bg" style="position:absolute;top:0px;left:0px;width:100%;height:100%;">
		<img src="image/loginb.jpg" width=100% height="100%"/> -->
		
			<div class="sign in/sign up" id="loginbox">
				<!--先设置img块显示，然后利用margin居中  -->
				<img src="image/logo.jpg" style="display:block;margin:0 auto;margin-top:25px;width:85px;height:70px;"/>
				<h2 align="center" style="font-family:Georgia;color:#d1d1d1;margin-top:0px;">Cloud Store</h2>
				
				<img src="image/account.jpg" class="image"/>
				<input type="text" name="account" placeholder="   账号" class="input"><br/>
				<img src="image/password.jpg" class="image" style="margin-top:15px;"/>
				<input type="password" name="password" placeholder="   密码" class="input"><br/>
				<img src="image/confirm.jpg" class="image" style="margin-top:15px;"/>
				<input type="password" name="confirm" placeholder="   确认密码" class="input"><br/>
				<input type="button" name="register" value="注册" class="button" ><!-- onclick="register()" --><br/>
				
				<a class="submit" href="http://localhost:8000/Web-DataBase/login.jsp">用户登录></a>
			</div>
			
			
		<!-- </div> -->
	</body>
</html>