<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style>
	.failed{
		color:red;
	}
</style>
</head>
<body>
	<h3>My Login Page</h3>
	
	<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
	<!-- Check for login error -->
	<c:if test="${param.error!=null }">
		<i class= "failed">Sorry! You have entered invalid Username or Password.</i>
		
	</c:if>
	
	<p>
		User Name: <input type="text" name="username" />
	</p>	
	<p>
		Password: <input type="password" name="password" />
	</p>
	<input type="submit" value="Login" />
	</form:form>
</body>
</html>