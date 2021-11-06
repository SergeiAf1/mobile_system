<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet" class="popover-body">
<br/>
<h2>
    All Tariffs
</h2>
<div align="right">
    Go back to <input class="btn-info" type="button" value="admin page"
           onclick="window.location.href = '/admin'">
</div>

<br>
<input style="width: 10%" type="button" class="btn-outline-primary" value="Add new Tariff"
       onclick="window.location.href = '/admin/add/tariffs'"/>
<br>
<br>
<table id="myTable" border="2">
    <tr class="header" align="center">
        <th width="130">Tariff name</th>
        <th width="100">Price</th>
        <th width="150">Available options</th>
        <th width="100">Enabled</th>
        <th>Edit</th>
    </tr>
    <c:forEach var="tariff" items="${tariffs}">
        <c:url var="updateButton" value="/admin/update/tariffs">
            <c:param name="tariff_id" value="${tariff.id}"></c:param>
        </c:url>
<%--        <c:url var="deleteButton" value="/admin/delete/tariffs" >--%>
<%--            <c:param name="tariff_id" value="${tariff.id}"></c:param>--%>
<%--        </c:url>--%>
        <tr>
            <td align="center">${tariff.tariffName}</td>
            <td align="center">${tariff.price}</td>
            <td>
                <c:forEach var="option" items="${tariff.options}">
                    <li>
                        ${option}
                    </li>
                </c:forEach>
            </td>
            <td align="center">${tariff.enabled}</td>
            <td align="center">
                <input type="button" class="btn-outline-light" value="Update" formmethod="" onclick="window
                        .location.href = '${updateButton}'"/>
                </td>
<%--            <td>--%>
<%--                <input type="button" value="Delete" onclick="window--%>
<%--                        .location.href = '${deleteButton}'"/>--%>
<%--            </td>--%>
        </tr>
    </c:forEach>
</table>
<br />
</body>
</html>