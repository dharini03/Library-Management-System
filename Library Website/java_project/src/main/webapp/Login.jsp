<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> LOGIN FORM </h1>
<form action="Login.jsp">
MEMBER NAME :<br>
<input type="text" name="member" /><br>
PASSWORD :<br>
<input type="password" name="password" /><br><br>
<input type="submit" name="submit">
</form>

<%
String event=request.getParameter("submit");
if (event!=null){
	try
	{
	String MEMBER_NAME=request.getParameter("member");
	String PASSWORD=request.getParameter("password");
	
	String Query="select*from lib_members";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Test@123");
	Statement st = Con.createStatement();
	ResultSet rs = st.executeQuery(Query);
	rs.next();
	{
		String member2 = rs.getString("MEMBER_NAME");
     	String password2=rs.getString("PASSWORD");
     	if (MEMBER_NAME.equals(member2) && PASSWORD.equals(password2))
		{
		//out.println("login successfull");
		
     		response.sendRedirect("button.jsp") ;
		}
     	else{
     		out.println("Invalid");
     	}
     	
	
	}
	
	

	}
	catch(SQLException | ClassNotFoundException e) {
		System.out.println(e.getMessage());
	}
}
	
	
	
 

%>
</body>
</html>