<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet" class="popover-body">
<br/>
<h2 align="center">
    All Contracts
</h2>
<div align="right">
    <input type="button" class="btn-info" value="admin page"
                      onclick="window.location.href = '/admin'">
</div>
<input type="button" class="btn-outline-primary" value="Add Contract"
       onclick="window.location.href = '/admin/add/contracts'"/>
<br><br>
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
    #myInput, #email {
        width: 25%;
    }

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
    /*, #myTable tr:hover*/
    #myTable tr.header {
        /* Добавить серый цвет фона для заголовка таблицы и при наведении курсора мыши */
        background-color: #f1f1f1;
    }
</style>
<div>
    <input type="text" id="myInput" style="background-color: #ffccf6" onkeyup="myFunction()"
           placeholder="Search contract by phone number">
    <input type="text" id="email" style="background-color: #ffccf6" onkeyup="myFunctionE()"
           placeholder="Search contract by user email">
</div>
<br/>
<%--<input type="number" id="myInput" onkeyup="myFunction()" placeholder="Search phone numbers..">--%>
<table id="myTable" border="2">
    <tr class="header">
        <th>Phone number</th>
        <th>User email</th>
        <th>Tariff name</th>
        <th>Options</th>
        <th>Blocked</th>
        <th> Edit</th>
    </tr>
    <c:forEach var="contract" items="${contracts}">
        <c:url var="updateButton" value="/admin/update/contracts">
            <c:param name="contract_id" value="${contract.id}"></c:param>
        </c:url>
        <tr>
                <%--            <td><form:hidden path="user"></form:hidden></td>--%>

            <td align="center" input type="number">${contract.phoneNumber}</td>
            <td align="center">${contract.userEmail}</td>
            <td align="center">${contract.tariffName}</td>
            <td align="left">
                <c:forEach var="option" items="${contract.options}">
                    <li>
                            ${option}
                    </li>
                </c:forEach>
            </td>
            <c:if test="${contract.enabled == true}">
                <td align="center">No</td>
            </c:if>
            <c:if test="${contract.enabled == false}">
                <td align="center" style="background-color: fuchsia">Yes</td>
            </c:if>
                <%--            <td align="center">${contract.enabled}</td>--%>
            <td align="center">
                <input type="button" class="btn-outline-light" value="Update" onclick="window
                        .location.href = '${updateButton}'"/>
            </td>
        </tr>
    </c:forEach>
</table>
<br/>

<script>

    function myFunction() {
        // Объявить переменные
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");

        // Перебирайте все строки таблицы и скрывайте тех, кто не соответствует поисковому запросу
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    function myFunctionE() {
        // Объявить переменные
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("email");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");

        // Перебирайте все строки таблицы и скрывайте тех, кто не соответствует поисковому запросу
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>
</body>
</html>