<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet" >
		
		<title>List Tasks page</title>
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
			<h1>Your Tasks</h1>
			
			<div>
			<form action="list-tasks-search">
				Filter: 
				<input type="text" name="keyword"/>
				<input type="submit" value="Search"/>
				<input type="button" value="Clear" onclick="clearFilter()"/>
				
			</form>
			</div>
			
			
			<table class="table">
				<thead>
					<tr>
						<th>User name</th>
						<th>Title</th>
						<th>Description</th>
						<th>Target Date</th>
						<th>Is Done</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tasks}" var="task"> 
						<tr>
							<td>${task.username}</td>
							<td>${task.title}</td>
							<td>${task.description}</td>
							<td>${task.targetDate}</td>
							<td>${task.done}</td>
							<td><a href="update-task?id=${task.id}" class="btn btn-success">UPDATE</a></td>
							<td><a href="delete-task?id=${task.id}" class="btn btn-warning">DELETE</a></td>
						</tr>	 
					</c:forEach>
				</tbody>
			</table>
			<a href="add-task" class="btn btn-success">Add Task</a>
		</div>
		<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
		<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
		<script type="text/javascript">
		function clearFilter()
		{
			window.location = "list-tasks";
		}</script>
	</body>
</html>