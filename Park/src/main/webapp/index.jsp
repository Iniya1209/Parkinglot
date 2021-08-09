<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Parkfiz</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
  <link rel="stylesheet" href="styles.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/scrolreveal"></script>
  <script>
  function lookup(inputString) {
		if(inputString.length == 0) {
			$('#suggestions').hide();
		} 
		else {
			$.post("Location.jsp", {queryString: ""+inputString+""}, function(data){
			if(data.length >0) {
	  			$('#suggestions').show();
				$('#autoSuggestionsList').html(data);
			}
			});
		}
	}
	$(document).on('click','li',function(){
		$('#inputString').val($(this).text());
		$('#suggestions').hide();
	});
  </script>
</head>
<body>
<header>
	<div class="container">
		<nav class="nav">
			<a href="index.jsp"  class="logo"><img src="Images/logo.png"></a>
			<ul class="nav-list">
				<li class="nav-item">
					<a href="Login.jsp" class="nav-link">Signin</a>
				</li>
				<li class="nav-item">
					<a href="Signup" class="nav-link">Signup</a>
				</li>
			</ul>
		</nav>
	</div>
</header>
<section class="hero-img" id="hero-img">
	<div class="container">
		<h1 class="title">Parkfiz</h1>
		<div class="title-desc">
			<div class="seperator">
				<div class="line line-left"></div>
				<div class="car"><i class="fa fa-car"></i></div>
				<div class="line line-right"></div>
			</div>
		</div>
		<div class="caption">
			<h5>For an easier and faster service</h5>
		</div>
		<form action="Parkinglots.jsp" method="post">
		<div class="search-box">
		<input type="text" size="30" value="" id="inputString" name="location" class="search-txt" onkeyup="lookup(this.value);" onblur="fill();" required /><button type="submit" class="search-icon"><i class="fas fa-search"></i></button>
		</div>
		<div class="suggestionsBox" id="suggestions" style="display: none;">
		<div class="suggestionList" id="autoSuggestionsList">
		</div></div>
		</form>
		</div>

</section>
</body>
</html>