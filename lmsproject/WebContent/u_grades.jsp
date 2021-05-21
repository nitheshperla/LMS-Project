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
   
           
     <div class="naris" style="padding-left:580px; padding-right:550px;">
        	<form method="post"  action='u_3_viewGrades.jsp'>


<div class="nari" style="padding-left:10px; padding-top:20px;padding-bottom:20px; margin-top:50px; box-shadow: 0 30px 50px 0 rgba(0,0,0,0.25)">
 <h2>Select Course</h2>
 <hr>
                      <label for="year"> Select Year AND SEM  </label>
                    <div>  <br>
                       
                			 <select name="year" id="year">
                			 		<option>Select Year</option>
                			 		<option value="1st">1st</option>
                			 		<option value="2nd">2nd</option>
                			 		<option value="3rd">3rd</option>
                			 		<option value="4th">4th</option>
                		       
                		        </select><br>
                		          <br>
                		         <select name="sem" id="sem">
                			 		<option>Select Sem</option>
                		        	<option value="even">Even</option>
                			 		<option value="odd">odd</option>
                		        </select>
   						
                    </div>
   <br>
                    <input type="submit" value="Search">

                </form>
    </div>
</body>
</html>