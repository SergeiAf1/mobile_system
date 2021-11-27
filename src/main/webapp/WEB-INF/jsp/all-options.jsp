<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: #ffa6fc" class="modal-body">
<style>
    #myTable {
        width: 100%; /* Полная ширина */
        border: 1px solid #ddd; /* Добавить серую границу */
        font-size: 18px; /* Увеличить размер шрифта */
    }

    #myTable th {
        text-align: center; /* Выравнивание текста по левому краю */
        padding: 1px; /* Добавить отступ */
    }

    #myTable tr.header {
        /* Добавить серый цвет фона для заголовка таблицы и при наведении курсора мыши */
        background-color: #f1f1f1;
    }
</style>
<h2 align="center">
    All Options
</h2>
<div align="right">
    <input type="button" class="btn-info" value="main page"
           onclick="window.location.href = '/user'">
</div>
<br/>
<table id="myTable" class="table-hover" border="2">
    <thead>
    <tr class="header" align="center">
        <th>Option name</th>
        <th width="180">Price</th>
        <th width="200">Connection price</th>
        <th>Dependent options</th>
        <th>Incompatible options</th>
    </tr>
    </thead>
    <c:forEach var="option" items="${options}">
        <tr align="center">
            <td>${option.name}</td>
            <td>${option.price}</td>
            <td>${option.connectionPrice}</td>
            <td align="left">
                <c:forEach items="${option.dependentOptions}" var="depopt">
                    <li>
                            ${depopt}
                    </li>
                </c:forEach>
            </td>
            <td align="left">
                <c:forEach items="${option.incompatibleOptions}" var="depopt">
                    <li>
                            ${depopt}
                    </li>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>