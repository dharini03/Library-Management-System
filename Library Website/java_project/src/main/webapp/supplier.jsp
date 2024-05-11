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
<h1>BOOKS SUPPLIER DETAILS</h1>
<form action="supplier.jsp">
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
<td>SUPPLIER NAME</td>
<td>ADDRESS</td>
<td>CONTACT</td>
<td>EMAIL</td>
<td>BOOK TITLE</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select SUPPLIER_NAME,ADDRESS,CONTACT,EMAIL,BOOK_TITLE from lib_book_details right join lib_supp_details on lib_book_details.SUPPLIER_ID=lib_supp_details.SUPPLIER_ID;";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("SUPPLIER_NAME") %></td>
<td><%=resultSet.getString("ADDRESS") %></td>
<td><%=resultSet.getString("CONTACT") %></td>
<td><%=resultSet.getString("EMAIL") %></td>
<td><%=resultSet.getString("BOOK_TITLE") %></td>
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