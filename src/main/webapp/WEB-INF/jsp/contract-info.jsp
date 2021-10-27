<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet">
<h2>Contract Info</h2>
<div align="right">
    Go back to <input type="button" value="main page"
                                onclick="window.location.href = '/user'">
</div>
<br/>
<form:form action="/user/save/contracts" modelAttribute="contract">
    <form:hidden path="id"/>
    <form:hidden path="phoneNumber"/>
    <form:hidden path="enabled"/>
    <form:hidden path="options"/>
    <form:hidden path="user"/>
    <br/> <br/>
<%--    Enabled <form:checkbox path="enabled"></form:checkbox>--%>
        <table border="2">
            <tr align="center">
                <th>Tariff name</th>
                <th>Tariff price</th>
                <th> Choice</th>
            </tr>
            <c:forEach var="tariff" items="${tariffs}">
                <tr align="center" style="background-color: orchid">
                    <td>${tariff.tariffName}</td>
                    <td>${tariff.price}</td>
                    <td><form:radiobutton path="tariff" value="${tariff}"></form:radiobutton></td>
                </tr>
            </c:forEach>
        </table>
    <input type="submit" value="CONFIRM">
    <br/> <br/>
</form:form>
</body>
</html>