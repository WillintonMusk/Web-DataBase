<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<title>Manager File</title>
		<%  String search = request.getParameter("search");
			System.out.println(">>>>>>>>>>>>>>>>>>>>");
			if(search==null||search.equals("")){
				search = new String("hop");
			}
			System.out.println(search);%>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$('img[name="search"]').click(function(){
					var search = $('#search').val();
					window.location.href="m_recommend.jsp?search="+search;
				});
				
				var type = "m_recommend";
				$.ajax({
					type:"post",//提交需要处理的数据
					url:"server.jsp",
					async:false,//同步
					dataType:"text",
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
				

				$(".showtable").on("click","tr.pass",function(){//给动态添加的元素也绑定click
					var account = $(this).children('td').eq(0).text();
					var name = $(this).children('td').eq(1).text();
					var price = $(this).children('td').eq(2).text();
					var color = $(this).children('td').eq(3).text();
					var capacity = $(this).children('td').eq(4).text();
					var ty = $(this).children('td').eq(5).text();
					
					var state = $(this).children('td').eq(6).text();
					var tr_this = $(this);//ajax里this不起作用
					var rgb = $(this).css('color');//切换颜色
					if(state=="未通过"){
						/* $(this).css("color","#47ff72"); */
						type = "m_recommend_changeP";
						$.ajax({
							type:"post",
							url:"server.jsp",
							async:false,//同步
							dataType:"text",
							data:"type="+type+"&account="+account+"&name="+name+"&price="+price
								+"&color="+color+"&capacity="+capacity+"&ty="+ty,
							success:function(data){
								var html = "";
								for(var i=0;i<data.length;i++){
									html += data[i];
								}
								/* $(this).after("<tr><td>ggggg</td></tr>"); ajax里this不起作用
								$(this).remove(); */
								tr_this.after(html);
								tr_this = tr_this.next();
								tr_this.prev().remove();
								if(rgb=="rgb(255, 255, 0)"){
									tr_this.css("color","white");
								}else{
									tr_this.css("color","yellow");
								}
								
							},
							error:function(requset){
								alert("出错！");
							}
						}); 
					}else{
						type = "m_recommend_changeF";
						$.ajax({
							type:"post",
							url:"server.jsp",
							async:false,//同步
							dataType:"text",
							data:"type="+type+"&account="+account+"&name="+name+"&price="+price
								+"&color="+color+"&capacity="+capacity+"&ty="+ty,
							success:function(data){
								var html = "";
								for(var i=0;i<data.length;i++){
									html += data[i];
								}
								tr_this.after(html);
								tr_this = tr_this.next();
								tr_this.prev().remove();
								if(rgb=="rgb(255, 255, 0)"){
									tr_this.css("color","white");
								}else{
									tr_this.css("color","yellow");
								}
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
			.showtable{
				width:70%;
				height:auto;
				/* table-layout: fixed; */
				
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
			<span id="title"><font color=#F30C0C>C</font><font color=#E71818>l</font><font color=#DB2424>o</font><font color=#CF3030>u</font><font color=#C33C3C>d</font><font color=#B74848> </font><font color=#AB5454>S</font><font color=#9F6060>t</font><font color=#936C6C>o</font><font color=#877878>r</font><font color=#7B8484>e</font><font color=#6F9090> </font><font color=#639C9C>o</font><font color=#57A8A8>f</font><font color=#4BB4B4> </font><font color=#3FC0C0>i</font><font color=#33CCCC>P</font><font color=#27D8D8>h</font><font color=#1BE4E4>o</font><font color=#0FF0F0>n</font><font color=#03FCFC>e</font></span>
			<table class="topbar_table" style="width:400px;height:100px;position:absolute;top:0px;right:0px;/* background-color:rgba(0,0,64,0.35); */">
				<tr>
					<td class="button"><a href="http://localhost:8000/Web-DataBase/file_m.jsp">
					<img src="image/home.jpg" width=35px height=35px/></a></td>
					
					<td class="button"><a href="http://localhost:8000/Web-DataBase/m_recommend.jsp">
					<img src="image/recommend.jpg" width=35px height=35px/></a></td>
					
					<td class="button"><a href="http://localhost:8000/Web-DataBase/m_user.jsp">
					<img src="image/personal2.jpg" width=35px height=35px/></a></td>
				</tr>
			</table>
		</div>
			<input type="text" name="search" id="search"/>
			<img src="image/search.jpg" name="search" width=30px height=30px style="position:absolute;top:110px;right:40px;cursor:pointer"/>
		
		<div class="showb" align="center">
			<div class="classify" align="center" style="width:100%;height:150px;border-style:solid;border-width:0px 0px 1px 0px;border-color:#1fa5ff;">
				<span style="color:white;position:relative;top:30px;font-size:30px;">用户推荐管理</span>
				<p style="color:yellow;position:relative;top:70px;left:400px;font-size:10px;">*点击列表，进行通过或未通过操作</p>
			</div>
			<table class="showtable" border="0">
			<tr style="color:#14a1ff;font-weight:bold;font-size:22px;"><td>账号</td><td>产品名</td><td>价格</td><td>颜色</td><td>容量(G)</td><td>类型</td><td>状态</td><tr>
				
				
			</table>
		</div>
		
	</body>
</html>