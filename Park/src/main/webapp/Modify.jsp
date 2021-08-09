<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Parkfiz</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  
  <style>
    .nav-link{
   		color:#fff; 
    }</style>
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
          <a class="nav-link" href="AdminMain.jsp" style="color:white">Home</a>
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
<%	int id=Integer.parseInt(request.getParameter("val")); %>
<div class="container">
<br><br>
  <h2>Modify Your Details</h2>
  <form action="Update" method="post">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" value=""  placeholder="Enter email" name="mail">
    </div>
    <button type="submit" value="email"  class="btn btn-light">Update</button><br><br><hr>
    <div class="form-group">
    <label for="">Address line 1:</label>
      <input type="text" class="form-control" value="" placeholder="Enter Address" name="addr1">
      </div>
    <button type="submit" value="add1"  class="btn btn-light">Update</button>
    <br><br><hr>
    <div class="form-group">
    <label for="">Slots Availability</label>
      <input type="text" class="form-control" value="" placeholder="Enter Slots" name="avail">
      </div>
    <button type="submit" value="slots"  class="btn btn-light">Update</button>
    <br><br><hr>
    <div class="form-group">
    <label for="add2">Address line 2:</label>
      <input type="text" class="form-control" value="" placeholder="Enter line2" name="addr2">
      </div>
    <button type="submit" value="add2" value="" class="btn btn-light">Update</button>
    <br><br><hr>
    <div class="form-group">
    <label for="">Name</label>
      <input type="text" class="form-control" placeholder="Enter Name" name="lot">
      </div>
    <button type="submit" value="name" value="" class="btn btn-light">Update</button>
        <br><br><hr>
  </form>
</div>

</body>
</html>
