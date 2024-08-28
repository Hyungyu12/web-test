<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>가입일</th>
		</tr>
	</table>>
	<%
	String id = "root";
	String pwd = "r1r2r3";
	String url = "jdbc:mariadb://localhost:3307/ezen";
	String drivername = "org.mariadb.jdbc.Driver";
	
	Class.forName(drivername);
	Connection con = DriverManager.getConnection(url, id, pwd);
	String sql = "SELECT * FROM user_info";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>" + rs.getString("UI_NUM"));
		out.println("<td>" + rs.getString("UI_NAME"));
		out.println("<td>" + rs.getString("UI_ID"));
		out.println("<td>" + rs.getString("CREDAT"));
		out.println("</tr>");	
	}
	rs.close();
	stmt.close();
	con.close();
	%>
</body>
</html>