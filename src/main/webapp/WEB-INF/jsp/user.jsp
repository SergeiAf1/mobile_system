<%@ page import="com.javaschool.mobile.dto.UserDto" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet">
<br>
<br>
<div align="right">
    <input type="button" value="LOG OUT"
           onclick="window.location.href = '/logout'">
</div>
<h1 align="center">
    Hello ${user.name} !!!
</h1>
<div>
    <security:authorize access="hasRole('ADMIN')">
        Go to <input type="button" value="admin page"
                     onclick="window.location.href = '/admin'">
    </security:authorize>
</div>
<h1>${user.name} ${user.surname}</h1>
<h3>My contracts</h3>
<table id="myTable" border="2">
    <tr class="header" align="center">
        <th width="150">Phone number</th>
        <th width="100">Tariff</th>
        <th width="150">Options</th>
        <th width="150">Contract is Blocked by Operator</th>
        <th>Actions</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="contract" items="${user.contracts}">
        <c:url var="updateTariff" value="/user/update/tariffs">
            <c:param name="contract_id" value="${contract.id}"></c:param>
        </c:url>
        <c:url var="updateOptions" value="/user/update/options">
            <c:param name="contract_id" value="${contract.id}"></c:param>
        </c:url>
        <tr>
            <td align="center">${contract.phoneNumber}</td>
            <td align="center">${contract.tariffName}</td>

            <td>
                <c:forEach var="option" items="${contract.options}">
                    <li>${option}</li>
                </c:forEach>
            </td>
            <td align="center">
                <c:choose>
                    <c:when test="${contract.enabled}">No</c:when>
                    <c:otherwise>Yes</c:otherwise>
                </c:choose>
            </td>
            <c:choose>
                <c:when test="${contract.enabled == true}">
                    <td align="center">
                        <input id="updtar" type="button" value="Change tariff" onclick="window
                                .location.href = '${updateTariff}'"/>
                    </td>
                    <td align="center">
                        <input type="button" value="Change options" onclick="window
                                .location.href = '${updateOptions}'"/>
                    </td>
                </c:when>
                <c:otherwise>
                    <td align="center">
                        <input type="button" disabled="disabled" value="Change tariff" onclick="window
                                .location.href = '${updateTariff}'"/>
                    </td>
                    <td align="center">
                        <input type="button" disabled="disabled" value="Change options" onclick="window
                                .location.href = '${updateOptions}'"/>
                    </td>
                </c:otherwise>
            </c:choose>
        </tr>
    </c:forEach>
</table>
<br>
<input type="button" style="background-color: orchid" value="All Tariffs and Options"
       onclick="window.location.href = '/user/tariffs'">
<br><br>
</body>
</html>

