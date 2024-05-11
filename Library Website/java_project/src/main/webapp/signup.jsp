<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="signup.jsp">
MEMBER ID :<br>
<input type="text" name="id" /><br>
MEMBER NAME :<br>
<input type="text" name="name" /><br>
CITY :<br>
<input type="text" name="city" /><br>
DATE REGISTER :<br>
<input type="text" name="reg" /><br>
DATE EXPIRE :<br>
<input type="text" name="exp" /><br>
MEMBERSHIP STATUS :<br>
<input type="text" name="status" /><br>
PASSWORD :<br>
<input type="password" name="password" /><br><br>
<input type="submit" />
</form>
</body>
</html>
<%
try
{
	
String MEMBER_ID=request.getParameter("id");
String MEMBER_NAME=request.getParameter("name");
String CITY =request.getParameter("city");
String DATE_REGISTER =request.getParameter("reg");
String DATE_EXPIRE=request.getParameter("exp");
String MEMBERSHIP_STATUS=request.getParameter("status");
String PASSWORD=request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Test@123");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into lib_members values ('"+MEMBER_ID+"','"+MEMBER_NAME+"','"+CITY+"','"+DATE_REGISTER+"','"+DATE_EXPIRE+"','"+MEMBERSHIP_STATUS+"','"+PASSWORD+"')");
out.println("Data is successfully inserted!");
}
catch(SQLException e) {
	out.println("SQLException caught: " +e.getMessage());
	}

%>
