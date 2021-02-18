<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Esercizio spring</title>
		<style>
			table, td, th {
				padding: 2px;
				text-align: center;
				border: 1px solid black;
				font-weight: normal;
			}
		</style>
	</head>
	<body>
	<a href="/continent">Lista continenti</a>
	<a href="/country?cont=${conti}">Lista nazioni</a>
	
	<h2>Lista città</h2>
	<table>
		<tr>
			<th>Città</th>
			<th>Popolazione</th>
		</tr>
	
		<c:forEach items="${city}" var="cit">
		<tr>
			<td>${cit.getName()}</td> 
			<td>${cit.getPopulation()}</td>
			<td><a href="/${cit.getId()}/form-city">Modifica</a></td> 
		</tr>
		</c:forEach>
	</table>
	</body>
</html>