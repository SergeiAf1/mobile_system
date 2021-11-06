<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet">
<br>
<br>
<br>
<div align="right">
    <input type="button" class="btn-danger" value="LOG OUT"
           onclick="window.location.href = '/logout'">
</div>
<br>
<br>
<h1 align="center">
    Admin main page
</h1>
<br/>
<div>
    <input style="width: 15%" type="button" value="All Options" onclick="window.location.href = '/admin/options'">
</div>
<br>
<div>
    <input style="width: 15%" type="button" value="All Tariffs" onclick="window.location.href = '/admin/tariffs'">
</div>
<br>
<div>
    <input style="width: 15%" type="button" value="All Users" onclick="window.location.href = '/admin/users'">
</div>
<br>
<div>
    <input style="width: 15%" type="button" value="All Contracts" onclick="window.location.href = '/admin/contracts'">
</div>
<br>
<div>
    <input style="width: 15%" type="button" value="User page"
           onclick="window.location.href = '/user'">
</div>
</body>
</html>