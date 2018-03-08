<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<title>Cloud Store - Recommend</title>
		<%  String account = request.getParameter("account");
			System.out.println(">>>>>>>>>>>>>>>>>>>>");
			System.out.println(account);%>
			
		<script type="text/javascript">
			$(document).ready(function(){
				$('img[name="search"]').click(function(){
					var search = $('#search').val();
					window.location.href="buy.jsp?account="+<%=account%>+"&search="+search;
				});
				
				$("input[type='button']").click(function(){
					var name = $("input[name='name']").val();
					var price = $("input[name='price']").val();
					var color = $("input[name='color']").val();
					var capacity = $("input[name='capacity']").val();
					var ty = "";
					
					if($("input[name='choice']:checked").val()=="0"){
						ty = "非合约机";
					}else{
						ty = "合约机";
					}
					
					if(name==""||price==""||color==""||capacity==""){//判断非空
						alert("各项不能为空!");
					}else{
						var type = "recommend";
						var flag = "0";//判断商品是否已经存在
						
						$.ajax({
							type:"post",//提交需要处理的数据
							url:"server.jsp",
							async:false,//同步
							data:"type="+type+"&account="+<%=account%>+"&name="+name+"&price="+price
								+"&color="+color+"&capacity="+capacity+"&ty="+ty,
							success:function(data){
								flag=data[0];
							},
							error:function(requset){
								alert("出错！");
							}
						});
						if(flag=="0"){
							alert("商品已经存在！");
						}else if(flag=="1"){
							alert("推荐成功！等待审核中...");
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
				width:600px;
				height:auto;
				
				margin:auto;
				margin-top:180px;
				
				/* background-color:rgba(229,229,229,0.5); */
				border-style:solid;
				border-width:1px;
				border-color:#1fa5ff;/* 边框颜色*/
				border-radius:8px;
				
				color:#94d4ff;/* 字体颜色*/
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
				letter-spacing:4px;/*字间距 */
				color:#1384cf;/* 按钮字体颜色*/
				
				cursor:pointer;
			}
			
		</style>
		
		
	</head>
	<body>
		<div class="topbar" style="width:100%;height:100px;position:absolute;top:0px;left:0px;background-color:rgba(0,0,64,0.35);">
			<img src="image/mainlogo.jpg" width=85px height=70px style="position:relative;top:10px;left:50px;"/>
			<span id="title"><font color=#FC046C>C</font><font color=#F90872>l</font><font color=#F60C78>o</font><font color=#F3107E>u</font><font color=#F01484>d</font><font color=#ED188A> </font><font color=#EA1C90>S</font><font color=#E72096>t</font><font color=#E4249C>o</font><font color=#E128A2>r</font><font color=#DE2CA8>e</font><font color=#DB30AE> </font><font color=#D834B4>-</font><font color=#D538BA> </font><font color=#D23CC0>R</font><font color=#CF40C6>e</font><font color=#CC44CC>c</font><font color=#C948D2>o</font><font color=#C64CD8>m</font><font color=#C350DE>m</font><font color=#C054E4>e</font><font color=#BD58EA>n</font><font color=#BA5CF0>d</font></span>
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
			<h2  style="color:#e0004b">欢迎进行商品推荐！</h2>
				<p style="margin-top:75px;">商品名：<input type="text" name="name" class="input" style="margin-left:-15px"></p>
				<p style="margin-top:20px;">价格：<input type="text" name="price" class="input"></p>
				<p style="margin-top:20px;">颜色：<input type="text" name="color" class="input"></p>
				<p style="margin-top:20px;">容量(G)：<input type="text" name="capacity" class="input" style="margin-left:-22px"></p>
				<p style="margin-top:20px;">是否为合约机：<input type="radio" name="choice" value="0" checked style="cursor:pointer;">非合约机
							 <input type="radio" name="choice" value="1" style="cursor:pointer;">合约机</p>
				<p style="margin-top:35px;"><input type="button" name="submit" value="提交推荐" class="button"></p>
		</div>
		
		
		<div style="width:70px;height:70px;position:fixed;right:25px;bottom:30px;border-radius:70px;background-color:rgba(0,0,64,0.8);">
			<a href="http://localhost:8000/Web-DataBase/shopping.jsp?account=<%=account %>">
				<img src="image/buy.jpg" width=45px height=45px style="position:relative;top:12px;left:11px;"/></a>
		</div>
			
	</body>
</html>