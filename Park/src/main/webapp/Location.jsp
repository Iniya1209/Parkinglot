<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String str=request.getParameter("queryString");
		String wild="%"+str+"%";
		String url="jdbc:mysql://localhost:3306/parking";
		String username="root";
		String pwd="qwerty";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,pwd);
			PreparedStatement ps=null;
			ps=con.prepareStatement("Select * from parking_lot where Address_line2 like ?");
			ps.setString(1,wild);
			ResultSet rs=ps.executeQuery();
	        ArrayList<String> arr =new ArrayList<String>(); 
			while(rs.next()){
				if(!arr.contains(rs.getString("Address_line2")))
					arr.add(rs.getString("Address_line2"));
			}
			for(String s:arr){
				out.println("<li>"+s+"</li>");
			}
			con.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
%>
</body>
</html>