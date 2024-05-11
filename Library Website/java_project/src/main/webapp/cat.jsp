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
<h1>CATEGORY OF BOOKS</h1>
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
<td>CATEGORY</td>
<td>NUMBER OF BOOKS</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select CATEGORY,COUNT(CATEGORY)as NO_OF_BOOKS from lib_book_details group by CATEGORY;";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("CATEGORY") %></td>
<td><%=resultSet.getString("NO_OF_BOOKS") %></td>
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