<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
          <a class="nav-link" href="Welcome.jsp" style="color:white">Hi ${name}</a>
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
<%
String str=request.getParameter("location");
String wild=str+"%";
PreparedStatement ps=null;
ResultSet rs=null;
Connection con=null;
try{
	con=GetConnection.getCon();
	ps=con.prepareStatement("Select * from parking_lot where Address_line2 like ?");
	ps.setString(1,wild);
%>
<h4>Available parking lots in <%=str%> </h4><hr>
<%
	rs=ps.executeQuery();
	while(rs.next()){
        Blob blob = rs.getBlob("Image");     
        InputStream inputStream = blob.getBinaryStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;    
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);                  
        }
        byte[] imageBytes = outputStream.toByteArray();
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
        int k=rs.getInt("ParkID");
			%>
			<div class="card" style="max-width: 100%;">
        	<div class="row no-gutters">
            <div class="col-sm-3" style="background: #868e96;">
            <img src="data:image/jpg;base64,<%=base64Image%>" class="card-img-top" style="height:230px">
            </div>
            <div class="col-sm-7">
                <div class="card-body">
                    <h5 class="card-title"><%=rs.getString("Name")%></h5>
                    <p class="card-text"><%=rs.getString("Address_line") %>,<%=rs.getString("Address_line2") %><br>
                    <%=rs.getString("Zipcode") %>,<%=rs.getString("Country") %><br>
                    Opening time : <%=rs.getString("Opening") %><br> Closing Time : <%=rs.getString("Closing") %>
                    </p>
                    <a href="Booking.jsp?val=<%=k%>" class="btn btn-danger stretched-link">Book Now</a><br>
                </div>
            </div>
        </div>
    </div>
			<%
	        inputStream.close();
	        outputStream.close();
	}
}
catch (Exception e) {
	out.println("Unable To Display image");
	out.println("Image Display Error=" + e.getMessage());
	return;

	}
%>

</body>
</html>