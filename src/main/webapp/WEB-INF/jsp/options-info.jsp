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
<form:form action="/admin/save/options" modelAttribute="option">

    <form:hidden path="id"/>

    Name <form:input path="name"/>
    <br/> <br/>
    Price <form:input path="price"/>
    <br/> <br/>
    Connection price <form:input path="connectionPrice"/>
    <br/> <br/>

    <input type="submit" value="CONFIRM">
    <br/> <br/>

</form:form>

</body>
</html>