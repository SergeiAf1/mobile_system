<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: #ffa6fc" class="modal-body">
<div class="col-sm-12">
    <c:if test="${user.name == null}">
        <h2 align="center">Add new user</h2>
    </c:if>
    <c:if test="${user.name != null}">
        <h2 align="center">Update user</h2>
    </c:if>
</div>
<div align="right">
    <input type="button" class="btn-info" value="admin page"
                                onclick="window.location.href = '/admin'">
</div>
<br/>
<div>
<%--@elvariable id="user" type="com.javaschool.mobile.dto.UserDto"--%>
<form:form action="/admin/save/users" modelAttribute="user">
    <form:hidden path="id"/>
    <form:hidden path="role" value="ROLE_USER"/>
    Name <br/> <form:input required="required" minlength="2" maxlength="44" path="name"/>
    <br>
    Surname <br/> <form:input required="required" minlength="2" maxlength="44" path="surname"/>
    <br/>
    Email <br/> <form:input path="email" required="required" pattern="[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+" maxlength="44" placeholder="email@email.ru"/>
    <br/>
    Passport<br/> <form:input path="passport" maxlength="10" placeholder="0000000000"/>
    <br/>
    Birth date<br/> <form:input path="birthDate" required="required" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"  placeholder="1900-12-31"/>
    <br/>
    Address<br/> <form:input maxlength="40" path="address"/>
    <br/>
    Temporary password <br/> <form:input type = "password" required="required" minlength="4" maxlength="44" path="password"/>
    <br/><br/>
    Enabled <form:checkbox path="enabled"></form:checkbox>
    <br/> <br/>
    <input type="submit" class="btn-success" value="CONFIRM">&ensp;&ensp;
    <input type="button" value="CANCEL" class="btn-warning" onclick="window.location.href = '/admin/users'">
    <br/> <br/>
</form:form>
</div>
</body>
</html>