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
<br>
<h2>Options Info</h2>
<div align="right">
    Go back to <input type="button" value="main page"
                      onclick="window.location.href = '/user'">
</div>
<br/><br/>
<div>
    <table border="2">
        <form:form action="/user/save/contracts" modelAttribute="contract">
        <form:hidden path="id"/>
        <form:hidden path="phoneNumber"/>
        <form:hidden path="tariffName"/>
        <form:hidden path="enabled"/>
        <form:hidden path="userEmail"/>
        <form:hidden path="blockedByUser"/>
        <tr align="center">
            <th width="150">Option name</th>
            <th width="70">Price</th>
            <th width="150">Connection price</th>
            <th width="100">Choice</th>
        </tr>
        <c:forEach items="${options}" var="option">
            <tr align="center">
                <td>${option.name}</td>
                <td>${option.price}</td>
                <td>${option.connectionPrice}</td>
                <td><form:checkbox path="options" value="${option.name}"></form:checkbox></td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <input type="submit" value="CONFIRM">
    </form:form>
</div>
</body>
</html>