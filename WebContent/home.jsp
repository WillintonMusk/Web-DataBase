<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<title>Cloud Store of iPhone</title>
		<%  String account = request.getParameter("account");
			System.out.println(">>>>>>>>>>>>>>>>>>>>");
			System.out.println(account);%>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$('img[name="search"]').click(function(){
					var search = $('#search').val();
					window.location.href="buy.jsp?account="+<%=account%>+"&search="+search;
				});
				
				/* var type = "home";
				$.ajax({
					type:"post",//提交需要处理的数据
					url:"server.jsp",
					async:false,//同步
					dataType:"text",
					data:"type="+type,
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
				}); */
				
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
				width:1000px;
				height:auto;
				
				margin:auto;
				margin-top:180px;
				
				/* background-color:rgba(120,142,179,0.4); */
				
			}
			/* .showtable{
				width:70%; 
				height:auto; 
				
				border-style:solid;
				border-width:1px;
				border-color:#eeeeee;
				border-radius:8px;
				
				color:white;
			} */
			
		</style>
		
	</head>
	<body>
		<div class="topbar" style="width:100%;height:100px;position:absolute;top:0px;left:0px;background-color:rgba(0,0,64,0.35);">
			<img src="image/mainlogo.jpg" width=85px height=70px style="position:relative;top:10px;left:50px;"/>
			<span id="title"><font color=#F3076D>C</font><font color=#E70E74>l</font><font color=#DB157B>o</font><font color=#CF1C82>u</font><font color=#C32389>d</font><font color=#B72A90> </font><font color=#AB3197>S</font><font color=#9F389E>t</font><font color=#933FA5>o</font><font color=#8746AC>r</font><font color=#7B4DB3>e</font><font color=#6F54BA> </font><font color=#635BC1>o</font><font color=#5762C8>f</font><font color=#4B69CF> </font><font color=#3F70D6>i</font><font color=#3377DD>P</font><font color=#277EE4>h</font><font color=#1B85EB>o</font><font color=#0F8CF2>n</font><font color=#0393F9>e</font></span>
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
			
		<div class="showb" align="center">
			<table class="showtable" border="0">
				<%-- <tr>
				<%	int i = 4;
					while(i>0){%>
						<th>第<%=i %>次</th>
						
					<% i--;}
				%>
				</tr> --%>
				<tr><td><a href="http://localhost:8000/Web-DataBase/buy.jsp?account=<%=account %>">
					<img src="image/X.jpg"/></a></td>
				
				<tr><td><a href="http://localhost:8000/Web-DataBase/buy.jsp?account=<%=account %>">
					<img src="image/8.jpg"/></a></td>
				
				<tr><td><a href="http://localhost:8000/Web-DataBase/buy.jsp?account=<%=account %>">
					<img src="image/a.jpg"/></a></td>
				
				<tr><td><a href="http://localhost:8000/Web-DataBase/buy.jsp?account=<%=account %>">
					<img src="image/c.jpg"/></a></td>
			</table>
		</div>
			
		<div style="width:70px;height:70px;position:fixed;right:25px;bottom:30px;border-radius:70px;background-color:rgba(0,0,64,0.8);">
			<a href="http://localhost:8000/Web-DataBase/shopping.jsp?account=<%=account %>">
				<img src="image/buy.jpg" width=45px height=45px style="position:relative;top:12px;left:11px;"/></a>
		</div>
		
	</body>
</html>