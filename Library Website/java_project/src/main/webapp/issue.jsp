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
<h1>ISSUED BOOKS</h1>
<form action="issue.jsp">
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
<td>BOOK ISSUE NO</td>
<td>BOOK CODE</td>
<td>BOOK TITLE</td>
<td>DATE ISSUE</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select lib_book_issue.BOOK_ISSUE_NO,lib_book_issue.BOOK_CODE,lib_book_details.BOOK_TITLE,lib_book_issue.DATE_ISSUE from lib_book_details inner join lib_book_issue on lib_book_details.BOOK_CODE=lib_book_issue.BOOK_CODE;";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("BOOK_ISSUE_NO") %></td>
<td><%=resultSet.getString("BOOK_TITLE") %></td>
<td><%=resultSet.getString("BOOK_CODE") %></td>
<td><%=resultSet.getString("DATE_ISSUE") %></td>
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