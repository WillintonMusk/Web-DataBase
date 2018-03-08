<%@page import="java.io.IOException"
		import="java.sql.*"
		import="java.servlet.*"
		import="java.io.*"
		import="java.util.ArrayList"
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<title>Sever</title>
		
		<%//连接sql server数据库
			//驱动程序名称
			String drivername="com.microsoft.sqlserver.jdbc.SQLServerDriver";
			//定义数据库的URL
			String url="jdbc:sqlserver://localhost:1433;DatabaseName=iPhone_10102;";
			//定义访问数据库的用户名   
			String user="sa";
			//定义访问数据库的密码
			String psd="456123";
			
			Connection con=null;Statement st=null;ResultSet rs=null;
			try{
				Class.forName(drivername).newInstance();//1.加载驱动程序
				con=DriverManager.getConnection(url, user, psd);//2.建立连接
				st=con.createStatement();//3.创建Statement对象(在连接上执行SQL语句的容器)
				
				
		  //获取前端页面请求
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				
				String type = request.getParameter("type");//获取请求对象
				System.out.println("服务器：来自  "+type+" 的请求");
				
			//注册页面请求
				if(type.equals("register")){
					String account = request.getParameter("account");
					System.out.println(account);
					String password = request.getParameter("password");
					System.out.println(password);
					
					String qstr="select account from User_10102"
							+" where account = '"+account+"'";
					
					rs=st.executeQuery(qstr);//执行SQL语句，获得查询结果
					if(rs.next()){//查询有结果,输出查询结果
						//System.out.println("type:"+rs.getString("type"));
						System.out.println("账号已存在");
						String exist = "1";
						response.getWriter().print(exist);
						//response.getWriter().print(" 第二个字符串");
						//response.getWriter().print(" 第三个字符串");
						
					}else{//查询无果
						//System.out.println("账号不存在");
						String add = "insert into User_10102 (account, password, credit, rank) values('"+account+"', '"+password+"', '0', '0')";
						int result = st.executeUpdate(add);//执行SQL语句，获得插入结果
						if(result>0){
							System.out.println("账号保存成功");
							String exist = "0";
							response.getWriter().print(exist);
						}else{
							System.out.println("账号保存失败");
						}
					}
			//登录页面请求
				}else if(type.equals("login")){
					String account = request.getParameter("account");
					System.out.println(account);
					String password = request.getParameter("password");
					System.out.println(password);
					
					String qstr="select account, password from User_10102"
							+" where account = '"+account+"' and password = '"+password+"'";
					rs=st.executeQuery(qstr);
					if(rs.next()){//查询有结果,输出查询结果
						System.out.println("账号密码正确");
						String correct;
						if(rs.getString("account").equals("0")){
							correct = "2";
						}else{
							correct = "1";
						}
						response.getWriter().print(correct);
					}else{//查询无果
						System.out.println("账号或密码错误");
						String correct = "0";
						response.getWriter().print(correct);
					}
					
					
			//首页请求
				}else if(type.equals("home")){
					/* String qstr="select * from Product_10102";
					rs=st.executeQuery(qstr);
					while(rs.next()){
						String html = "";
						html += "<tr class='pass'><td>"+new String(rs.getString("number"))+"</td><td>"+new String(rs.getString("name"))
								+"</td><td>"+new String(rs.getString("price"))+"</td><td>"+new String(rs.getString("color"))
								+"</td><td>"+new String(rs.getString("capacity"))+"</td><td>"+new String(rs.getString("type"))+"</td></tr>";
						
						response.getWriter().print(html);
					} */
					
					
			//商品页面请求
				}else if(type.equals("buy")){
					String search = request.getParameter("search");
					System.out.println(search);
					if(search.equals("hop")){
						//无查询
						String qstr="select name, price, color, capacity, type, sales, inventory from Product_10102";
						rs=st.executeQuery(qstr);
						while(rs.next()){
							String html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
									+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
									+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("sales"))
									+"</td><td>"+new String(rs.getString("inventory"))+"</td></tr>";
							
							response.getWriter().print(html);
						}
					}else{
						String qstr="select name, price, color, capacity, type, sales, inventory from Product_10102"
								+" where name like '%"+search+"%' or price like '%"+search+"%' or color like '%"
								+search+"%' or capacity like '%"+search+"%'"+" or type like '%"+search+"%'";
						rs=st.executeQuery(qstr);
						if(rs.next()){
							String html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
									+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
									+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("sales"))
									+"</td><td>"+new String(rs.getString("inventory"))+"</td></tr>";
							
							response.getWriter().print(html);
							while(rs.next()){
								html = "";
								html += "<tr class='pass'><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
										+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
										+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("sales"))
										+"</td><td>"+new String(rs.getString("inventory"))+"</td></tr>";
								
								response.getWriter().print(html);
							}
						}else{
							String html = "";
							html += "<tr><td>抱歉！未找到相关商品！</td></tr>";
							
							response.getWriter().print(html);
						}
						
					}
			//商品页面添加请求
				}else if(type.equals("buy_add")){
					String account = request.getParameter("account");
					System.out.println(account);
					String name = request.getParameter("name");
					System.out.println(name);
					String price = request.getParameter("price");
					System.out.println(price);
					String color = request.getParameter("color");
					System.out.println(color);
					String capacity = request.getParameter("capacity");
					System.out.println(capacity);
					String ty = request.getParameter("ty");
					System.out.println(ty);
					
					String qstr="select name, price, color, capacity, type from Shopping_10102"
							+" where account= '"+account+"' and name = '"+name+"' and price = '"+price
							+"' and color = '"+color+"' and capacity = '"+capacity+"' and type = '"+ty+"'";
					rs=st.executeQuery(qstr);
					if(rs.next()){
						String ustr = "update Shopping_10102 set amount+=1"
								+" where account= '"+account+"' and name = '"+name+"' and price = '"+price
								+"' and color = '"+color+"' and capacity = '"+capacity+"' and type = '"+ty+"'";
						int result = st.executeUpdate(ustr);
						if(result>0){
							System.out.println("加购商品数量成功");
						}else{
							System.out.println("加购商品数量失败！！！！！");
						}
					}else{
						String add = "insert into Shopping_10102 values('"+account+"', '"+name
								+"', '"+price+"', '"+color+"', '"+capacity+"', '"+ty+"', '1')";
						int result = st.executeUpdate(add);
						if(result>0){
							System.out.println("添加商品成功");
						}else{
							System.out.println("添加商品失败！！！！！");
						}
					}
					
					
			//购买页面请求
				}else if(type.equals("shopping")){
					String account = request.getParameter("account");
					String qstr="select * from Shopping_10102"
							+" where account='"+account+"'";
					rs=st.executeQuery(qstr);
					
					String html = "";
					if(rs.next()){
						html = "";
						html += "<tr class='pass'><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
								+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
								+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("amount"))+"</td></tr>";
						
						response.getWriter().print(html);
						while(rs.next()){
							html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
								+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
								+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("amount"))+"</td></tr>";
							
							response.getWriter().print(html);
						}
					}else{
						html = "";
						html += "<tr><td>您的购物车空空如也~快去添加点商品吧~</td></tr>";
						
						response.getWriter().print(html);
					}
			//购买页面商品减少请求
				}else if(type.equals("shopping_remove")){
					String account = request.getParameter("account");
					System.out.println(account);
					String name = request.getParameter("name");
					System.out.println(name);
					String price = request.getParameter("price");
					System.out.println(price);
					String color = request.getParameter("color");
					System.out.println(color);
					String capacity = request.getParameter("capacity");
					System.out.println(capacity);
					String ty = request.getParameter("ty");
					System.out.println(ty);
					String amount = request.getParameter("amount");
					System.out.println(amount);
					
					int i=Integer.parseInt(amount);
					
					if(i>1){
						String ustr="update Shopping_10102 set amount -= 1"
								+" where account = '"+account+"' and name = '"+name+"' and price = '"+price+"' and color = '"+color+"' and capacity = '"
								+capacity+"' and type = '"+ty+"'";
						int result=st.executeUpdate(ustr);
						if(result>0){
							System.out.println("商品数量减一成功");
						}else{
							System.out.println("商品数量减一失败！！！");
						}
					}else{
						String ustr="delete from Shopping_10102"
								+" where account = '"+account+"' and name = '"+name+"' and price = '"+price+"' and color = '"+color+"' and capacity = '"
								+capacity+"' and type = '"+ty+"'";
						int result=st.executeUpdate(ustr);
						if(result>0){
							System.out.println("商品移除成功");
						}else{
							System.out.println("商品移除失败！！！");
						}
					}
			//购买页面商品增加请求
				}else if(type.equals("shopping_add")){
					String account = request.getParameter("account");
					System.out.println(account);
					String name = request.getParameter("name");
					System.out.println(name);
					String price = request.getParameter("price");
					System.out.println(price);
					String color = request.getParameter("color");
					System.out.println(color);
					String capacity = request.getParameter("capacity");
					System.out.println(capacity);
					String ty = request.getParameter("ty");
					System.out.println(ty);
					
					String ustr="update Shopping_10102 set amount += 1"
							+" where account = '"+account+"' and name = '"+name+"' and price = '"+price+"' and color = '"+color+"' and capacity = '"
							+capacity+"' and type = '"+ty+"'";
					int result=st.executeUpdate(ustr);
					if(result>0){
						System.out.println("商品数量加一成功");
					}else{
						System.out.println("商品数量加一失败！！！");
					}
			//购买页面商品购买请求
				}else if(type.equals("shopping_pay")){
					String account = request.getParameter("account");
					System.out.println(account);
					String name = request.getParameter("name");
					System.out.println(name);
					String price = request.getParameter("price");
					System.out.println(price);
					String color = request.getParameter("color");
					System.out.println(color);
					String capacity = request.getParameter("capacity");
					System.out.println(capacity);
					String ty = request.getParameter("ty");
					System.out.println(ty);
					String amount = request.getParameter("amount");
					System.out.println(amount);
					
					int am = Integer.parseInt(amount);
					
					String qstr="select * from Product_10102"
							+" where name = '"+name+"' and price = '"+price+"' and color = '"+color+"' and capacity = '"
							+capacity+"' and type = '"+ty+"'";
					rs=st.executeQuery(qstr);
					if(rs.next()){
						String inventory = new String(rs.getString("inventory"));
						int in = Integer.parseInt(inventory);
						
						if(am > in){
							System.out.println("库存不足！！！");
							String flag = "0";
							response.getWriter().print(flag);
						}else{
							//移除商品
							String ustr="delete from Shopping_10102"
									+" where account = '"+account+"' and name = '"+name+"' and price = '"+price+"' and color = '"+color+"' and capacity = '"
									+capacity+"' and type = '"+ty+"'";
							int result=st.executeUpdate(ustr);
							if(result>0){
								System.out.println("商品移除成功");
							}else{
								System.out.println("商品移除失败！！！");
							}
							//修改销量和库存
							ustr="update Product_10102 set sales += "+am+", inventory -= "+am
									+" where name = '"+name+"' and price = '"+price+"' and color = '"+color+"' and capacity = '"
									+capacity+"' and type = '"+ty+"'";
							result=st.executeUpdate(ustr);
							if(result>0){
								System.out.println("商品销量和库存修改成功");
							}else{
								System.out.println("商品销量和库存修改失败！！！");
							}
							
							String flag = "1";
							response.getWriter().print(flag);
						}
					}else{
						System.out.println("没有该商品！！！");
					}
					
							
			//推荐页面请求
				}else if(type.equals("recommend")){
					String account = request.getParameter("account");
					System.out.println(account);
					String name = request.getParameter("name");
					System.out.println(name);
					String price = request.getParameter("price");
					System.out.println(price);
					String color = request.getParameter("color");
					System.out.println(color);
					String capacity = request.getParameter("capacity");
					System.out.println(capacity);
					String ty = request.getParameter("ty");
					System.out.println(ty);
					
					String qstr="select name, price, color, capacity, type from Product_10102"
							+" where name = '"+name+"' and price = '"+price+"' and color = '"+color
							+"' and capacity = '"+capacity+"' and type = '"+ty+"'";
					rs=st.executeQuery(qstr);
					if(rs.next()){
						System.out.println("商品已存在");
						String flag = "0";
						response.getWriter().print(flag);
					}else{
						//添加推荐
						String add = "insert into Recommend_10102 values('"+account+"', '"+name
										+"', '"+price+"', '"+color+"', '"+capacity+"', '"+ty+"', '未通过')";
						int result = st.executeUpdate(add);
						if(result>0){
							System.out.println("推荐成功");
							String flag = "1";
							response.getWriter().print(flag);
						}else{
							System.out.println("推荐失败");
						}
					}
					
					
			//个人页面请求
				}else if(type.equals("file_u")){
					String account = request.getParameter("account");
					System.out.println(account);
					String qstr="select * from Recommend_10102"
								+" where account = '"+account+"'";
					rs=st.executeQuery(qstr);
					
					String html = "";
					html += "<tr class='pass' style='color:#14a1ff;font-weight:bold;font-size:20px;'><td>产品名</td><td>价格</td><td>颜色</td><td>容量(G)</td><td>类型</td><td>状态</td><tr>";
					response.getWriter().print(html);
					
					while(rs.next()){
						html = "";
						html += "<tr class='pass'><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
								+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
								+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("state"))+"</td></tr>";
						
						response.getWriter().print(html);
					}
			//个人页面选项请求
				}else if(type.equals("file_u_option")){
					String account = request.getParameter("account");
					System.out.println(account);
					String option = request.getParameter("option");
					System.out.println(option);
					
					if(option.equals("个人信息")){
						String qstr="select * from User_10102"
								+" where account = '"+account+"'";
						rs=st.executeQuery(qstr);
						if(rs.next()){
							//若为空，则用空串代替
							String nickname = (rs.getString("nickname")==null)?new String(""):rs.getString("nickname");
							String realname = (rs.getString("realname")==null)?new String(""):rs.getString("realname");
							String ID = (rs.getString("ID")==null)?new String(""):rs.getString("ID");
							String sex = (rs.getString("sex")==null)?new String(""):rs.getString("sex");
							String birthday = (rs.getString("birthday")==null)?new String(""):rs.getString("birthday");
							String liveplace = (rs.getString("liveplace")==null)?new String(""):rs.getString("liveplace");
							
							String html = "";
							html += "<tr class='pinfo'><td>昵称：</td><td><input type='text' value='"+nickname+"' name='nickname' class='input'></td></tr>"
									+"<tr class='pinfo'><td>真实姓名：</td><td><input type='text' value='"+realname+"' name='realname' class='input'></td></tr>"
									+"<tr class='pinfo'><td>身份证号：</td><td><input type='text' value='"+ID+"' name='ID' class='input'></td></tr>"
									+"<tr class='pinfo'><td>性别：</td><td><input type='text' value='"+sex+"' name='sex' class='input'></td></tr>"
									+"<tr class='pinfo'><td>生日：</td><td><input type='text' value='"+birthday+"' name='birthday' class='input'></td></tr>"
									+"<tr class='pinfo'><td>家庭住址：</td><td><input type='text' value='"+liveplace+"' name='liveplace' class='input'></td></tr>"
									+"<tr class='pinfo'><td colspan='2'>&nbsp&nbsp&nbsp&nbsp<input type='button' value='更新提交信息' class='button'></td></tr>";
							
							response.getWriter().print(html);
						}
					}else if(option.equals("更新提交信息")){
						String nickname = request.getParameter("nickname");
						String realname = request.getParameter("realname");
						String ID = request.getParameter("ID");
						String sex = request.getParameter("sex");
						String birthday = request.getParameter("birthday");
						String liveplace = request.getParameter("liveplace");
						
						String ustr = "update User_10102 set nickname='"+nickname+"' , realname='"+realname+"' , ID='"+ID+"' , "
								+"sex='"+sex+"' , birthday='"+birthday+"' , liveplace='"+liveplace+"'"
								+" where account = '"+account+"'";
						int result = st.executeUpdate(ustr);
						if(result>0){
							System.out.println("个人信息更改成功");
						}else{
							System.out.println("个人信息更改失败！！！");
						}
					}/* else if(option.equals("支付设置")){
						String html = "";
						html += "<tr class='pinfo'><td>啊哦，攻城狮哥哥正全力开发中...</td></tr>";
						response.getWriter().print(html);
					}else if(option.equals("交易记录")){
						String html = "";
						html += "<tr class='pinfo'><td>啊哦，攻城狮哥哥正全力开发中...</td></tr>";
						response.getWriter().print(html);
					} */else if(option.equals("推荐记录")){
						String qstr="select * from Recommend_10102"
								+" where account = '"+account+"'";
						rs=st.executeQuery(qstr);
						
						String html = "";
						html += "<tr class='pass' style='color:#14a1ff;font-weight:bold;font-size:20px;'><td>产品名</td><td>价格</td><td>颜色</td><td>容量(G)</td><td>类型</td><td>状态</td><tr>";
						response.getWriter().print(html);
						
						while(rs.next()){
							html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
									+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
									+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("state"))+"</td></tr>";
							
							response.getWriter().print(html);
						}
					}/* else if(option.equals("收货地址")){
						String html = "";
						html += "<tr class='pinfo'><td>啊哦，攻城狮哥哥正全力开发中...</td></tr>";
						response.getWriter().print(html);
					} */
					else{
						String html = "";
						html += "<tr class='pinfo'><td>啊哦，攻城狮哥哥正全力开发中...</td></tr>";
						response.getWriter().print(html);
					}
					
					
					
					
					
			//管理员获取商品请求	
				}else if(type.equals("file_m")){
					System.out.println("管理员商品表请求");
					String search = request.getParameter("search");
					System.out.println(search);
					if(search.equals("hop")){
						String qstr="select * from Product_10102";
						rs=st.executeQuery(qstr);
						while(rs.next()){
							String html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("number"))+"</td><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
									+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
									+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("sales"))
									+"</td><td>"+new String(rs.getString("inventory"))+"</td></tr>";
							
							response.getWriter().print(html);
						}
					}else{
						String qstr="select * from Product_10102"
								+" where number like '%"+search+"%' or name like '%"+search+"%' or price like '%"+search+"%' or color like '%"
								+search+"%' or capacity like '%"+search+"%'"+" or type like '%"+search+"%'";
						rs=st.executeQuery(qstr);
						if(rs.next()){
							String html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("number"))+"</td><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
									+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
									+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("sales"))
									+"</td><td>"+new String(rs.getString("inventory"))+"</td></tr>";
							
							response.getWriter().print(html);
							while(rs.next()){
								html = "";
								html += "<tr class='pass'><td>"+new String(rs.getString("number"))+"</td><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
										+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
										+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("sales"))
										+"</td><td>"+new String(rs.getString("inventory"))+"</td></tr>";
								
								response.getWriter().print(html);
							}
						}else{
							String html = "";
							html += "<tr><td>抱歉！未找到相关商品！</td><tr>";
							
							response.getWriter().print(html);
						}
						
					}
					
					
			//管理员获取推荐请求			
				}else if(type.equals("m_recommend")){
					System.out.println("管理员推荐表请求");
					String search = request.getParameter("search");
					System.out.println(search);
					
					if(search.equals("hop")){
						String qstr="select * from Recommend_10102";
						rs=st.executeQuery(qstr);
						while(rs.next()){
							String html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("account"))+"</td><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
								+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
								+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("state"))+"</td></tr>";
							
							response.getWriter().print(html);
						}
					}else{
						String qstr="select * from Recommend_10102"
								+" where account like '%"+search+"%' or name like '%"+search+"%' or price like '%"+search+"%' or color like '%"
								+search+"%' or capacity like '%"+search+"%'"+" or type like '%"+search+"%'";
						rs=st.executeQuery(qstr);
						if(rs.next()){
							String html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("account"))+"</td><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
									+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
									+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("state"))+"</td></tr>";
							
							response.getWriter().print(html);
							while(rs.next()){
								html = "";
								html += "<tr class='pass'><td>"+new String(rs.getString("account"))+"</td><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
										+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
										+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("state"))+"</td></tr>";
								
								response.getWriter().print(html);
							}
						}else{
							String html = "";
							html += "<tr><td>抱歉！未找到相关商品！</td><tr>";
							
							response.getWriter().print(html);
						}
						
					}
			//管理员更改推荐信息请求(通过)
				}else if(type.equals("m_recommend_changeP")){
					System.out.println("管理员更改推荐信息请求");
					String account = request.getParameter("account");
					System.out.println(account);
					String name = request.getParameter("name");
					System.out.println(name);
					String price = request.getParameter("price");
					System.out.println(price);
					String color = request.getParameter("color");
					System.out.println(color);
					String capacity = request.getParameter("capacity");
					System.out.println(capacity);
					String ty = request.getParameter("ty");
					System.out.println(ty);
					//修改推荐表
					String ustr="update Recommend_10102 set state='通过'"
							+" where account = '"+account+"' and name = '"+name+"' and price = '"+price+"' and color = '"
							+color+"' and capacity = '"+capacity+"' and type = '"+ty+"'";
					int result=st.executeUpdate(ustr);
					if(result>0){
						String qstr="select * from Recommend_10102"
							+" where account = '"+account+"' and name = '"+name+"' and price = '"+price+"' and color = '"
							+color+"' and capacity = '"+capacity+"' and type = '"+ty+"'";
						rs=st.executeQuery(qstr);
						while(rs.next()){
							String html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("account"))+"</td><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
								+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
								+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("state"))+"</td></tr>";
							
							response.getWriter().print(html);
						}
						
						//修改用户表
						ustr="update User_10102 set credit += 10 , rank += 1"
							+" where account = '"+account+"'";
						result=st.executeUpdate(ustr);
						if(result>0){
							System.out.println("积分、等级增加成功");
						}
						//修改商品表
						qstr="select count(*) as '商品数' from Product_10102";
						rs=st.executeQuery(qstr);
						String num = null;
						if(rs.next()){
							num = new String(rs.getString("商品数"));
							System.out.println("商品数  "+num);
							int i=Integer.parseInt(num);
							i += 1;
							num = String.valueOf(i);
						}
						ustr="insert into Product_10102 values('"+num+"', '"+name+"', '"+price+"', '"+color+"', '"+capacity+"', '"+ty+"', '0', '0')";
						result=st.executeUpdate(ustr);
						if(result>0){
							System.out.println("商品增加成功");
						}else{
							System.out.println("商品增加失败");
						}
						
						
						System.out.println("成功");
					}else{
						System.out.println("错误");
					}
			//管理员更改推荐信息请求(未通过)
				}else if(type.equals("m_recommend_changeF")){
					System.out.println("管理员更改推荐信息请求");
					String account = request.getParameter("account");
					System.out.println(account);
					String name = request.getParameter("name");
					System.out.println(name);
					String price = request.getParameter("price");
					System.out.println(price);
					String color = request.getParameter("color");
					System.out.println(color);
					String capacity = request.getParameter("capacity");
					System.out.println(capacity);
					String ty = request.getParameter("ty");
					System.out.println(ty);
					//修改推荐表
					String ustr="update Recommend_10102 set state='未通过'"
							+" where account = '"+account+"' and name = '"+name+"' and price = '"+price+"' and color = '"
							+color+"' and capacity = '"+capacity+"' and type = '"+ty+"'";
					int result=st.executeUpdate(ustr);
					if(result>0){
						String qstr="select * from Recommend_10102"
							+" where account = '"+account+"' and name = '"+name+"' and price = '"+price+"' and color = '"
							+color+"' and capacity = '"+capacity+"' and type = '"+ty+"'";
						rs=st.executeQuery(qstr);
						while(rs.next()){
							String html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("account"))+"</td><td>"+new String(rs.getString("name"))+"</td><td>"+new String(rs.getString("price"))
								+"</td><td>"+new String(rs.getString("color"))+"</td><td>"+new String(rs.getString("capacity"))
								+"</td><td>"+new String(rs.getString("type"))+"</td><td>"+new String(rs.getString("state"))+"</td></tr>";
							
							response.getWriter().print(html);
						}
						
						//修改用户表
						ustr="update User_10102 set credit -= 10 , rank -= 1"
							+" where account = '"+account+"'";
						result=st.executeUpdate(ustr);
						if(result>0){
							System.out.println("积分、等级降低成功");
						}
						//修改商品表
						ustr="delete from Product_10102"
							+" where name = '"+name+"' and price = '"+price+"' and color = '"+color+"' and capacity = '"
							+capacity+"' and type = '"+ty+"' and inventory = '0'";
						result=st.executeUpdate(ustr);
						if(result>0){
							System.out.println("商品去除成功");
						}else{
							System.out.println("商品去除失败！！！！！！");
						}
						
						System.out.println("成功");
					}else{
						System.out.println("错误");
					}
					
					
			//管理员获取用户请求		
				}else if(type.equals("m_user")){
					System.out.println("管理员用户表请求");
					String search = request.getParameter("search");
					System.out.println(search);
					if(search.equals("hop")){
						String qstr="select * from User_10102 where account != '0'";
						rs=st.executeQuery(qstr);
						while(rs.next()){
							String html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("account"))+"</td><td>"+new String(rs.getString("password"))
								+"</td><td>"+new String(rs.getString("credit"))+"</td><td>"+new String(rs.getString("rank"))+"</td></tr>";
							
							response.getWriter().print(html);
						}
					}else{
						String qstr="select * from User_10102"
								+" where account != '0' and account like '%"+search+"%' or password like '%"+search+"%' or credit like '%"
								+search+"%' or rank like '%"+search+"%'";
						rs=st.executeQuery(qstr);
						if(rs.next()){
							String html = "";
							html += "<tr class='pass'><td>"+new String(rs.getString("account"))+"</td><td>"+new String(rs.getString("password"))
							+"</td><td>"+new String(rs.getString("credit"))+"</td><td>"+new String(rs.getString("rank"))+"</td></tr>";
							
							response.getWriter().print(html);
							while(rs.next()){
								html = "";
								html += "<tr class='pass'><td>"+new String(rs.getString("account"))+"</td><td>"+new String(rs.getString("password"))
								+"</td><td>"+new String(rs.getString("credit"))+"</td><td>"+new String(rs.getString("rank"))+"</td></tr>";
								
								response.getWriter().print(html);
							}
						}else{
							String html = "";
							html += "<tr><td>抱歉！未找到相关商品！</td></tr>";
							
							response.getWriter().print(html);
						}
						
					}
					
				}
			
			
				
				
				
				response.getWriter().close();//不会返回整个页面代码
				System.out.println("服务器END");
		  //关闭资源,断开数据库连接
				if(rs!=null)rs.close();
				if(st!=null)st.close();
				if(con!=null)con.close();
			}
			catch (Throwable t){//错误处理，输出错误信息
				t.printStackTrace(System.out);
			}
			finally{//finally 语句总会被执行，即使发生错误
				try{
					if(rs!=null)
					rs.close();
				}catch(Exception e){}
				try{
					if(st!=null)
					st.close();
				}catch(Exception e){}
				try{
					if(con!=null)
					con.close();
				}catch(Exception e){}
			}
		%>
		
	</head>
	<body>
	</body>
</html>