<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body style="background-color: violet">
<h2>
    All Tariffs
</h2>
<br>
<table>
    <tr>
        <th>Tariff name</th>
        <th>Price</th>
        <th>Available options</th>
        <th>Update button</th>
        <th>Delete Button</th>
    </tr>
    <c:forEach var="tariff" items="${tariffs}">
        <c:url var="updateButton" value="/admin/updateInfo">
            <c:param name="tariffId" value="${tariff.id}"></c:param>
        </c:url>
        <c:url var="deleteButton" value="/deleteTariff">
            <c:param name="tariffId" value="${tariff.id}"></c:param>
        </c:url>


        <tr>
            <td>${tariff.tariffName}</td>
            <td>${tariff.price}</td>
            <td>
                <c:forEach var="option" items="${tariff.options}">
                    <li>
                        ${option.name}
                    </li>
                </c:forEach>
            </td>

            <td>
                <input type="button" value="Update" onclick="window
                        .location.href = '${updateButton}'"/>
                <input type="button" value="Delete" onclick="window
                        .location.href = '${deleteButton}'"/>
            </td>
        </tr>
    </c:forEach>
</table>
<br />
<input type="button" value="Add Tariff"
       onclick="window.location.href = '/admin/addNewTariff'"/>
</body>
</html>