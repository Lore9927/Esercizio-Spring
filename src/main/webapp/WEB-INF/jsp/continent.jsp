<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Esercizio spring</title>
	</head>
	<body>
		<h2>Lista continenti</h2>
		<c:forEach items="${continenti}" var="cont">
		<a href="/country?cont=${cont.getContinent()}">${cont.getContinent()}</a> <br>
	</c:forEach>
	</body>
</html>