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
<h2>Tariff Info</h2>
<div align="right">
    Go back to admin page<input type="button" value="admin page"
                                onclick="window.location.href = '/admin'">
</div>
<br/>
<form:form action="/admin/save/tariffs" modelAttribute="tariff">
    <form:hidden path="id"/>
    Name <form:input path="tariffName"/>
    <br/> <br/>
    Price <form:input path="price"/>
    <br/> <br/>
    Enabled <form:checkbox path="enabled"></form:checkbox>
    <br/> <br/>
    <div id="wrapper">
        <input type="button" value="Check All" onclick="check();">
        <input type="button" value="Uncheck All" onclick="uncheck();">
        <table border="2">
            <tr align="center">
                <td>Option name</td>
                <td> Choice</td>
            </tr>
            <c:forEach var="option" items="${tariff.options}">
                <tr align="center">
                    <td>${option.name}</td>
                    <td><form:checkbox path="options" value="${option}"></form:checkbox></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <input type="submit" value="CONFIRM">
    <br/> <br/>
</form:form>
<script>
    function check() {
        var check = document.getElementsByTagName('input');
        for (var i = 0; i < check.length; i++) {
            if (check[i].type == 'checkbox') {
                check[i].checked = true;
            }
        }
    }

    function uncheck() {
        var uncheck = document.getElementsByTagName('input');
        for (var i = 0; i < uncheck.length; i++) {
            if (uncheck[i].type == 'checkbox') {
                uncheck[i].checked = false;
            }
        }
    }
</script>
</body>
</html>