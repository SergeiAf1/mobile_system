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
<style>
    #myInput, #email, #phoneNumber {
        width: 25%;
    }

    #myTable {
        /*border-collapse: collapse; !* Свернуть границы *!*/
        width: 100%; /* Полная ширина */
        border: 1px solid #ddd; /* Добавить серую границу */
        font-size: 18px; /* Увеличить размер шрифта */
    }

    #myTable th, #myTable td {
        text-align: center; /* Выравнивание текста по левому краю */
        padding: 8px; /* Добавить отступ */
    }

    #myTable tr {
        /* Добавить нижнюю границу для всех строк таблицы */
        border-bottom: 1px solid #ddd;
    }
</style>
<br>
<c:if test="${users.get(0) == null}">

    <h2 align="center">
        Found User
    </h2>
    <br/>
    <div align="right">
        <input type="button" class="btn-info" value="admin page"
               onclick="window.location.href = '/admin'">
    </div>
    <br/>
    <input type="button" class="btn-outline-primary" value="All users"
           onclick="window.location.href = '/admin/users'">
    <h3>
        <br>
        &nbsp &nbsp User with phone number "${phoneNumber}" not found
    </h3>
    <style>#hide{display: none}</style>

<%--    <script>--%>
<%--        $('#hide').hide();--%>
<%--    </script>--%>
</c:if>
<c:if test="${users.size() > 1}">
<h2 align="center">
    All Users
</h2>
<div align="right">
    <input type="button" class="btn-info" value="admin page"
           onclick="window.location.href = '/admin'">
</div>

<br>
<input type="button" class="btn-outline-primary" value="Add new user"
       onclick="window.location.href = '/admin/add/users'"/>
<br><br>
<div>
        <%--    <input type="text" id="myInput" style="background-color: #ffccf6" onkeyup="myFunction()"--%>
        <%--           placeholder="Search user by phone number on page">--%>
        <%--    <input type="text" id="email" style="background-color: #ffccf6" onkeyup="myFunctionE()"--%>
        <%--           placeholder="Search user by email">--%>
    <form action="/admin/users/phoneNumber">
        <input id="phoneNumber" style="background-color: #ffccf6" required="required" pattern="9([0-9]{9})"
               name="phoneNumber"
               placeholder="Search user by phone number in DB">
        <input type="submit" style="background-color: #8cff81" class="btn-outline-success" value="Submit"/>
    </form>
    </c:if>
    <c:if test="${(users.size() == 1) && (users.get(0) != null)}">
        <h2 align="center">
            Found User
        </h2>
        <div align="right">
            <input type="button" class="btn-info" value="admin page"
                   onclick="window.location.href = '/admin'">
        </div>
        <br/>
        <input type="button" class="btn-outline-primary" value="All users"
               onclick="window.location.href = '/admin/users'">
        <br/>
    </c:if>
</div>
<br/>
<div id="hide" >
    <table id="myTable" border="2">
        <thead style="background-color: #f1f1f1">
        <tr>
            <th>Phone number</th>
            <th>Name</th>
            <th>Surname</th>
            <th>Email</th>
            <th>Passport</th>
            <th>Birth date</th>
            <th>Address</th>
            <th>Enabled</th>
            <th>Edit</th>
        </tr>
        </thead>
        <c:forEach var="user" items="${users}">
            <c:url var="updateButton" value="/admin/update/users">
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
                <c:if test="${user.enabled == true}">
                    <td>Yes</td>
                </c:if>
                <c:if test="${user.enabled == false}">
                    <td style="background-color: fuchsia">No</td>
                </c:if>
                <td align="center">
                    <input type="button" class="btn-outline-light" value="Update" onclick="window
                            .location.href = '${updateButton}'"/>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br/>
</div>
<%--<script>--%>

<%--    function myFunction() {--%>
<%--        // Объявить переменные--%>
<%--        var input, filter, table, tr, td, i, txtValue;--%>
<%--        input = document.getElementById("myInput");--%>
<%--        filter = input.value.toUpperCase();--%>
<%--        table = document.getElementById("myTable");--%>
<%--        tr = table.getElementsByTagName("tr");--%>

<%--        // Перебирайте все строки таблицы и скрывайте тех, кто не соответствует поисковому запросу--%>
<%--        for (i = 0; i < tr.length; i++) {--%>
<%--            td = tr[i].getElementsByTagName("td")[0];--%>
<%--            if (td) {--%>
<%--                txtValue = td.textContent || td.innerText;--%>
<%--                if (txtValue.toUpperCase().indexOf(filter) > -1) {--%>
<%--                    tr[i].style.display = "";--%>
<%--                } else {--%>
<%--                    tr[i].style.display = "none";--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>

<%--    function myFunctionE() {--%>
<%--        // Объявить переменные--%>
<%--        var input, filter, table, tr, td, i, txtValue;--%>
<%--        input = document.getElementById("email");--%>
<%--        filter = input.value.toUpperCase();--%>
<%--        table = document.getElementById("myTable");--%>
<%--        tr = table.getElementsByTagName("tr");--%>

<%--        // Перебирайте все строки таблицы и скрывайте тех, кто не соответствует поисковому запросу--%>
<%--        for (i = 0; i < tr.length; i++) {--%>
<%--            td = tr[i].getElementsByTagName("td")[3];--%>
<%--            if (td) {--%>
<%--                txtValue = td.textContent || td.innerText;--%>
<%--                if (txtValue.toUpperCase().indexOf(filter) > -1) {--%>
<%--                    tr[i].style.display = "";--%>
<%--                } else {--%>
<%--                    tr[i].style.display = "none";--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>