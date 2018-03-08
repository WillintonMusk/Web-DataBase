<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<title>Cloud Store - Shopping Bag</title>
		<%  String account = request.getParameter("account");
			System.out.println(">>>>>>>>>>>>>>>>>>>>");
			System.out.println(account);%>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$('img[name="search"]').click(function(){
					var search = $('#search').val();
					window.location.href="buy.jsp?account="+<%=account%>+"&search="+search;
				});
				
				var type = "shopping";
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
						$(".showtable").append(html);
						
					},
					error:function(requset){
						alert("出错！");
					}
				});
				
				var name;var price;var color;var capacity; var ty; var amount;var rgb;
				var selected = "";
				$('.pass').click(function(){
					rgb = $(this).css('color');
					if(rgb!="rgb(255, 255, 0)"){//不为黄色时
						if(selected!=""){
							selected.css("color","white");
						}
						selected = $(this);
						
						name = $(this).children('td').eq(0).text();
						price = $(this).children('td').eq(1).text();
						color = $(this).children('td').eq(2).text();
						capacity = $(this).children('td').eq(3).text();
						ty = $(this).children('td').eq(4).text();
						amount = $(this).children('td').eq(5).text();
						
						$(this).css("color","yellow");
					}else{					//为黄色时
						$(this).css("color","white");
						selected = "";
					}
					
				});
				
				$('.button').click(function(){
					if(selected!=""){
						var button = $(this).val();
						if(button=='数量减1/移除商品'){
							type = "shopping_remove";
							if(amount>1){
								selected.children('td').eq(5).text(--amount);
							}else{
								selected.remove();
							}
							
							$.ajax({
								type:"post",
								url:"server.jsp",
								async:false,//同步
								dataType:"text",
								data:"type="+type+"&account="+<%=account%>+"&name="+name+"&price="+price+"&color="+color+"&capacity="+capacity+"&ty="+ty+"&amount="+amount,
								success:function(data){
								},
								error:function(requset){
									alert("出错！");
								}
							});
						}else if(button=='数量加1'){
							type = "shopping_add";
							selected.children('td').eq(5).text(++amount);
							
							$.ajax({
								type:"post",
								url:"server.jsp",
								async:false,//同步
								dataType:"text",
								data:"type="+type+"&account="+<%=account%>+"&name="+name+"&price="+price+"&color="+color+"&capacity="+capacity+"&ty="+ty,
								success:function(data){
								},
								error:function(requset){
									alert("出错！");
								}
							});
						}else if(button=='下单购买'){
							type = "shopping_pay";
							
							$.ajax({
								type:"post",
								url:"server.jsp",
								async:false,//同步
								dataType:"text",
								data:"type="+type+"&account="+<%=account%>+"&name="+name+"&price="+price+"&color="+color+"&capacity="+capacity+"&ty="+ty+"&amount="+amount,
								success:function(data){
									if(data=="0"){
										alert("库存不足啦！删除一些吧");
									}else{
										selected.remove();
										alert("恭喜！购买成功！");
									}
								},
								error:function(requset){
									alert("出错！");
								}
							});
						}
						
					}else{
						alert("请选择商品！");
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
			}
			
			.showtable{
				width:65%;
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
			
			.button{
				width:180px;
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
			
			
		</style>
		
	</head>
	<body>
		<div class="topbar" style="width:100%;height:100px;position:absolute;top:0px;left:0px;background-color:rgba(0,0,64,0.35);">
			<img src="image/mainlogo.jpg" width=85px height=70px style="position:relative;top:10px;left:50px;"/>
			<span id="title"><font color=#FC1F60>B</font><font color=#F93E5A>u</font><font color=#F65D54>y</font><font color=#F37C4E> </font><font color=#F09B48>i</font><font color=#EDBA42>t</font><font color=#EAD93C>!</font></span>
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
			<div class="classify" style="width:100%;height:100px;border-style:solid;border-width:0px 0px 1px 0px;border-color:#1fa5ff;">
				<p style="color:white;font-size:35px;">购物车</p>
				<p style="color:yellow;position:relative;top:10px;left:400px;font-size:10px;">*点击列表，选中想要操作的商品</p>
			</div>
			<table class="showtable" border="0" cellspacing="5">
			<tr style="color:#14a1ff;font-weight:bold;font-size:22px;"><td>产品名</td><td>价格</td><td>颜色</td><td>容量(G)</td><td>类型</td><td>数量</td><tr>
				
				
			</table>
			
			<input type='button' value='数量减1/移除商品' class='button' style="letter-spacing:1px;">&nbsp&nbsp&nbsp<input type='button' value='数量加1' class='button'>&nbsp&nbsp&nbsp<input type='button' value='下单购买' class='button'>
		</div>
		
		
	</body>
</html>