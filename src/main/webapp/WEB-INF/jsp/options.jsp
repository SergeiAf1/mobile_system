<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet">
<br/>
<h2>
    All Options
</h2>
<div align="right">
    Go back to <input type="button" value="admin page"
                                onclick="window.location.href = '/admin'">
</div>
<br>
<table border="2">
    <tr align="center">
        <th width="150">Option name</th>
        <th width="100">Price</th>
        <th  width="150">Connection price</th>
        <th  width="100">Action</th>
    </tr>
    <c:forEach var="option" items="${options}">
        <c:url var="updateButton" value="/admin/update/options">
            <c:param name="optionId" value="${option.id}"></c:param>
        </c:url>
<%--        <c:url var="deleteButton" value="/admin/delete/options">--%>
<%--            <c:param name="optionId" value="${option.id}"></c:param>--%>
<%--        </c:url>--%>
        <tr align="center">
            <td>${option.name}</td>
            <td>${option.price}</td>
            <td>${option.connectionPrice}</td>
            <td>
                <input type="button" value="Update" onclick="window
                        .location.href = '${updateButton}'"/>
<%--                <input type="button" value="Delete" onclick="window--%>
<%--                        .location.href = '${deleteButton}'"/>--%>
            </td>
        </tr>
    </c:forEach>
</table>
<br />
<input type="button" value="Add Option"
       onclick="window.location.href = '/admin/add/options'"/>
</body>
</html>