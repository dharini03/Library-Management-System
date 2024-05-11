<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import = "java.sql.*" %>
      <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library</title>
</head>
<body>
<h1>BOOKS MANAGEMENT</h1>
<form action="view.jsp">
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
<td>MEMBER ID</td>
<td>BOOK CODE</td>
<td>DATE ISSUE</td>
<td>DATE RETURN</td>
<td>DATE RETURNED</td>
<td>FINE RANGE</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select BOOK_ISSUE_NO,MEMBER_ID,BOOK_CODE,DATE_ISSUE,DATE_RETURN,DATE_RETURNED,FINE_RANGE from lib_book_issue where MEMBER_ID='RS001'";
//String sql ="select BOOK_ISSUE_NO,MEMBER_ID,BOOK_CODE,DATE_ISSUE,DATE_RETURN,DATE_RETURNED,FINE_RANGE from lib_book_issue where MEMBER_ID='RS002'";
//String sql ="select BOOK_ISSUE_NO,MEMBER_ID,BOOK_CODE,DATE_ISSUE,DATE_RETURN,DATE_RETURNED,FINE_RANGE from lib_book_issue where MEMBER_ID='RS003'";
//String sql ="select BOOK_ISSUE_NO,MEMBER_ID,BOOK_CODE,DATE_ISSUE,DATE_RETURN,DATE_RETURNED,FINE_RANGE from lib_book_issue where MEMBER_ID='RS004'";
//String sql ="select BOOK_ISSUE_NO,MEMBER_ID,BOOK_CODE,DATE_ISSUE,DATE_RETURN,DATE_RETURNED,FINE_RANGE from lib_book_issue where MEMBER_ID='RS005'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("BOOK_ISSUE_NO") %></td>
<td><%=resultSet.getString("MEMBER_ID") %></td>
<td><%=resultSet.getString("BOOK_CODE") %></td>
<td><%=resultSet.getString("DATE_ISSUE") %></td>
<td><%=resultSet.getString("DATE_RETURN") %></td>
<td><%=resultSet.getString("DATE_RETURNED") %></td>
<td><%=resultSet.getString("FINE_RANGE") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>