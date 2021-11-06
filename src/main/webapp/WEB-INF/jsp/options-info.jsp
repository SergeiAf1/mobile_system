<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet" class="modal-body">
<div class="col-sm-12">
    <c:if test="${option.name == null}">
        <h2 align="center">Add option</h2>
    </c:if>
    <c:if test="${option.name != null}">
        <h2 align="center">Update option</h2>
    </c:if>
</div>

<div align="right">
    Go back to <input type="button" value="admin page"
                      onclick="window.location.href = '/admin'">
</div>
<br/>
<div>
    <%--@elvariable id="option" type="com.javaschool.mobile.dto.OptionDto"--%>
    <form:form action="/admin/save/options" modelAttribute="option">
        <form:hidden path="id"/>
        <form:hidden path="dependentOptions"/>
        <form:hidden path="incompatibleOptions"/>
        Name <br><form:input required="required" minlength="2" maxlength="44" path="name"/>
        <br/>
        Price <br/> <form:input pattern="\d+" required="required" maxlength="6" path="price"/>
        <br/>
        Connection price <br/> <form:input pattern="\d+" required="required" maxlength="6"  path="connectionPrice"/>
        <br/> <br/>

        <input type="submit" value="CONFIRM">
        <br/> <br/>

    </form:form>
</div>
</body>
</html>