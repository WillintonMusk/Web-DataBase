<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<title>Welcome to Cloud Store!</title>
		<%  String account = request.getParameter("account");
			System.out.println(">>>>>>>>>>>>>>>>>>>>");
			System.out.println(account);%>
		
		
		<script type="text/javascript">
			$(document).ready(function(){
				$('img[name="search"]').click(function(){
					var search = $('#search').val();
					window.location.href="buy.jsp?account="+<%=account%>+"&search="+search;
				});
				
				var type = "file_u";
				
				$.ajax({
					type:"post",//提交需要处理的数据
					url:"server.jsp",
					async:false,//同步
					dataType:"text",
					data:"type="+type+"&account="+<%=account%>,
					success:function(data){
						var html = "";
						for(var i=0;i<data.length;i++){
							html += data[i];
						}
						$(".showtable").html(html);
					},
					error:function(requset){
						alert("出错！");
					}
				});
				
				type = "file_u_option";
				var option;
				$('.optiontable tr').click(function(){
					option = $(this).children('td').eq(0).text();
					if(option=='个人信息'){
						$('.option').text("个人信息");
					}else if(option=='支付设置'){
						$('.option').text("支付设置");
					}else if(option=='交易记录'){
						$('.option').text("交易记录");
					}else if(option=='推荐记录'){
						$('.option').text("推荐记录");
					}else if(option=='收货地址'){
						$('.option').text("收货地址");
					}
					$.ajax({
						type:"post",
						url:"server.jsp",
						async:false,
						data:"type="+type+"&account="+<%=account%>+"&option="+option,
						success:function(data){
							var html = "";
							for(var i=0;i<data.length;i++){
								html += data[i];
							}
							$(".showtable").html(html);
						},
						error:function(requset){
							alert("出错！");
						}
					});
				});
				
				$(".showtable").on("click","input.button",function(){
					var nickname = $(".input[name='nickname']").val();
					var realname = $(".input[name='realname']").val();
					var ID = $(".input[name='ID']").val();
					var sex = $(".input[name='sex']").val();
					var birthday = $(".input[name='birthday']").val();
					var liveplace = $(".input[name='liveplace']").val();
					option = "更新提交信息";
					
					$.ajax({
						type:"post",
						url:"server.jsp",
						async:false,
						data:"type="+type+"&account="+<%=account%>+"&option="+option+"&nickname="+nickname
							+"&realname="+realname+"&ID="+ID+"&sex="+sex+"&birthday="+birthday+"&liveplace="+liveplace,
						success:function(data){
							alert("信息提交成功！");
						},
						error:function(requset){
							alert("出错！");
						}
					});
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
			#title{
				position:relative;
				top:-13px;
				left:85px;
				
				font-size:30px;
				font-weight:bold;
			}
			#search{
				width:200px;
				height:25px;
				
				position:absolute;
				top:110px;
				right:80px;
				
				background-color:rgba(185,185,185,0);
				border: 1px solid #c8c8c8;
				border-radius:6px;
				
				font-size:16px;
				color:white;
			}
			
			.showb{
				width:800px;
				height:500px;
				margin:auto;
				margin-top:180px;
				
				/* border-style:solid;
				border-width:1px;
				border-color:#eeeeee; */
				
				color:#94d4ff;/* 左边栏字体颜色 */
			}
			.content{
				width:640px;
				height:auto;
				
				position:relative;
				top:-320px;
				left:150px;
				
				background-color:rgba(120,142,179,0.4);
				border-style:solid;
				border-width:1px;
				border-color:#1fa5ff;/* 内容大边框颜色 */
				/* border-radius:8px; */
			}
			.showtable{
				width:auto; 
				height:auto;
				
				font-size:18px;
				color:white;
			}
			.optiontable tr td{
				border-bottom:1px solid #BBB;
			}
			
			.input{
				width:180px;
				height:26px;
				
				position:relative;
				left:25px;
				
				background-color:rgba(185,185,185,0.25);
				border: 1px solid #c8c8c8;
				border-radius:2px;
				
				font-size:16px;
				color:white;
			}
			.button{
				width:200px;
				height:38px;
				
				border:0;
				border-radius:2px;
				box-shadow: 0 1px 2px #8AC1E2 inset,0 -1px 0 #316F96 inset;
				
				font-size:18px;
				font-weight:bold;
				letter-spacing:3px;
				color:#1384cf;
				
				cursor:pointer;
			}
			
			
			.pass td{
				border-bottom:1px dashed #BBB;
			}
			.pass{
				height:50px;
			}
			.pinfo{
				height:50px;
			}
			
			
		</style>
		
		
	</head>
	<body>
		<div class="topbar" style="width:100%;height:100px;position:absolute;top:0px;left:0px;background-color:rgba(0,0,64,0.35);">
			<img src="image/mainlogo.jpg" width=85px height=70px style="position:relative;top:10px;left:50px;"/>
			<span id="title"><font color=#F40B6C>W</font><font color=#E91672>e</font><font color=#DE2178>l</font><font color=#D32C7E>c</font><font color=#C83784>o</font><font color=#BD428A>m</font><font color=#B24D90>e</font><font color=#A75896> </font><font color=#9C639C>t</font><font color=#916EA2>o</font><font color=#8679A8> </font><font color=#7B84AE>C</font><font color=#708FB4>l</font><font color=#659ABA>o</font><font color=#5AA5C0>u</font><font color=#4FB0C6>d</font><font color=#44BBCC> </font><font color=#39C6D2>S</font><font color=#2ED1D8>t</font><font color=#23DCDE>o</font><font color=#18E7E4>r</font><font color=#0DF2EA>e</font><font color=#02FDF0>!</font></span>
			<table class="topbar_table" style="width:400px;height:100px;position:absolute;top:0px;right:0px;/* background-color:rgba(0,0,64,0.35); */">
				<tr>
					<td><a href="http://localhost:8000/Web-DataBase/home.jsp?account=<%=account %>">
					<img src="image/home.jpg" width=35px height=35px/></a></td>
					
					<td><a href="http://localhost:8000/Web-DataBase/buy.jsp?account=<%=account %>">
					<img src="image/shopping.jpg" width=35px height=35px/></a></td>
					
					
					<td><a href="http://localhost:8000/Web-DataBase/recommend.jsp?account=<%=account %>">
					<img src="image/recommend.jpg" width=35px height=35px/></a></td>
					
					<td><a href="http://localhost:8000/Web-DataBase/file_u.jsp?account=<%=account %>">
					<img src="image/personal2.jpg" width=35px height=35px/></a></td>
				</tr>
			</table>
		</div>
			<input type="text" name="search" id="search"/>
			<img src="image/search.jpg" name="search" width=30px height=30px style="position:absolute;top:110px;right:40px;cursor:pointer"/>
		
		<div class="showb">
			<img src="image/selfie1.jpg" width=100px height=100px style="position:relative;top:20px;left:20px;border-radius:100px;cursor:pointer;"/>
			<table class="optiontable" border=0 style="position:relative;top:40px;left:25px;font-size:20px;height:240px;">
				<tr id="pinfo" style="cursor:pointer;"><td>个人信息</td></tr>
				<tr id="paysetting" style="cursor:pointer;"><td>支付设置</td></tr>
				<tr id="pay_record" style="cursor:pointer;"><td>交易记录</td></tr>
				<tr id="reco_record" style="cursor:pointer;"><td>推荐记录</td></tr>
				<tr id="address" style="cursor:pointer;"><td>收货地址</td></tr>
			</table>
			<div class="content" align="center">
				<div style="width:100%;height:50px;border-style:solid;border-width:0px 0px 1px 0px;border-color:#1fa5ff;">
					<span class="option" style="display:block;color:white;font-size:30px;margin-top:20px;">推荐记录</span>
				</div>
				<table class="showtable" border="0" cellspacing="5" >
					
					
				</table>
			</div>
		</div>	
		
		
		<div style="width:70px;height:70px;position:fixed;right:25px;bottom:30px;border-radius:70px;background-color:rgba(0,0,64,0.8);">
			<a href="http://localhost:8000/Web-DataBase/shopping.jsp?account=<%=account %>">
				<img src="image/buy.jpg" width=45px height=45px style="position:relative;top:12px;left:11px;"/></a>
		</div>
	
	</body>
</html>