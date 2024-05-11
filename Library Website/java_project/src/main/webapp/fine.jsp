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
<h1>BOOKS MANAGEMENT</h1>
<form action="fine.jsp">
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
<td>MEMBER NAME</td>
<td>DATE ISSUE</td>
<td>DATE RETURN</td>
<td>DATE RETURNED</td>
<td>FINE AMOUNT</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select BOOK_ISSUE_NO,MEMBER_ID,MEMBER_NAME,DATE_ISSUE,DATE_RETURN,DATE_RETURNED,FINE_AMOUNT from lib_book_issue left join lib_fine_details on lib_fine_details.FINE_RANGE=lib_book_issue.FINE_RANGE order by MEMBER_ID;";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("BOOK_ISSUE_NO") %></td>
<td><%=resultSet.getString("MEMBER_ID") %></td>
<td><%=resultSet.getString("MEMBER_NAME") %></td>
<td><%=resultSet.getString("DATE_ISSUE") %></td>
<td><%=resultSet.getString("DATE_RETURN") %></td>
<td><%=resultSet.getString("DATE_RETURNED") %></td>
<td><%=resultSet.getString("FINE_AMOUNT") %></td>
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