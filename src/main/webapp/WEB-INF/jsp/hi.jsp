<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html>
<html>
<head>
<body>
	<c:forEach var="country" items="${countryList}">
		<tr>
			<td><c:out value="${country.countryName}" /></td>

		</tr>
	</c:forEach>
</body>
</head>
</html>