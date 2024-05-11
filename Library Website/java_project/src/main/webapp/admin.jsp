<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Functions</title>
</head>
<body>
<h1>MEMBERSHIP DETAILS</h1>
<form action="admin.jsp">
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "library";
String userid = "root";
String password = "Test@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>


<table border="1">
<tr>
<td>MEMBER ID</td>
<td>MEMBER NAME</td>
<td>DATE REGISTER</td>
<td>DATE EXPIRE</td>
<td>MEMBERSHIP STATUS</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select MEMBER_ID,MEMBER_NAME,DATE_REGISTER,DATE_EXPIRE,MEMBERSHIP_STATUS from lib_members WHERE MEMBER_NAME='AMIT';";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("MEMBER_ID") %></td>
<td><%=resultSet.getString("MEMBER_NAME") %></td>
<td><%=resultSet.getString("DATE_REGISTER") %></td>
<td><%=resultSet.getString("DATE_EXPIRE") %></td>
<td><%=resultSet.getString("MEMBERSHIP_STATUS") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>