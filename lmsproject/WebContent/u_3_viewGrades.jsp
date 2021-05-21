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
<title>Grades</title>
<link rel='stylesheet' href='styles.css'>
</head>
<body>
<div class="topnav">
  <a href="lmslogin2.html">HOME</a>
  <a href="u_profile.jsp">PROFILE</a>
  <a href="u_courses.jsp">COURSES</a>
   <a href="u_grades.jsp">GRADES</a>
   <a href="u_2_submissions.jsp">SUBMISSIONS</a>
 
  <a href="LogoutJDBC" style="float:right">Log Out</a>
</div><br>
    
        <h2> Grades</h2>
        <% 
 
		try {
			String  year = request.getParameter("year");
			String  sem = request.getParameter("sem");
			String  username = (String)session.getAttribute("un");
		       
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","test","test123");
			
			String sql = "select * from grades where year = ? and sem = ? and username = ?";
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, year);
			pstmt.setString(2, sem);
			pstmt.setString(3, username);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
		%>
        	<p><%= rs.getString(2) %></p>
		<button type="button" class="collapsible"><%= rs.getString(2) %></button>
		<div class="content">
		<h5>TEST 1 : <%= rs.getString(5) %></h5><br>
		<h5>TEST 2 : <%= rs.getString(6) %></h5><br>
		<h5>INTERNALS : <%=rs.getString(7) %></h5><br>
		<h5>SEM END : <%= rs.getString(8) %></h5><br>
		<h5>SEC : <%= rs.getString(9) %></h5><br>
		</div>
			<hr>
			<br>
			<br>
		<%	
			
			}	
	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		%>
<script>
var coll = document.getElementsByClassName("collapsible");
var i;
for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
</script>
</body>
</html>