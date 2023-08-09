<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>
	<p>Welcome to your Home Page</p>
	<hr>
	<!-- display username and role -->
	<p>
		User: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities" />
	</p>
	
	<hr>
	
	
	<!-- Add a link to point to /leaders.....this is for founder -->
	<security:authorize access="hasRole('Founder')">
	<p>
		<a href="${pageContext.request.contextPath }/leader">Leadership Meetings</a>
	</p>
	</security:authorize>
	
	<form:form action="${pageContext.request.contextPath}/logout">
	<input type="submit" value="Logout" />
		
	</form:form>
</body>
</html>