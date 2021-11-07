<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet" class="popover-body">
<br/>
<style>
    /*#myInput {*/
    /*    !*background-image: url('/css/searchicon.png'); !* Добавить значок поиска для ввода *!*!*/
    /*    background-position: 10px 12px; !* Расположите значок поиска *!*/
    /*    background-repeat: no-repeat; !* Не повторяйте изображение значка *!*/
    /*    width: 100%; !* Полная ширина *!*/
    /*    font-size: 16px; !* Увеличить размер шрифта *!*/
    /*    padding: 12px 20px 12px 40px; !* Добавить немного отступов *!*/
    /*    border: 1px solid #ddd; !* Добавить серую границу *!*/
    /*    margin-bottom: 12px; !* Добавить некоторое пространство под входом *!*/
    /*}*/
    /*#myInput, #email {*/
    /*    width: 25%;*/
    /*}*/

    #myTable {
        /*border-collapse: collapse; !* Свернуть границы *!*/
        width: 100%; /* Полная ширина */
        border: 1px solid #ddd; /* Добавить серую границу */
        font-size: 18px; /* Увеличить размер шрифта */
    }

    #myTable th{
        text-align: center; /* Выравнивание текста по левому краю */
        padding: 1px; /* Добавить отступ */
    }

    #myTable tr {
        /* Добавить нижнюю границу для всех строк таблицы */
        border-bottom: 1px solid #ddd;
    }

    #myTable tr.header{
        /* Добавить серый цвет фона для заголовка таблицы и при наведении курсора мыши */
        background-color: #f1f1f1;
    }
</style>
<h2 align="center">
    All Tariffs
</h2>
<div align="right">
    <input class="btn-info" type="button" value="admin page"
                      onclick="window.location.href = '/admin'">
</div>

<br>
<input style="width: 10%" type="button" class="btn-outline-primary" value="Add new Tariff"
       onclick="window.location.href = '/admin/add/tariffs'"/>
<br>
<br>
<table class="table table-hover" id="myTable" border="2">
    <tr class="header" align="center">
        <th>Tariff name</th>
        <th>Price</th>
        <th>Available options</th>
        <th>Enabled</th>
        <th>Edit</th>
    </tr>
    <c:forEach var="tariff" items="${tariffs}">
        <c:url var="updateButton" value="/admin/update/tariffs">
            <c:param name="tariff_id" value="${tariff.id}"></c:param>
        </c:url>
        <%--        <c:url var="deleteButton" value="/admin/delete/tariffs" >--%>
        <%--            <c:param name="tariff_id" value="${tariff.id}"></c:param>--%>
        <%--        </c:url>--%>
        <tr>
            <td align="center">${tariff.tariffName}</td>
            <td align="center">${tariff.price}</td>
                <%--            <td>--%>
                <%--                <c:forEach var="option" items="${tariff.options}">--%>
                <%--                    <li>--%>
                <%--                        ${option}--%>
                <%--                    </li>--%>
                <%--                </c:forEach>--%>
                <%--            </td>--%>
            <td><p align="center"><a href="javascript:flipflop('${tariff.tariffName}');">Options</a></p>
                <ul id="${tariff.tariffName}" style="display: none;">
                    <c:forEach var="option" items="${tariff.options}">
                        <li>${option}</li>
                    </c:forEach>
                </ul>
            </td>
            <c:if test="${tariff.enabled == true}">
                <td align="center">Yes</td>
            </c:if>
            <c:if test="${tariff.enabled == false}">
                <td align="center" style="background-color: fuchsia">No</td>
            </c:if>
            <td align="center">
                <input type="button" class="btn-outline-light" value="Update" formmethod="" onclick="window
                        .location.href = '${updateButton}'"/>
            </td>
                <%--            <td>--%>
                <%--                <input type="button" value="Delete" onclick="window--%>
                <%--                        .location.href = '${deleteButton}'"/>--%>
                <%--            </td>--%>
        </tr>
    </c:forEach>
</table>
<br/>
<script language="JavaScript">
    function flipflop(id) {
        element = document.getElementById(id);
        if (element)
            element.style.display = element.style.display == "none" ? "" : "none";
    }
</script>
</body>
</html>