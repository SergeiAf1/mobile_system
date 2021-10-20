<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet">
<br>
<br>
<div align="right">
    <input type="button" value="LOG OUT"
           onclick="window.location.href = '/logout'">
</div>
<br>
<h1 align="center">
    Hello ${user.name} !!!
</h1>
<br>
<br>
<div align="center">
    <security:authorize access="hasRole('ADMIN')">
        Go to ADMIN PAGE <input type="button" value="ADMIN PAGE"
               onclick="window.location.href = '/admin'">
    </security:authorize>
</div>
<br>
<table>
    <tr>
        <th>My name</th>
        <th>My surname</th>
        <th>My email</th>
        <th>My password</th>
    </tr>
    <tr>
        <td>${user.name}</td>
        <td>${user.surname}</td>
        <td>${user.email}</td>
        <td>${user.password}</td>
    </tr>
    <c:forEach var="user" items="${users}">
        <c:forEach var="contracts" items="${users.contracts}">
            <tr>
                <td>${user.name}</td>
                <td>${user.surname}</td>
                <td>${contracts.options}</td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>
<br>
</body>
</html>