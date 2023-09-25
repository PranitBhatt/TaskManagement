<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
	<head>
	<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet" >
	    <title>Login Page</title>
	</head>
	<body>
		<div class="container">
		    <h2>Welcome to Login Page</h2> 
		    <pre>${message}</pre>
		    <form action="/login" method="POST">
		    Username:<input type="text" id="username" name="username" required>
		    Password:<input type="password" id="password" name="password" required>
		   	<input type="submit" value="Login">
		    </form>
		    <a href="register" class="btn btn-success" >Register Here</a>
	    </div>
	    <script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
		<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>