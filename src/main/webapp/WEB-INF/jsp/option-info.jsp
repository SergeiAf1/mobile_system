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
<style>
    #myTable {
        width: 80%; /* Полная ширина */
        border: 1px solid #ddd; /* Добавить серую границу */
        font-size: 18px; /* Увеличить размер шрифта */
    }
    #myTable tr.header{
        background-color: #f1f1f1;
    }
    #myTable td, #myTable th{
        /*text-align: center; !* Выравнивание текста по левому краю *!*/
        padding: 4px; /* Добавить отступ */
    }
</style>
<br>
<h2 align="center">You can choose options</h2>
<div align="right">
    <input type="button" class="btn-primary" value="main page"
           onclick="window.location.href = '/user'">
</div>
<br/><br/>
<div>
    <table border="2" class="table table-hover" id="myTable">
        <%--@elvariable id="contract" type=""--%>
        <form:form action="/user/save/contracts" modelAttribute="contract">
        <form:hidden path="id"/>
        <form:hidden path="phoneNumber"/>
        <form:hidden path="tariffName"/>
        <form:hidden path="enabled"/>
        <form:hidden path="userEmail"/>
        <form:hidden path="blockedByUser"/>
        <tr align="center" class="header">
            <th width="170">Option name</th>
            <th width="80">Price</th>
            <th width="130">Connection price</th>
            <th width="150">Dependent options</th>
            <th width="150">Incompatible options</th>
            <th width="80">Choice</th>
        </tr>
        <c:forEach items="${options}" var="option">
            <tr align="center">
                <td>${option.name}</td>
                <td>${option.price}</td>
                <td>${option.connectionPrice}</td>
                <td align="left">
                    <c:forEach items="${option.dependentOptions}" var="optd">
                        <li>${optd}</li>
                    </c:forEach>
                </td>
                <td align="left">
                    <c:forEach items="${option.incompatibleOptions}" var="opt">
                        <li>${opt}</li>
                    </c:forEach>
                </td>
                <td><form:checkbox path="options" value="${option.name}"></form:checkbox></td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <input type="submit" class="btn-success" value="CONFIRM">&ensp;&ensp;
    <input type="button" value="CANCEL" class="btn-warning" onclick="window.location.href = '/user'">
    </form:form>
</div>
</body>
</html>