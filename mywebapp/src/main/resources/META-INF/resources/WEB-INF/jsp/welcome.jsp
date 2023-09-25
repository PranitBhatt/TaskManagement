<html>
	<head>
	<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet" >
		<title>Welcome page</title>
	</head>
	<body>
		<nav class="navbar navbar-expand-md navbar-light bg-light mb-3 p-1">
			<a class="navbar-brand m-1">Task Management</a>
				<div>
					<ul class="navbar-nav">
						
						<li class="nav-item"><a class="nav-link" href="/list-tasks">Tasks</a></li>
					</ul>
				</div>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="login">Logout</a></li>
				</ul>	
		</nav>
		<div class="container">
			<h1>Welcome ${name}</h1> 
			<a href="list-tasks">Manage Your Tasks</a>
		</div>
	</body>
</html>