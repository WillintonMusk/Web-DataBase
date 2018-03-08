<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<title>Cloud Store of iPhone</title>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("input[type='button']").click(function(){
					var accountValue = $("input[name='account']").val();
					var passwordValue = $("input[name='password']").val();
					
					if(accountValue==""||passwordValue==""){//判断非空
						alert("账号与密码不能为空!");
					}else{
						var type = "login";
						var correct = "0";//判断密码是否正确
						
						$.ajax({
							type:"post",//提交需要处理的数据
							url:"server.jsp",
							async:false,//同步
							data:"type="+type+"&account="+accountValue+"&password="+passwordValue,
							success:function(data){
								correct=data[0];
							},
							error:function(requset){
								alert("出错！");
							}
						});
						
						if(correct=="0"){
							alert("账号或密码错误！");
						}else if(correct=="1"){
							//alert("登陆成功！");//跳转进入用户界面
							window.location.href="file_u.jsp?account="+accountValue;
						}else if(correct=="2"){//跳转进入管理员界面
							window.location.href="file_m.jsp";
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
				height:380px;
				
				margin:auto;
				position:absolute;
				top:0;left:0;bottom:0;right:0;/*溢出达到居中目的*/
				
				/* background-color:#a200ff; */
 				/* border-style:solid;
 				border-width:1px;
 				border-color:#7EC0EE;
 				border-radius:15px; */
				
 				/*vertical-align:middle;
 				text-align:center;*/
			}
			.image{
				margin-top:20px;
				margin-left:50px;
			}
			.input{
				width:200px;
				height:30px;
				
				position:relative;
				top:-8px;
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
				top:25px;
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
				top:26px;
				left:163px;
				
				font-size:15px;
				text-decoration:underline;
				color:#d1d1d1;
				cursor:pointer;/* 鼠标变为手指 */
			}
			
		</style>
	</head>
	<body>
		<div class="sign in/sign up" id="loginbox">
			<!--先设置img块显示，然后利用margin居中  -->
			<img src="image/logo.jpg" style="display:block;margin:0 auto;margin-top:25px;width:85px;height:70px;"/>
			<h2 align="center" style="font-family:Georgia;color:#d1d1d1;margin-top:0px;">Cloud Store</h2>
				
			<img src="image/account.jpg" class="image"/>
			<input type="text" name="account" placeholder="   账号" class="input"><br/>
			<img src="image/password.jpg" class="image" style="margin-top:15px;"/>
			<input type="password" name="password" placeholder="   密码" class="input"><br/>
			<input type="button" name="login" value="登录" class="button"><br/>
				
			<a class="submit" href="http://localhost:8000/Web-DataBase/register.jsp">用户注册></a>
		</div>
		
	</body>
</html>