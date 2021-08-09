<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    <script src="jquery.datetimepicker.full.min.js"></script>
  <link rel="stylesheet" href="jquery.datetimepicker.css">
<style>
.container{
padding:15px;
}
.pad{
	padding-left:250px;
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
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">Parkfiz</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav ml-auto" >
        <li class="nav-item">
          <a class="nav-link" href="index.jsp" style="color:white">Home</a>
        </li>
    </ul>
  </div>  
</nav>
<%
	int id=Integer.parseInt(request.getParameter("val"));
	PreparedStatement ps=null;
	ResultSet rs=null;
	Connection con=null;
	try{
		con=GetConnection.getCon();
		ps=con.prepareStatement("Select * from parking_lot where ParkID=?");
		ps.setInt(1,id);
		rs=ps.executeQuery();
		while(rs.next()){
	        Blob blob = rs.getBlob("Image");     
	        InputStream inputStream = blob.getBinaryStream();
	        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	        byte[] buffer = new byte[4096];
	        int bytesRead = -1;    
	        while ((bytesRead = inputStream.read(buffer)) != -1){
	            outputStream.write(buffer, 0, bytesRead);                  
	        }
	        byte[] imageBytes = outputStream.toByteArray();
	        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	%>

<div class="container">
*Please book 2 hours earlier
  <form action="Addtransaction">
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
        <input id="time2" class="form-control" placeholder="Ending Time" name="time2" required>
      </div>
	</div>
	
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
<hr>
    <hr>
	<div class="row">
	<div class="col-sm-4">
		<div class="card bg-danger text-white cost" style="width:400px; height:100px">
    		<div class="card-body">COST/HR : Rs.<%=rs.getInt("Costperhr")  %></div>
    		</div><br>
    	<div class="card" style="width:400px">
    	<img class="card-img-top" src="data:image/jpg;base64,<%=base64Image%>" style="width:100%">
    	<div class="card-body">
      		<h4 class="card-title" style="font-weight:bold"><%=rs.getString("Name")%></h4>
      		<div>
      		<hr class="dot"><%=rs.getString("Address_line") %><br><%=rs.getString("Address_line2") %><hr class="dot">
      		</div>
      		<p class="card-text"><%=rs.getString("About") %></p>
		</div>
		</div>
	</div>
	
<div class="col-sm-8 pad">
		<h3>Card Details:</h3><br>
		<input class="form-control" placeholder="Name" name="name" required><br>
		<input class="form-control" placeholder="Email" name="mail" required><br>
		<input class="form-control" placeholder="Account Number" name="acctno" required><br>
        <input class="form-control" placeholder="Expiry Thru" name="exp" required><br>
        <input class="form-control" placeholder="CVV" name="cvv" required><br>
        <button class="btn btn-danger" name="submit" value="<%=id%>" type="submit">Make Payment</button>
	</div>
	</div>
</form>
</div>
<%
		inputStream.close();
		outputStream.close();
		}
	}
	catch (Exception e){
	out.println("Unable To Display image");
	out.println("Image Display Error=" + e.getMessage());
	return;
}

%>
</body>
</html>