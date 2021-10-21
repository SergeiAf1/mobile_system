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
    Go back to main page<input type="button" value="main page"
                                onclick="window.location.href = '/user'">
</div>
<br/>
<form:form action="/user/save/contracts" modelAttribute="contract">
    <form:hidden path="id"/>
    <form:hidden path="phoneNumber"/>
    <br/> <br/>
<%--    Enabled <form:checkbox path="enabled"></form:checkbox>--%>
        <table border="2">
            <tr align="center">
                <th>Tariff name</th>
                <th>Tariff price</th>
                <th> Choice</th>
                    <%--                <td>Options</td>--%>
            </tr>
            <c:forEach var="tariff" items="${tariffs}">
                <tr align="center" style="background-color: orchid">
                    <td>${tariff.tariffName}</td>
                    <td>${tariff.price}</td>

                    <td><form:radiobutton path="tariff" value="${tariff}"></form:radiobutton></td>


<%--                <tr>--%>
<%--                    <td>--%>
<%--                        Available options :--%>
<%--                        <c:forEach var="option" items="${tariff.options}">--%>

<%--                            <li>--%>
<%--                                    ${option.name}--%>
<%--                                <form:checkbox path="options" value="${option}"></form:checkbox>--%>
<%--                            </li>--%>
<%--                        </c:forEach>--%>
<%--                    </td>--%>
<%--                </tr>--%>

                </tr>
            </c:forEach>
        </table>
<%--    </div>--%>
    <input type="submit" value="CONFIRM">
    <br/> <br/>
</form:form>
<%--<script>--%>
<%--    function check() {--%>
<%--        var check = document.getElementsByTagName('input');--%>
<%--        for (var i = 0; i < check.length; i++) {--%>
<%--            if (check[i].type == 'checkbox') {--%>
<%--                check[i].checked = true;--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>

<%--    function uncheck() {--%>
<%--        var uncheck = document.getElementsByTagName('input');--%>
<%--        for (var i = 0; i < uncheck.length; i++) {--%>
<%--            if (uncheck[i].type == 'checkbox') {--%>
<%--                uncheck[i].checked = false;--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>