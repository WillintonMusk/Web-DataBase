<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<title>Cloud Store - Search Result</title>
		<%  String account = request.getParameter("account");
			System.out.println(">>>>>>>>>>>>>>>>>>>>");
			System.out.println(account);%>
			
		
		
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
			
		</style>
		
		
	</head>
	<body>
		<div class="topbar" style="width:100%;height:100px;position:absolute;top:0px;left:0px;background-color:rgba(0,0,64,0.35);">
			<img src="image/mainlogo.jpg" width=85px height=70px style="position:relative;top:10px;left:50px;"/>
			<span id="title"><font color=#FC0965>C</font><font color=#F91264>l</font><font color=#F61B63>o</font><font color=#F32462>u</font><font color=#F02D61>d</font><font color=#ED3660> </font><font color=#EA3F5F>S</font><font color=#E7485E>t</font><font color=#E4515D>o</font><font color=#E15A5C>r</font><font color=#DE635B>e</font><font color=#DB6C5A> </font><font color=#D87559>-</font><font color=#D57E58> </font><font color=#D28757>S</font><font color=#CF9056>e</font><font color=#CC9955>a</font><font color=#C9A254>r</font><font color=#C6AB53>c</font><font color=#C3B452>h</font><font color=#C0BD51> </font><font color=#BDC650>R</font><font color=#BACF4F>e</font><font color=#B7D84E>s</font><font color=#B4E14D>u</font><font color=#B1EA4C>l</font><font color=#AEF34B>t</font></span>
			<table class="topbar_table" style="width:400px;height:100px;position:absolute;top:0px;right:0px;/* background-color:rgba(0,0,64,0.35); */">
				<tr>
					<td class="button"><a href="http://localhost:8000/Web-DataBase/home.jsp?account=<%=account %>">
					<img src="image/home.jpg" width=35px height=35px/></a></td>
					
					<td class="button"><a href="http://localhost:8000/Web-DataBase/buy.jsp?account=<%=account %>">
					<img src="image/shopping.jpg" width=35px height=35px/></a></td>
					
					<td class="button"><a href="http://localhost:8000/Web-DataBase/recommend.jsp?account=<%=account %>">
					<img src="image/recommend.jpg" width=35px height=35px/></a></td>
					
					<td class="button"><a href="http://localhost:8000/Web-DataBase/file_u.jsp?account=<%=account %>">
					<img src="image/personal2.jpg" width=35px height=35px/></a></td>
				</tr>
			</table>
		</div>
			<input type="text" name="search" id="search"/><a href="http://localhost:8000/Web-DataBase/search.jsp?account=<%=account %>">
			<img src="image/search.jpg" width=30px height=30px style="position:absolute;top:110px;right:40px;"/></a>
		
		<div>
			
			
		</div>
	
	</body>
</html>