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
        width: 50%; /* Полная ширина */
        border: 1px solid #ddd; /* Добавить серую границу */
        font-size: 18px; /* Увеличить размер шрифта */
    }
    #myTable tr.header{
        background-color: #f1f1f1;
    }
    #myTable td, #myTable th{
        text-align: center; /* Выравнивание текста по левому краю */
        padding: 4px; /* Добавить отступ */
    }
</style>
<br/>
<h2 align="center">You can choose a new Tariff</h2>
<div align="right">
    <input type="button" class="btn-primary" value="main page"
                                onclick="window.location.href = '/user'">
</div>
<%--@elvariable id="contract" type="com.javaschool.mobile.dto.ContractDto"--%>
<form:form action="/user/save/contracts" modelAttribute="contract">
    <form:hidden path="id"/>
    <form:hidden path="phoneNumber"/>
    <form:hidden path="enabled"/>
    <form:hidden path="options"/>
    <form:hidden path="userEmail"/>
    <form:hidden path="blockedByUser"/>
    <br/> <br/>
<%--    <form:checkbox path="blockedByUser"></form:checkbox>--%>
        <table border="2" class="table table-hover"  id="myTable">
            <tr class="header" align="center">
                <th>Tariff name</th>
                <th>Tariff price</th>
                <th> Choice</th>
            </tr>
            <c:forEach var="tariff" items="${tariffs}">
                <tr align="center">
                    <td>${tariff.tariffName}</td>
                    <td>${tariff.price}</td>
                    <td><form:radiobutton path="tariffName" value="${tariff.tariffName}"></form:radiobutton></td>
                </tr>
            </c:forEach>
        </table>
    <input type="submit" class="btn-success" value="CONFIRM">&ensp;&ensp;
    <input type="button" value="CANCEL" class="btn-warning" onclick="window.location.href = '/user'">
    <br/> <br/>
</form:form>
</body>
</html>