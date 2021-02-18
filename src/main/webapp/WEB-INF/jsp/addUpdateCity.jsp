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
		<h2>${id != 0 ? "Modifica città" : "Aggiungi città"}</h2>
		<form action="../add-update-city">
			<input type="hidden" name="id" value=${id}> <br>
			<label>Nome città</label> <br>
			<input type="text" name="nomeCitta" value=${city.getName()}> <br>
			<label>Nazione</label> <br>
			<select name="codiceNazione">
				<c:forEach items="${nazioni}" var="naz">
				<c:choose>
					<c:when test="${naz.getCode() == city.getCountryCode()}">
						<option value="${naz.getCode()}" selected="selected">${naz.getName()}</option>
					</c:when>
					<c:otherwise>
						<option value="${naz.getCode()}">${naz.getName()}</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select> <br>
			<label>Regione</label> <br>
			<input type="text" name="regione" value=${city.getDistrict()}> <br>
			<label>Popolazione</label> <br>
			<input type="number" name="popolazione" value=${city.getPopulation()}> <br>
			<input type="submit" value="Conferma">
		</form>
		<p>${esito}</p>
	</body>
</html>