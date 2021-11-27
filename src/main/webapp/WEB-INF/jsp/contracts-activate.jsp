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
<body style="background-color: #ffa6fc" class="popover-body">
<style>
    #myInput, #email, #phoneNumber {
        width: 25%;
    }
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
        background-color: #f1f1f1;
    }
</style>
<br/>
<div align="right">
    <input type="button" class="btn-info" value="admin page"
           onclick="window.location.href = '/admin'">
</div>
        <h2 align="center">
            All free Contracts</h2>
<input type="button" class="btn-outline-primary" value="All contracts"
       onclick="window.location.href = '/admin/contracts'"/>
<br><br>
<div>
    <form action="/admin/contracts/phoneNumber">
        <input id="phoneNumber" style="background-color: #ffccf6" required="required" pattern="9([0-9]{9})"
               name="phoneNumber"
               placeholder="Search contract by phone number">
        <input type="submit" style="background-color: #8cff81" class="btn-outline-success" value="Submit"/>
    </form>
</div>
<br/>
<div id="hide">
    <table id="myTable" border="2">
        <tr class="header">
            <th>Phone number</th>
            <th>User email</th>
            <th>Tariff name</th>
            <th>Connected options</th>
            <th>Blocked</th>
            <th> Edit</th>
            <th>Edit options</th>
        </tr>
        <c:forEach var="contract" items="${contracts}">
            <c:url var="updateButton" value="/admin/update/contracts">
                <c:param name="contract_id" value="${contract.id}"></c:param>
            </c:url>
            <c:url var="updateOptions" value="/admin/contract/options">
                <c:param name="contract_id" value="${contract.id}"></c:param>
            </c:url>
            <tr>
                <td align="center" input type="number">${contract.phoneNumber}</td>
                <td align="center"><a href="/admin/users/email?email=${contract.userEmail}">${contract.userEmail}</a>
                </td>
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
                <td align="center">
                    <input type="button" class="btn-outline-light" value="Update" onclick="window
                            .location.href = '${updateButton}'"/>
                </td>
                <td align="center">
                    <input type="button" class="btn-outline-light" value="Set Options" onclick="window
                            .location.href = '${updateOptions}'"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<br/>
</body>
</html>