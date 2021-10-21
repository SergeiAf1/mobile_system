<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet">
<br>
<br>
<div align="right">
    <input type="button" value="LOG OUT"
           onclick="window.location.href = '/logout'">
</div>
<br>
<h1 align="center">
    Hello ${user.name} !!!
</h1>
<br>
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

    /*#myTable {*/
    /*    border-collapse: collapse; !* Свернуть границы *!*/
    /*    width: 100%; !* Полная ширина *!*/
    /*    border: 1px solid #ddd; !* Добавить серую границу *!*/
    /*    font-size: 18px; !* Увеличить размер шрифта *!*/
    /*}*/

    /*#myTable th, #myTable td {*/
    /*    text-align: left; !* Выравнивание текста по левому краю *!*/
    /*    padding: 12px; !* Добавить отступ *!*/
    /*}*/

    /*#myTable tr {*/
    /*    !* Добавить нижнюю границу для всех строк таблицы *!*/
    /*    border-bottom: 1px solid #ddd;*/
    /*}*/

    /*#myTable tr.header, #myTable tr:hover {*/
    /*    !* Добавить серый цвет фона для заголовка таблицы и при наведении курсора мыши *!*/
    /*    !*background-color: #f1f1f1;*!*/
    }
</style>
<br>
<div align="center">
    <security:authorize access="hasRole('ADMIN')">
        Go to ADMIN PAGE <input type="button" value="ADMIN PAGE"
                                onclick="window.location.href = '/admin'">
    </security:authorize>
</div>
<h1>${user.name} ${user.surname}</h1>
<h3>My contracts</h3>

<table id="myTable" border="2">
    <tr class="header" align="center">
        <th>Phone number</th>
        <th>Tariff</th>
        <th>Tariff price</th>
        <th>Options</th>
        <th>Option price</th>
        <th>Actions</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="contract" items="${user.contracts}">
        <c:url var="updateTariff" value="/user/update/contract">
            <c:param name="contract_id" value="${contract.id}"></c:param>
        </c:url>
        <c:url var="updateOptions" value="/user/update/options">
            <c:param name="contract_id" value="${contract.id}"></c:param>
        </c:url>
        <tr>
            <td align="center">${contract.phoneNumber}</td>
            <td align="center">${contract.tariff.tariffName}</td>
            <td align="center">${contract.tariff.price}</td>
            <td>
                <c:forEach var="option" items="${contract.options}">
                    <li>${option.name}</li>
                </c:forEach>
            </td>
            <td>
                <c:forEach var="option" items="${contract.options}">
                <li>${option.price}</li>
                </c:forEach></td>
            <td align="center">
                <input type="button" value="Change tariff" onclick="window
                        .location.href = '${updateTariff}'"/>
            </td>
            <td align="center">
                <input type="button" value="Change options" onclick="window
                        .location.href = '${updateOptions}'"/>
            </td>
        </tr>

    </c:forEach>
</table>
<br>
<input type="button" style="background-color: darkorchid" value="All Tariffs and Options"
       onclick="window.location.href = '/user/tariffs'">
<br>
</body>
</html>