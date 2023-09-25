<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet" >
		
		<title>Add Task page</title>
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
			<h1>Enter Task Details</h1>
			<form:form method="post" modelAttribute="task">
			<fieldset class = "mb-3">
				<form:label path="title">Title: </form:label>
				<form:input type="text" path="title"/>
				<form:errors path="title" cssClass="text-warning"/>
			</fieldset>
			<fieldset class = "mb-3">
				<form:label path="description">Description: </form:label>
				<form:input type="text" path="description"/>
				<form:errors path="description" cssClass="text-warning"/>
			</fieldset>
			
			<fieldset class = "mb-3">
				<form:label path="targetDate">Target Date: </form:label>
				<form:input type="text" path="targetDate"/>
				<form:errors path="targetDate" cssClass="text-warning"/>
			</fieldset>
			<fieldset class = "mb-3">
				<form:label path="done">Is done: </form:label>
				<form:input type="text" path="done"/>
				<form:errors path="done" cssClass="text-warning"/>
			</fieldset>
			
				<form:input type="hidden" path="done"/>
				<form:input type="hidden" path="id"/>
				<input type="submit" class="btn btn-success"/>
			</form:form>
		</div>
		<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
		<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
	</body>
</html>