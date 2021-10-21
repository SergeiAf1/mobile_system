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
<h2>Options Info</h2>
<div align="right">
    Go back to admin page<input type="button" value="admin page"
                                onclick="window.location.href = '/admin'">
</div>
<br/>
<form:form action="/user/save/contracts" modelAttribute="contract">
    <form:hidden path="id"/>
    <form:hidden path="phoneNumber"/>
    <form:hidden path="tariff"/>
    <div>
        <table border="2">
            <tr align="center">
                <td>Option name</td>
                <td>Price</td>
                <td>Connection price</td>
                <td>Choice</td>
            </tr>

            <c:forEach items="${options}" var="option">
            <tr align="center">
                <td>${option.name}</td>
                <td>${option.price}</td>
                <td>${option.connectionPrice}</td>
                <td><form:checkbox path="options" value="${option}"></form:checkbox></td>
            </tr>

            </c:forEach>


    </div>

    <input type="submit" value="CONFIRM">

</form:form>

</body>
</html>