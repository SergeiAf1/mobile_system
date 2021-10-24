<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet">
<br>
<h2>
    All Users
</h2>
<div align="right">
    Go back to <input type="button" value="admin page"
                                onclick="window.location.href = '/admin'">
</div>

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
    #myInput, #email{
        width: 25%;
    }

    #myTable {
        border-collapse: collapse; /* Свернуть границы */
        width: 100%; /* Полная ширина */
        border: 1px solid #ddd; /* Добавить серую границу */
        font-size: 18px; /* Увеличить размер шрифта */
    }

    #myTable th, #myTable td {
        text-align: left; /* Выравнивание текста по левому краю */
        padding: 12px; /* Добавить отступ */
    }

    #myTable tr {
        /* Добавить нижнюю границу для всех строк таблицы */
        border-bottom: 1px solid #ddd;
    }

    #myTable tr.header, #myTable tr:hover {
        /* Добавить серый цвет фона для заголовка таблицы и при наведении курсора мыши */
        /*background-color: #f1f1f1;*/
    }
</style>
<input type="button" value="Add new user"
       onclick="window.location.href = '/admin/add/users'"/>
<br><br>
<div>
    <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search user by phone number">
    <input type="text" id="email" onkeyup="myFunctionE()" placeholder="Search user by email">
</div>
<br/>
<table id="myTable" border="2">
    <tr class="header">
        <th>Phone number</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Passport</th>
        <th>Birth date</th>
        <th>Address</th>
        <th>Enabled</th>
        <th></th>
    </tr>
    <c:forEach var="user" items="${users}">
        <c:url var="updateButton" value="/admin/update/users">
            <c:param name="user_id" value="${user.id}"></c:param>
        </c:url>
        <c:url var="addContractButton" value="/admin/addcontract/users">
            <c:param name="user_id" value="${user.id}"></c:param>
        </c:url>
        <tr>
            <td>
                <c:forEach var="contract" items="${user.contracts}">
                    <li>
                            ${contract.phoneNumber}
                    </li>
                </c:forEach>
            </td>
            <td align="center">${user.name}</td>
            <td align="center">${user.surname}</td>
            <td align="center">${user.email}</td>
            <td align="center">${user.passport}</td>
            <td align="center">${user.birthDate}</td>
            <td align="center">${user.address}</td>
            <td align="center">${user.enabled}</td>
            <td align="center">
                <input type="button" value="Update" onclick="window
                        .location.href = '${updateButton}'"/>
            </td>
            <td align="center">
                <input type="button" value="Add contract" onclick="window
                        .location.href = '${addContractButton}'"/>
            </td>
        </tr>
    </c:forEach>
</table>
<br />

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
            td = tr[i].getElementsByTagName("td")[3];
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