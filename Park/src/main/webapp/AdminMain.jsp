<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Blob" %>
<%@ page isELIgnored="false"%>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="net.parkfiz.registration.model.GetConnection" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Parkfiz</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  
<style>
.container{
padding:15px;
}
.cost{
	text-align:center;
	font-size: 30px;
	padding-bottom:0;
	padding-top:7px;
	background-color:#D5CFCD;
	font-weight:bold;
	border-radius:15px;
}
.dot{
	border-top: 1px dashed;
}

</style>
</head>
<body>
<%
	if(session.getAttribute("mail")==null){
		response.sendRedirect("AdminLogin.jsp");
	}
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">Parkfiz</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav ml-auto" >
		<li class="nav-item">
          <a class="nav-link" href="AddMain.jsp" style="color:white">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ModifyParking.jsp" style="color:white">Modify Parking</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout" style="color:white">Logout</a>
        </li>
    </ul>
  </div>  
</nav>
<div class="container">
*Make this time unavailable<br>
  <form action="Unavailable">
    <div class="row">
      <div class="col">
        <input class="form-control" id="date1" placeholder="Starting Date" name="date1" required>
      </div>
      <div class="col">
        <input class="form-control" id="time1" placeholder="Starting Time" name="time1" required>
      </div>
      <div class="col">
        <input class="form-control" id="date2" placeholder="Ending Date" name="date2" required>
      </div>
      <div class="col">
        <input id="time2" class="form-control" placeholder="Ending Time" name="time2" required><br>
      </div>
	</div>
	       <button class="btn btn-danger" name="submit" type="submit">Pause</button>
	</form>
	<hr>
    <script>
$("#date1").datetimepicker({
	timepicker:false,
	format:'Y-m-d'
});
$("#time1").datetimepicker({
	datepicker:false,
	  format:'H:i'
});
$("#date2").datetimepicker({
	timepicker:false,
	format:'Y-m-d'

});
$("#time2").datetimepicker({
	datepicker:false,
	  format:'H:i'
});
</script>
<%
PreparedStatement ps=null;
ResultSet rs=null;
Connection con=null;
try{
	con=GetConnection.getCon();
	ps=con.prepareStatement("Select * from transactions where ParkID=? and Status='Active'");
	ps.setInt(1,Integer.parseInt(session.getAttribute("id").toString()));
	rs=ps.executeQuery();
	while(rs.next()){
%>
ACTIVE CUSTOMERS<hr><br>
<table class="table table-striped">
    <thead>
      <tr>
        <th>Mail</th>
        <th>Arriving Date</th>
        <th>Arriving Time</th>
        <th>Leaving Date</th>
        <th>Leaving Time</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><%=rs.getString("Email") %></td>
        <td><%=rs.getString("Arrival_Date") %></td>
        <td><%=rs.getString("Arrival_Time") %></td>
        <td><%=rs.getString("Leaving_Date") %></td>
        <td><%=rs.getString("Leaving_Time") %></td>
        <td><button class="btn btn-danger" name="submit" value="<%=rs.getString("Email")%>" type="submit">Checkout</button></td>
      </tr>
      <tr>
      </tr>
      </tbody>
      </table>
      <%

	}
}
catch (Exception e) {
	out.println("Unable To Display image");
	out.println("Image Display Error=" + e.getMessage());
	return;

	}
%>
      
</div>
</body>
</html>