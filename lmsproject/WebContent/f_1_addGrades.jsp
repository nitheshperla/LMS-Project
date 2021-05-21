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
   
        
        
     <div class="naris" style="padding-left:550px; padding-right:550px;">
        	<form method="post"  action='f_1_addGrades_dba.jsp'>


<div class="nari" style="padding-left:50px; padding-top:20px;padding-bottom:20px; margin-top:50px; box-shadow: 0 20px 30px 0 rgba(0,0,0,0.25)">

<h2>Add Grades</h2>
<hr>
<br>
			<label for='uid'>Username</label>
			<input type='text' name='uname' id='uid'><br>
			<br>
			<label for='cid'>Course Name</label>
			<input type='text' name='cname' id='cid'><br>
			<br>
			 <label for="year"> Select Year</label>
			 <select name="year" id="year">
              <option>Select Year</option>
              <option value="1st">1st</option>
              <option value="2nd">2nd</option>
              <option value="3rd">3rd</option>
              <option value="4th">4th</option>
              </select><br>
              <br>
               <label for="sem"> Select sem</label>
              <select name="sem" id="sem">
               <option>Select Sem</option>
                <option value="even">Even</option>
                <option value="odd">odd</option>
             </select><br>
			<br>
			<label for='sec'>Section</label>
			<input type='text' name='sec' id='sec'><br>
			<br>
			<label for='test1'>Test1</label>
			<input type='text' name='test1' id='test1'><br>
			<br>
			<label for='test2'>Test2</label>
			<input type='text' name='test2' id='test2'><br>
			<br>
			<label for='inter'>Internals</label>
			<input type='text' name='internals' id='inter'><br>
			<br>
			<label for='semend'>Sem End</label>
			<input type='text' name='semend' id='semend'><br>
 			<br>
             <input type="submit" value="Submit">

                </form>
  </div>             
  </div> 
  </div>
    </div>
</body>
</html>