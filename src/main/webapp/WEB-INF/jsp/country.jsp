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
	<a href="/find-city">Cerca città</a>
	<a href="/0/form-city">Aggiungi città</a>
	<h2>Lista nazioni</h2>
	<table>
		<tr>
			<th>Nazione</th>
			<th>Popolazione</th>
		</tr>
	
		<c:forEach items="${nazioni}" var="naz">
		<tr>
			<td><a href="/${naz.getCode()}/city">${naz.getName()}</a> </td>
			<td>${naz.getPopulation()}</td>
		</tr>
		</c:forEach>
	</table>
	</body>
</html>