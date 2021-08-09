<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Parkfiz</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <style>
    .bs-example{
        margin: 20px;        
    }
    .card{
    	padding:50px;
    	    padding-bottom:20px;
    	    padding-top:20px;
    	
    }
    .nav-link{
   		color:#fff; 
    }
    h4{
    margin:0;
    padding:25px;
    padding-bottom:15px;
    }
</style>
</head>
<body>
<%
	if(session.getAttribute("mail")==null){
		response.sendRedirect("Login.jsp");
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
          <a class="nav-link" href="Welcome.jsp" style="color:white">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ViewBooking.jsp" style="color:white">Bookings</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Logout" style="color:white">Logout</a>
        </li>
    </ul>
  </div>  
</nav>
<div class="container">
  <h2>Striped Rows</h2>
  <p>The .table-striped class adds zebra-stripes to a table:</p>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>ParkingLot</th>
        <th>Booking</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>

</body>
</html>