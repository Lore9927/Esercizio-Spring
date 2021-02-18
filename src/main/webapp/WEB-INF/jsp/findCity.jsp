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
	<a href="/continent">Lista continenti</a>
	<a href="/country?cont=${conti}">Lista nazioni</a>
	<h2>Cerca città</h2>
	<form action="get-city">
		<label>Nome</label> <br>
		<input type="text" name="nomeCitta"> <br>
		<label>Nazione</label> <br>
		<select name="codiceNazione">
			<option value="nessunaNazione">Nessuna nazione</option>
			<c:forEach items="${nazioni}" var="naz">
				<option value="${naz.getCode()}">${naz.getName()}</option>
			</c:forEach>
		</select> <br>
		<input type="submit" value="Cerca">
	</form>	
	</body>
</html>