<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
	<head>
	<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet" >
		<title>My Register page</title>
	</head>
	<body>
		<div class="container">
			<h2>Welcome to  Register Page</h2>
			<pre>${message}</pre>
			<form id="register" action="register" method="post">
			Enter UserName:  <input type="text" name="username">
			Enter Password: <input type="password" name="password">
			<input type="submit" value="Register">
			</form>
			<a href="login" class="btn btn-success" >Login Here</a>
		</div>
		<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
		<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
	</body>
</html>