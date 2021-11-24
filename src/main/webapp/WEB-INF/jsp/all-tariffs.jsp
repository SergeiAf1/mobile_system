<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet" class="modal-body">
<style>

    #myTable, #oldtariffs {
        /*border-collapse: collapse; !* Свернуть границы *!*/
        width: 100%; /* Полная ширина */
        border: 1px solid #ddd; /* Добавить серую границу */
        font-size: 18px; /* Увеличить размер шрифта */
    }

    #myTable th {
        text-align: center; /* Выравнивание текста по левому краю */
        padding: 1px; /* Добавить отступ */
    }

    #myTable td {
        padding: 1px; /* Добавить отступ */
    }

    #myTable tr.header {
        /* Добавить серый цвет фона для заголовка таблицы и при наведении курсора мыши */
        background-color: #f1f1f1;
    }
</style>
<br>
<h2 align="center">
    All Tariffs
</h2>
<div align="right">
    <input type="button" class="btn-info" value="main page"
           onclick="window.location.href = '/user'">
</div>
<br>
<table id="myTable" class="table-hover" width="600" border="1">
    <thead>
    <tr align="center" class="header">
        <th width="250">Tariff</th>
        <th width="150">Price</th>
        <th width="300">Available options</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="tariff" items="${tariffs}">
        <tr>
            <td align="center">${tariff.tariffName}</td>
            <td align="center">${tariff.price}</td>
            <td><p align="center"><a href="javascript:flipflop('${tariff.tariffName}');">Options</a></p>
                <ul id="${tariff.tariffName}" style="display: none;">
                    <c:forEach var="option" items="${tariff.options}">
                        <li>${option}</li>
                    </c:forEach>
                </ul>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br/>
<p style="font-size: x-large" align="center"><a href="javascript:flipflop('oldtariffs');">Deprecated tariffs</a></p>
<table id="oldtariffs" class="table-hover" width="600" border="2" style="display: none;">
    <thead style="background-color: #f1f1f1">
    <tr align="center">
        <th width="250">Name</th>
        <th width="150">Price</th>
        <th width="300">Available options</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="tariff" items="${oldtariffs}">
        <tr align="center" class="header">
            <td>${tariff.tariffName}</td>
            <td>${tariff.price}</td>
            <td align="left">
                <c:forEach items="${tariff.options}" var="option">
                    <li>${option}</li>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br/><br/><br/>
<script language="JavaScript">
    function flipflop(id) {
        element = document.getElementById(id);
        if (element)
            element.style.display = element.style.display == "none" ? "" : "none";
    }
</script>
</body>
</html>