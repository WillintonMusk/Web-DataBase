<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<title>Cloud Store - Buy</title>
		<%  String account = request.getParameter("account");
			System.out.println(">>>>>>>>>>>>>>>>>>>>");
			System.out.println(account);
			String search = request.getParameter("search");
			if(search==null||search.equals("")){
				search = new String("hop");
			}
			System.out.println(search);%>
			
			
		<script type="text/javascript">
			$(document).ready(function(){
				$('img[name="search"]').click(function(){
					var search = $('#search').val();
					window.location.href="buy.jsp?account="+<%=account%>+"&search="+search;
				});
				
				var type = "buy";
				$.ajax({
					type:"post",//提交需要处理的数据
					url:"server.jsp",
					async:false,//同步
					dataType:"text",
					//要转成var才可用 ，直接使用< % =search % >出错？？
					data:"type="+type+"&search="+"<%=search%>", 
					success:function(data){
						var html = ""; 
						for(var i=0;i<data.length;i++){
							html += data[i];
						}
						$(".showtable").append(html);
					},
					error:function(requset){
						alert("出错！");
					}
				});
				
				$('.pass').click(function(){
					var name = $(this).children('td').eq(0).text();
					var price = $(this).children('td').eq(1).text();
					var color = $(this).children('td').eq(2).text();
					var capacity = $(this).children('td').eq(3).text();
					var ty = $(this).children('td').eq(4).text();
					var inventory = $(this).children('td').eq(6).text();
					var rgb = $(this).css('color');
					var tr_this = $(this);
					if(inventory==0){
						alert("库存为零！等上货了再买吧~");
					}else{
						type = "buy_add";
						$.ajax({
							type:"post",//提交需要处理的数据
							url:"server.jsp",
							async:false,//同步
							dataType:"text",
							data:"type="+type+"&account="+<%=account%>+"&name="+name+"&price="+price+"&color="+color+"&capacity="+capacity+"&ty="+ty,
							success:function(data){
								if(rgb!="rgb(255, 255, 0)"){
									tr_this.css("color","yellow");
								}
								alert("商品已加入购物车！");
							},
							error:function(requset){
								alert("出错！");
							}
						});
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
				width:1000px;
				height:auto;
				
				margin:auto;
				margin-top:180px;
				
				background-color:rgba(120,142,179,0.4);
				border-style:solid;
				border-width:1px;
				border-color:#1fa5ff;
				/* border-radius:4px; */
			}
			.price{
				width:80px;
				height:25px;
				
				background-color:rgba(185,185,185,0);
				border: 1px solid #c8c8c8;
				border-radius:3px;
				
				font-size:16px;
				color:white;
			}
			.showtable{
				width:70%;
				height:auto;
				
				font-size:18px;
				color:white;
			}
			.showtable tr td{
				border-bottom:1px dashed #BBB;
			}
			.pass{
				height:50px;
			}
			
		</style>
		
	</head>
	<body>
		<div class="topbar" style="width:100%;height:100px;position:absolute;top:0px;left:0px;background-color:rgba(0,0,64,0.35);">
			<img src="image/mainlogo.jpg" width=85px height=70px style="position:relative;top:10px;left:50px;"/>
			<span id="title"><font color=#FC1F60>B</font><font color=#F93E5A>u</font><font color=#F65D54>y</font><font color=#F37C4E> </font><font color=#F09B48>i</font><font color=#EDBA42>t</font><font color=#EAD93C>!</font><font color=#E7F836> </font><font color=#E0D219>G</font><font color=#C1D832>e</font><font color=#A2DE4B>t</font><font color=#83E464> </font><font color=#64EA7D>i</font><font color=#45F096>t</font><font color=#26F6AF>!</font><font color=#07FCC8> </font></span>
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
			<input type="text" name="search" id="search"/>
			<img src="image/search.jpg" name="search" width=30px height=30px  style="position:absolute;top:110px;right:40px;cursor:pointer"/>
		
		<div class="showb" align="center">
			<div class="classify" align="center" style="width:100%;height:100px;border-style:solid;border-width:0px 0px 1px 0px;border-color:#1fa5ff;">
				<p style="color:white;font-size:35px;">选购 iPhone</p>
				<!-- <p style="color:white;position:relative;top:20px;">价格区间：<input type="text" name="min" class="price"/>&nbsp-&nbsp<input type="text" name="max" class="price"/></p> -->
				<p style="color:yellow;position:relative;top:10px;left:400px;font-size:10px;">*点击列表，添加商品至购物车</p>
			</div>
			<table class="showtable" border="0" cellspacing="5">
			<tr style="color:#14a1ff;font-weight:bold;font-size:22px;"><td>产品名</td><td>价格</td><td>颜色</td><td>容量(G)</td><td>类型</td><td>已售</td><td>库存</td><tr>
				
				
			</table>
		</div>
		
		
		<div style="width:70px;height:70px;position:fixed;right:25px;bottom:30px;border-radius:70px;background-color:rgba(0,0,64,0.8);">
			<a href="http://localhost:8000/Web-DataBase/shopping.jsp?account=<%=account %>">
				<img src="image/buy.jpg" width=45px height=45px style="position:relative;top:12px;left:11px;"/></a>
		</div>
			
	</body>
</html>