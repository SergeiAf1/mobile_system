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
    <c:if test="${tariff.tariffName == null}">
        <h2 align="center">Add new tariff</h2>
    </c:if>
    <c:if test="${tariff.tariffName != null}">
        <h2 align="center">Update tariff</h2>
    </c:if>
</div>
<div align="right">
    <input type="button" class="btn-info" value="admin page"
                      onclick="window.location.href = '/admin'">
</div>
<%--@elvariable id="tariff" type="com.javaschool.mobile.dto.TariffDto"--%>
<form:form action="/admin/save/tariffs" modelAttribute="tariff">
    <form:hidden path="id"/>
    Name <br/> <form:input required="required" maxlength="44" path="tariffName"/>
    <br/>
    Price <br/> <form:input  pattern="\d+" required="required" maxlength="6" path="price"/>
    <br/><br/>
    Enabled <form:checkbox path="enabled"></form:checkbox>
    <br/> <br/>
    <div id="wrapper">
        <input type="button" class="btn-outline-light" value="Check All" onclick="check();">
        <input type="button" class="btn-outline-light" value="Uncheck All" onclick="uncheck();">
        <br/>
        <table border="2">
            <tr align="center">
                <th>Option name</th>
                <th> Choice</th>
            </tr>
            <c:forEach var="option" items="${options}">
                <tr align="center">
                    <td>${option}</td>
                    <td><form:checkbox path="options" value="${option}"></form:checkbox></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <br/>
    <input type="submit" class="btn-success" value="CONFIRM">
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