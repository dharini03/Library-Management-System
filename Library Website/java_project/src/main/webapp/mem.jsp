<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library</title>
</head>
<body>
<h1>MEMBERSHIP STATUS</h1>
<form action="cat.jsp">
</form>
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
<td>MEMBERSHIP STATUS</td>
<td>NUMBER OF MEMBERS</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select MEMBERSHIP_STATUS,count(MEMBERSHIP_STATUS) as NO_OF_MEMBERS from lib_members group by MEMBERSHIP_STATUS having COUNT(MEMBERSHIP_STATUS);";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("MEMBERSHIP_STATUS") %></td>
<td><%=resultSet.getString("NO_OF_MEMBERS") %></td>
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