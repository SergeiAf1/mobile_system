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
<h2>Add contract</h2>
<div align="right">
    Go back to <input type="button" value="main page"
                      onclick="window.location.href = '/admin'">
</div>
<%--<form:form action="/admin/save/contracts" modelAttribute="contract">--%>
<%--<form:hidden path="id"/>--%>
<%--<form:hidden path="tariff"/>--%>
<%--<form:hidden path="phoneNumber"/>--%>
<%--<form:hidden path="enabled"/>--%>


<%--Choose user by email--%>
<%--<form:select path="contract">--%>
<%--    <option selected="selected"></option>--%>
<%--    <c:forEach var="contract" items="${contracts}">--%>
<%--        &lt;%&ndash;<form:hidden path="${user.role}"></form:hidden>&ndash;%&gt;--%>
<%--        <form:option value="${contract}"> ${contract.phoneNumber}</form:option>--%>
<%--    </c:forEach>--%>
<%--</form:select>--%>

<%--    <input type="submit" value="CONFIRM">--%>
<%--</form:form>--%>
    <%--<div>--%>
<%--        <form:form action="/admin/save/users" modelAttribute="user">--%>
<%--            <form:hidden path="id"/>--%>
<%--            <form:hidden path="name"/>--%>
<%--            <form:hidden path="surname"/>--%>
<%--            <form:hidden path="email"/>--%>
<%--            <form:hidden path="passport"/>--%>
<%--            <form:hidden path="birthDate"/>--%>
<%--            <form:hidden path="id"/>--%>
<%--            <form:hidden path="id"/>--%>
    <%--        &lt;%&ndash;    <form:hidden path="role"/>&ndash;%&gt;--%>
    <%--        Name <form:input path="name"/>--%>
    <%--        <br> <br>--%>
    <%--        Surname <form:input path="surname"/>--%>
    <%--        <br/> <br/>--%>
    <%--        Email <form:input path="email" placeholder="email@email.ru"/>--%>
    <%--        <br/> <br/>--%>
    <%--        Passport <form:input path="passport" placeholder="0000000000"/>--%>
    <%--        <br/> <br/>--%>
    <%--        Birth date <form:input path="birthDate" placeholder="1900-12-31"/>--%>
    <%--        <br/> <br/>--%>
    <%--        Address <form:input path="address"/>--%>
    <%--        <br/> <br/>--%>
    <%--        Temporary password <form:input type = "password" path="password"/>--%>
    <%--        <br/> <br/>--%>
    <%--        Enabled <form:checkbox path="enabled"></form:checkbox>--%>
    <%--        <br/> <br/>--%>
    <%--        <input type="submit" value="CONFIRM">--%>
    <%--        <br/> <br/>--%>
    <%--    </form:form>--%>
    <%--</div>--%>
<br/>
</body>
</html>