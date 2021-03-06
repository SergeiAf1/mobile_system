<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<style>
    #myTable {
        width: 50%; /* Полная ширина */
        border: 1px solid #ddd; /* Добавить серую границу */
        font-size: 18px; /* Увеличить размер шрифта */
    }

    #myTable tr.header {
        background-color: #f1f1f1;
    }

    #myTable td, #myTable th {
        /*text-align: center; !* Выравнивание текста по левому краю *!*/
        padding: 4px; /* Добавить отступ */
    }
</style>
<body style="background-color: #ffa6fc" class="modal-body">
<div class="col-sm-12">
    <c:if test="${contract.phoneNumber == null}">
        <h2 align="center">Add new contract</h2>
    </c:if>
    <c:if test="${contract.phoneNumber != null}">
        <h2 align="center">Update contract</h2>
    </c:if>
</div>
<div align="right">
    <input type="button" class="btn-info" value="admin page"
           onclick="window.location.href = '/admin'">
</div>
<%--@elvariable id="contract" type="com.javaschool.mobile.dto.ContractDto"--%>
<form:form action="/admin/save/contracts" modelAttribute="contract">
    <form:hidden path="id"/>
    <form:hidden path="blockedByUser"/>
    <form:hidden path="options"/>
    <form:hidden path="phoneNumber"/>
    Phone number:   ${contract.phoneNumber}
<%--    <form:input required="required" pattern="9([0-9]{9})" path="phoneNumber"--%>
<%--                                  placeholder="9000000000"/>--%>
    <br/> <br/>
    Enabled <form:checkbox path="enabled"></form:checkbox>
    <br/>
    <div>
        Choose user by email <br/>
        <form:select path="userEmail">
            <option selected="selected"></option>
            <c:forEach var="user" items="${users}">
                <form:option value="${user.email}"> ${user.email}</form:option>
            </c:forEach>
        </form:select>
    </div>
    <br/>
    <%--    <div id="wrapper">--%>
    <%--        <input type="button" class="btn-outline-light" value="Uncheck All" onclick="uncheck();">--%>
    <table border="2" class="table table-hover" id="myTable">
        <thead>
        <tr align="center" class="header" style="background-color: #f1f1f1">
            <th width="300">Tariff name</th>
            <th width="150"> Choice</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="tariff" items="${tariffs}">
            <tr align="center">
                <td>${tariff.tariffName}</td>
                <td><form:radiobutton path="tariffName" required="required" value="${tariff.tariffName}"></form:radiobutton></td>
            </tr>
            <%--                <tr>--%>
            <%--                    <td>--%>
            <%--&lt;%&ndash;                        Available options :&ndash;%&gt;--%>
            <%--&lt;%&ndash;                        <c:forEach var="option" items="${tariff.options}">&ndash;%&gt;--%>
            <%--&lt;%&ndash;                            <li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;                                    ${option}&ndash;%&gt;--%>
            <%--&lt;%&ndash;                                <form:checkbox path="options" value="${option}" ></form:checkbox>&ndash;%&gt;--%>
            <%--&lt;%&ndash;                            </li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;                        </c:forEach>&ndash;%&gt;--%>
            <%--                    <p align="center"><a href="javascript:flipflop('${tariff.tariffName}');">Connected options</a></p>--%>
            <%--                        <ul id="${tariff.tariffName}" style="display: none;">--%>
            <%--                            <c:forEach var="option" items="${tariff.options}">--%>
            <%--                                <li>${option}   <form:checkbox path="options" value="${option}" ></form:checkbox></li>--%>
            <%--                            </c:forEach>--%>
            <%--                        </ul>--%>

            <%--                    </td>--%>
            <%--                </tr>--%>
        </c:forEach>
        </tbody>
    </table>
    <%--    </div>--%>
    <input type="submit" class="btn-success" value="CONFIRM">&ensp;&ensp;
    <input type="button" value="CANCEL" class="btn-warning" onclick="window.location.href = '/admin/contracts'">
    <br/> <br/>
</form:form>
<script>
    function check() {
        var check = document.getElementsByTagName('input');
        for (var i = 0; i < check.length; i++) {
            if (check[i].type == 'checkbox') {
                check[i].checked = true;
            }
        }
    }

    function uncheck() {
        var uncheck = document.getElementsByTagName('input');
        for (var i = 0; i < uncheck.length; i++) {
            if (uncheck[i].type == 'checkbox') {
                uncheck[i].checked = false;
            }
        }
    }

    function flipflop(id) {
        element = document.getElementById(id);
        if (element)
            element.style.display = element.style.display == "none" ? "" : "none";
    }
</script>
</body>
</html>