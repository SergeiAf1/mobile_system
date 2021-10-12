<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body style="background-color: fuchsia">

<br>
<br>
<br>
<div align="right">
    <input type="button" value="LOG OUT"
           onclick="window.location.href = '/logout'">
</div>
<br>
<br>
<h1 align="center">
    Hello admin !!!
</h1>

<div align="center">
    <input type="button" value="GO TO USER PAGE"
           onclick="window.location.href = '/users'">
</div>
<br>
All Users

<table>
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Enabled</th>
    </tr>
    <c:forEach var="users" items="${users}">
        <tr>
            <td>${users.name}</td>
            <td>${users.surName}</td>
            <td>${users.email}</td>
            <td>${users.enabled}</td>
            <td>${users.contracts}</td>

        </tr>
    </c:forEach>
</table>
<br>
All Contracts
<table>
    <tr>
        <th>Tariff</th>
        <th>PhoneNumber</th>
    </tr>
    <c:forEach var="users" items="${users}">
        <c:forEach var="contracts" items="${users.contracts}">
            <tr>
                <td>${contracts.tariff}</td>
                <td>${contracts.phoneNumber}</td>
                <td>${contracts.options}</td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>
</body>
</html>