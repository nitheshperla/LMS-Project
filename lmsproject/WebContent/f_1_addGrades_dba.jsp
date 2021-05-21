<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
    response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires","0");
	if(session == null || session.getAttribute("un") == null || session.getAttribute("pw") == null){
		response.sendRedirect("error.html");	
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Courses</title>
<link rel='stylesheet' href='styles.css'>
</head>
<body>
<div class="topnav">
  <a href="f_profile.jsp">PROFILE</a>
  <a href="f_1_addGrades.jsp">GRADES</a>
  <a href="LogoutJDBC" style="float:right">Log Out</a>
</div><br>
   
        <% 
 
		try {
			String  username = request.getParameter("uname");
		     String cname = request.getParameter("cname");
		     String year = request.getParameter("year");
		     String sem = request.getParameter("sem");
		     String test1 = request.getParameter("test1");
		     String test2 = request.getParameter("test2");
		     String internals = request.getParameter("internals");
		     String semend = request.getParameter("semend");
		     String sec = request.getParameter("sec");
		       
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","test","test123");
			
			String sql = "insert into grades values(?,?,?,?,?,?,?,?,?)";
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, username);
			pstmt.setString(2, cname);
			pstmt.setString(3, sem);
			pstmt.setString(4, year);
			pstmt.setString(5, test1);
			pstmt.setString(6, test2);
			pstmt.setString(7, internals);
			pstmt.setString(8, semend);
			pstmt.setString(9, sec);
	
			int count = pstmt.executeUpdate();
				
				if(count>0){
					out.println("<h3>Successfully Grades Added</h3>");
				} else {
					out.println("<h3>Adding failed</h3>");
				}	
	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		%>
</body>
</html>